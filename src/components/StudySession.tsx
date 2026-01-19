import React, { useState, useEffect, useMemo } from 'react';
import type { Case } from '../data/cases';
import { generateFeedback, type FeedbackAnalysis } from '../services/ai';
import {
    ArrowLeft, Clock, EyeOff, Play, Pause, RotateCcw, Settings, Sparkles,
    Activity, Mic, AlertTriangle, CheckCircle, BarChart2
} from 'lucide-react';
import VoiceRecorder from './VoiceRecorder';
import SettingsModal from './SettingsModal';

interface StudySessionProps {
    data: Case;
    onBack: () => void;
}

interface StudySection {
    id: string; // Unique ID for state tracking
    title: string;
    prompt?: string; // Visible text (for Challenge Questions)
    answer: string;  // Hidden/Revealable answer
    hasRecorder: boolean;
    originalIndex: number;
}

const StudySession: React.FC<StudySessionProps> = ({ data, onBack }) => {
    // Timer State
    const [seconds, setSeconds] = useState(0);
    const [isActive, setIsActive] = useState(false);

    // Global Settings
    const [apiKey, setApiKey] = useState(localStorage.getItem('gemini_api_key') || '');
    const [isSettingsOpen, setIsSettingsOpen] = useState(false);

    // Pre-process sections to group Question + Answer
    const processedSections: StudySection[] = useMemo(() => {
        const result: StudySection[] = [];

        for (let i = 0; i < data.sections.length; i++) {
            const current = data.sections[i];
            const next = data.sections[i + 1];

            // Skip presentation (handled separately in UI)
            if (current.title.toLowerCase().includes('chief complaint') || current.title.toLowerCase().includes('presentation')) {
                continue;
            }

            const isChallengeQuestion = current.title.toLowerCase().includes('challenge question');
            const isNextAnswer = next?.title.toLowerCase().includes('challenge answer');

            if (isChallengeQuestion && isNextAnswer) {
                // Merge them
                result.push({
                    id: `${i}-merged`,
                    title: current.title, // e.g. "Challenge Question #1"
                    prompt: current.content, // The question text
                    answer: next.content,    // The answer text
                    hasRecorder: true,
                    originalIndex: i
                });
                i++; // Skip the next one (Answer) since we merged it
            } else {
                // Standard Section
                // Check if it's a "Question-style" header like "+ What is..."
                // Or standard "Relevant History"

                const t = current.title.toLowerCase();
                const isQuestionHeader = current.title.trim().startsWith('+');
                const isHistoryOrExam = t.includes('relevant history') || t.includes('relevant physical');
                const isDiagnosis = t.includes('diagnosis');

                // Allow recording for most interactive sections
                const shouldRecord = isQuestionHeader || isHistoryOrExam || isDiagnosis || t.includes('challenge answer') || t.includes('challenge question');

                result.push({
                    id: `${i}-standard`,
                    title: current.title,
                    prompt: undefined, // Standard sections usually show answer as content
                    answer: current.content,
                    hasRecorder: shouldRecord,
                    originalIndex: i
                });
            }
        }
        return result;
    }, [data]);

    // Accordion State (Set of IDs)
    const [expandedSections, setExpandedSections] = useState<Set<string>>(new Set([processedSections[0]?.id]));

    // Answer Reveal State (Set of IDs)
    const [revealedAnswers, setRevealedAnswers] = useState<Set<string>>(new Set());

    // Voice & AI State (Per-section ID)
    const [transcripts, setTranscripts] = useState<Record<string, string>>({});
    const [feedbacks, setFeedbacks] = useState<Record<string, FeedbackAnalysis | string>>({});
    const [generatingFeedbackFor, setGeneratingFeedbackFor] = useState<Set<string>>(new Set());

    useEffect(() => {
        // Reset state when data changes
        setSeconds(0);
        setIsActive(false);
        setExpandedSections(new Set([processedSections[0]?.id]));
        setRevealedAnswers(new Set());
        setTranscripts({});
        setFeedbacks({});
        setGeneratingFeedbackFor(new Set());
    }, [data, processedSections]);

    const handleSaveSettings = (key: string) => {
        localStorage.setItem('gemini_api_key', key);
        setApiKey(key);
    };

    const handleTranscriptChange = (id: string, text: string) => {
        setTranscripts(prev => ({ ...prev, [id]: text }));
    };

    const handleGetFeedback = async (id: string, sectionContent: string) => {
        const transcript = transcripts[id] || '';
        if (!transcript.trim()) return;

        setGeneratingFeedbackFor(prev => {
            const next = new Set(prev);
            next.add(id);
            return next;
        });

        const result = await generateFeedback(transcript, sectionContent, apiKey);

        setFeedbacks(prev => ({ ...prev, [id]: result }));

        setGeneratingFeedbackFor(prev => {
            const next = new Set(prev);
            next.delete(id);
            return next;
        });
    };

    // Helper to render the feedback card content
    const renderFeedbackContent = (feedback: FeedbackAnalysis | string) => {
        if (typeof feedback === 'string') {
            return <div style={{ whiteSpace: 'pre-wrap' }}>{feedback}</div>;
        }

        return (
            <div className="feedback-dashboard" style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                {/* 1. Metrics Row */}
                <div style={{ display: 'flex', gap: '1rem', flexWrap: 'wrap' }}>
                    {/* Delivery Score */}
                    <div style={{ flex: 1, minWidth: '200px', backgroundColor: 'var(--color-bg-secondary)', padding: '1rem', borderRadius: '8px', border: '1px solid var(--color-border)' }}>
                        <h5 style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-text-muted)' }}>
                            <Activity size={16} /> Delivery
                        </h5>
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                            <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                <span>Pacing:</span>
                                <strong>{feedback.delivery.wpm} WPM</strong>
                            </div>
                            <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                <span>Tone:</span>
                                <strong>{feedback.delivery.tone}</strong>
                            </div>
                            <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                <span>Conciseness:</span>
                                <strong>{feedback.delivery.concisenessScore}/10</strong>
                            </div>
                        </div>
                    </div>

                    {/* Content Score */}
                    <div style={{ flex: 1, minWidth: '200px', backgroundColor: 'var(--color-bg-secondary)', padding: '1rem', borderRadius: '8px', border: '1px solid var(--color-border)' }}>
                        <h5 style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-text-muted)' }}>
                            <BarChart2 size={16} /> Content Accuracy
                        </h5>
                        <div style={{ fontSize: '2rem', fontWeight: 'bold', color: feedback.content.score >= 4 ? 'var(--color-success)' : 'var(--color-warning)' }}>
                            {feedback.content.score}/10
                        </div>
                    </div>
                </div>

                {/* 2. Critique & Red Flags */}
                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                    {feedback.content.redFlags.length > 0 && (
                        <div style={{ padding: '0.8rem', backgroundColor: '#fee2e2', color: '#dc2626', borderRadius: '6px', border: '1px solid #fecaca' }}>
                            <h5 style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginTop: 0, marginBottom: '0.5rem' }}>
                                <AlertTriangle size={16} /> Critical Safety Issues
                            </h5>
                            <ul style={{ margin: 0, paddingLeft: '1.2rem' }}>
                                {feedback.content.redFlags.map((flag, i) => <li key={i}>{flag}</li>)}
                            </ul>
                        </div>
                    )}

                    <div>
                        <h5 style={{ marginTop: 0, marginBottom: '0.5rem' }}>Missed Concepts</h5>
                        {feedback.content.missedConcepts.length > 0 ? (
                            <ul style={{ margin: 0, paddingLeft: '1.2rem', color: 'var(--color-text-muted)' }}>
                                {feedback.content.missedConcepts.map((item, i) => <li key={i}>{item}</li>)}
                            </ul>
                        ) : (
                            <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: 'var(--color-success)' }}>
                                <CheckCircle size={16} /> Great job! You covered key points.
                            </div>
                        )}
                    </div>

                    {/* Filler Words */}
                    {feedback.delivery.fillerWords.length > 0 && (
                        <div>
                            <h5 style={{ marginTop: 0, marginBottom: '0.5rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                                <Mic size={16} /> Detected Filler Words
                            </h5>
                            <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
                                {feedback.delivery.fillerWords.map((word, i) => (
                                    <span key={i} style={{
                                        padding: '0.2rem 0.6rem',
                                        backgroundColor: 'var(--color-bg-secondary)',
                                        borderRadius: '12px',
                                        fontSize: '0.85rem',
                                        color: 'var(--color-text-muted)'
                                    }}>
                                        "{word}"
                                    </span>
                                ))}
                            </div>
                        </div>
                    )}
                </div>

                {/* 3. Golden Response Toggle */}
                <div style={{ borderTop: '1px solid var(--color-border)', paddingTop: '1rem' }}>
                    <h5 style={{ marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-accent)' }}>
                        <Sparkles size={16} style={{ display: 'inline', marginRight: '0.5rem' }} />
                        AI Refined "Golden Response"
                    </h5>
                    <div style={{
                        padding: '1rem',
                        backgroundColor: 'var(--color-bg-secondary)',
                        borderRadius: '8px',
                        fontStyle: 'italic',
                        lineHeight: '1.6',
                        borderLeft: '3px solid var(--color-accent)'
                    }}>
                        {feedback.goldenResponse}
                    </div>
                </div>
            </div>
        );
    };

    useEffect(() => {
        let interval: any = null;
        if (isActive) {
            interval = setInterval(() => {
                setSeconds(seconds => seconds + 1);
            }, 1000);
        } else if (!isActive && seconds !== 0) {
            clearInterval(interval);
        }
        return () => clearInterval(interval);
    }, [isActive, seconds]);

    const toggleTimer = () => setIsActive(!isActive);
    const resetTimer = () => {
        setIsActive(false);
        setSeconds(0);
    };

    const formatTime = (totalSeconds: number) => {
        const min = Math.floor(totalSeconds / 60);
        const sec = totalSeconds % 60;
        return `${min.toString().padStart(2, '0')}:${sec.toString().padStart(2, '0')}`;
    };

    const toggleSection = (id: string) => {
        const newExpanded = new Set(expandedSections);
        if (newExpanded.has(id)) {
            newExpanded.delete(id);
        } else {
            newExpanded.add(id);
        }
        setExpandedSections(newExpanded);
    };

    const toggleReveal = (id: string) => {
        const newRevealed = new Set(revealedAnswers);
        if (newRevealed.has(id)) {
            newRevealed.delete(id);
        } else {
            newRevealed.add(id);
        }
        setRevealedAnswers(newRevealed);
    };

    return (
        <div className="fade-in">
            {/* Header / Toolbar */}
            <div className="glass" style={{
                position: 'sticky',
                top: '1rem',
                zIndex: 100,
                padding: '1rem',
                borderRadius: '12px',
                marginBottom: '2rem',
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'center',
                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
            }}>
                <div style={{ display: 'flex', gap: '1rem' }}>
                    <button onClick={onBack}>
                        <ArrowLeft size={20} /> Back
                    </button>
                    <button onClick={() => setIsSettingsOpen(true)} title="Settings">
                        <Settings size={20} />
                    </button>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '1.5rem' }}>
                    <div className="timer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                        <Clock size={20} />
                        {formatTime(seconds)}
                    </div>
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <button onClick={toggleTimer} title={isActive ? "Pause" : "Start"}>
                            {isActive ? <Pause size={18} /> : <Play size={18} />}
                        </button>
                        <button onClick={resetTimer} title="Reset">
                            <RotateCcw size={18} />
                        </button>
                    </div>
                </div>
            </div>

            <div style={{ maxWidth: '800px', margin: '0 auto' }}>
                <h1 style={{ marginBottom: '0.5rem' }}>{data.title}</h1>
                <p style={{ color: 'var(--color-primary)', marginBottom: '2rem' }}>Oral Board Case Study</p>

                {/* Patient Presentation / Chief Complaint */}
                {data.sections.map((section, index) => {
                    if (section.title.toLowerCase().includes('chief complaint') || section.title.toLowerCase().includes('presentation')) {
                        return (
                            <div key={index} className="card fade-in" style={{
                                marginBottom: '2rem',
                                borderLeft: '4px solid var(--color-accent)',
                                backgroundColor: 'var(--color-bg-secondary)'
                            }}>
                                <h3 style={{ marginTop: 0, color: 'var(--color-accent)' }}>Patient Presentation</h3>
                                <div style={{ fontSize: '1.1rem', lineHeight: '1.6' }}>
                                    {section.content}
                                </div>
                            </div>
                        );
                    }
                    return null;
                })}

                <div className="case-content">
                    {processedSections.map((section) => {
                        const isRevealed = revealedAnswers.has(section.id);
                        const isExpanded = expandedSections.has(section.id);
                        const hasFeedback = !!feedbacks[section.id];
                        const isGenerating = generatingFeedbackFor.has(section.id);

                        return (
                            <div key={section.id} className="accordion">
                                <div
                                    className="accordion-header"
                                    onClick={() => toggleSection(section.id)}
                                >
                                    <span>{section.title}</span>
                                    <span style={{ color: 'var(--color-text-muted)' }}>
                                        {isExpanded ? "−" : "+"}
                                    </span>
                                </div>

                                {isExpanded && (
                                    <div className="accordion-content">
                                        {/* OPTIONAL PROMPT (For Challenge Questions) */}
                                        {section.prompt && (
                                            <div style={{ marginBottom: '1.5rem', fontSize: '1.05rem', lineHeight: '1.6' }}>
                                                <div dangerouslySetInnerHTML={{ __html: section.prompt.replace(/\n/g, '<br/>') }} />
                                            </div>
                                        )}

                                        {section.hasRecorder ? (
                                            <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                                                {/* 1. Practice / Recording Area */}
                                                <div className="practice-area" style={{
                                                    backgroundColor: 'var(--color-bg-secondary)',
                                                    padding: '1rem',
                                                    borderRadius: '8px',
                                                    border: '1px solid var(--color-border)'
                                                }}>
                                                    <h4 style={{ marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-accent)' }}>
                                                        {section.prompt ? 'Your Response' : '1. Formulate Your Answer'}
                                                    </h4>
                                                    <p style={{ fontSize: '0.9rem', color: 'var(--color-text-muted)', marginBottom: '1rem' }}>
                                                        Record or type your response before checking the model answer.
                                                    </p>
                                                    <VoiceRecorder
                                                        onTranscriptChange={(text) => handleTranscriptChange(section.id, text)}
                                                        isEnabled={!!apiKey}
                                                        onMissingKeyClick={() => setIsSettingsOpen(true)}
                                                    />
                                                </div>

                                                {/* 2. Reveal Logic (using section.answer) */}
                                                <div>
                                                    <h4 style={{ marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-accent)' }}>
                                                        Model Answer
                                                    </h4>
                                                    <div
                                                        className={`hidden-answer ${isRevealed ? 'revealed' : ''}`}
                                                        onClick={() => !isRevealed && toggleReveal(section.id)}
                                                        style={{ cursor: isRevealed ? 'default' : 'pointer' }}
                                                    >
                                                        {isRevealed ? (
                                                            <div dangerouslySetInnerHTML={{ __html: section.answer.replace(/\n/g, '<br/>') }} />
                                                        ) : (
                                                            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '2rem', color: 'var(--color-text-muted)' }}>
                                                                <EyeOff size={32} style={{ marginBottom: '0.5rem' }} />
                                                                <span>Click to reveal Model Answer</span>
                                                            </div>
                                                        )}
                                                    </div>
                                                </div>

                                                {/* 3. AI Feedback */}
                                                {isRevealed && (
                                                    <div className="fade-in">
                                                        <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                                                            <button
                                                                className="primary"
                                                                onClick={() => handleGetFeedback(section.id, section.answer)}
                                                                disabled={isGenerating}
                                                            >
                                                                <Sparkles size={16} />
                                                                {isGenerating ? 'Analyzing...' : 'Get AI Feedback'}
                                                            </button>
                                                        </div>

                                                        {hasFeedback && (
                                                            <div className="card" style={{ marginTop: '1rem', backgroundColor: 'var(--color-bg)', borderColor: 'var(--color-accent)' }}>
                                                                <h4 style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: 'var(--color-accent)' }}>
                                                                    <Sparkles size={16} /> AI Feedback Analysis
                                                                </h4>
                                                                {renderFeedbackContent(feedbacks[section.id])}
                                                            </div>
                                                        )}

                                                        <button
                                                            onClick={(e) => { e.stopPropagation(); toggleReveal(section.id); setFeedbacks(prev => ({ ...prev, [section.id]: '' })); }}
                                                            style={{ marginTop: '1.5rem', fontSize: '0.8rem', padding: '0.4rem 0.8rem' }}
                                                        >
                                                            Hide Answer
                                                        </button>
                                                    </div>
                                                )}
                                            </div>
                                        ) : (
                                            /* No Recorder (just show content) */
                                            <div dangerouslySetInnerHTML={{ __html: section.answer.replace(/\n/g, '<br/>') }} />
                                        )}
                                    </div>
                                )}
                            </div>
                        );
                    })}
                </div>
            </div>

            <SettingsModal
                isOpen={isSettingsOpen}
                onClose={() => setIsSettingsOpen(false)}
                apiKey={apiKey}
                onSave={handleSaveSettings}
            />
        </div>
    );
};

export default StudySession;
