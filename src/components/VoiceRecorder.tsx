import React, { useState, useEffect, useRef } from 'react';
import { Mic, Square, RotateCcw } from 'lucide-react';

interface VoiceRecorderProps {
    onTranscriptChange: (text: string) => void;
    // Removed external control to allow multiple independent instances
}

const VoiceRecorder: React.FC<VoiceRecorderProps> = ({ onTranscriptChange }) => {
    const [transcript, setTranscript] = useState('');
    const [isSupported, setIsSupported] = useState(false);
    const [isRecording, setIsRecording] = useState(false);
    const recognitionRef = useRef<any>(null);

    useEffect(() => {
        if ('webkitSpeechRecognition' in window || 'SpeechRecognition' in window) {
            setIsSupported(true);
            const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition;
            recognitionRef.current = new SpeechRecognition();
            recognitionRef.current.continuous = true;
            recognitionRef.current.interimResults = true;

            recognitionRef.current.onresult = (event: any) => {
                let fullText = '';
                for (let i = 0; i < event.results.length; ++i) {
                    fullText += event.results[i][0].transcript;
                }
                setTranscript(fullText);
                onTranscriptChange(fullText);
            };

            recognitionRef.current.onerror = (event: any) => {
                console.error('Speech recognition error', event.error);
                setIsRecording(false);
            };

            recognitionRef.current.onend = () => {
                if (isRecording) {
                    setIsRecording(false);
                }
            };
        } else {
            setIsSupported(false);
        }
    }, []);
    // remove toggleRecording / clearTranscript if they were in this range in previous version? 
    // No, they are after. I need to be careful with line numbers.

    const toggleRecording = () => {
        if (isRecording) {
            recognitionRef.current?.stop();
            setIsRecording(false);
        } else {
            setTranscript('');
            onTranscriptChange('');
            recognitionRef.current?.start();
            setIsRecording(true);
        }
    };

    const clearTranscript = () => {
        setTranscript('');
        onTranscriptChange('');
    };

    if (!isSupported) {
        return <div style={{ color: 'var(--color-danger)' }}>Browser does not support Speech Recognition.</div>;
    }

    return (
        <div style={{ marginTop: '1rem', padding: '1rem', backgroundColor: 'var(--color-surface)', borderRadius: '12px', border: '1px solid var(--color-border)' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1rem' }}>
                <h3 style={{ margin: 0, fontSize: '1.2rem', color: isRecording ? 'var(--color-danger)' : 'var(--color-text)' }}>
                    {isRecording ? 'Listening...' : 'Reflect & Record'}
                </h3>
                <div style={{ display: 'flex', gap: '0.5rem' }}>
                    <button
                        onClick={toggleRecording}
                        style={{
                            backgroundColor: isRecording ? 'var(--color-danger)' : 'var(--color-surface)',
                            borderColor: isRecording ? 'transparent' : 'var(--color-border)',
                            color: isRecording ? '#fff' : 'var(--color-text)'
                        }}
                    >
                        {isRecording ? <><Square size={16} /> Stop</> : <><Mic size={16} /> Record Answer</>}
                    </button>
                    <button onClick={clearTranscript} title="Clear">
                        <RotateCcw size={16} />
                    </button>
                </div>
            </div>

            <textarea
                value={transcript}
                onChange={(e) => {
                    setTranscript(e.target.value);
                    onTranscriptChange(e.target.value);
                }}
                placeholder="Your answer will appear here... (or you can type)"
                style={{
                    width: '100%',
                    minHeight: '100px',
                    backgroundColor: 'rgba(0,0,0,0.2)',
                    border: '1px solid var(--color-border)',
                    borderRadius: '8px',
                    color: 'var(--color-text)',
                    padding: '1rem',
                    fontFamily: 'inherit',
                    resize: 'vertical'
                }}
            />
        </div>
    );
};

export default VoiceRecorder;
