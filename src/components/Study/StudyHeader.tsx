import React from 'react';
import { ArrowLeft, Settings, Clock, Play, Pause, RotateCcw } from 'lucide-react';

interface StudyHeaderProps {
    onBack: () => void;
    onOpenSettings: () => void;
    isAiEnabled: boolean;
    onToggleAi: () => void;
    timerSeconds: number;
    isActive: boolean;
    onToggleTimer: () => void;
    onResetTimer: () => void;
    formatTime: (seconds: number) => string;
}

const StudyHeader: React.FC<StudyHeaderProps> = ({
    onBack,
    onOpenSettings,
    isAiEnabled,
    onToggleAi,
    timerSeconds,
    isActive,
    onToggleTimer,
    onResetTimer,
    formatTime
}) => {
    return (
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
                <button onClick={onOpenSettings} title="Settings">
                    <Settings size={20} />
                </button>
            </div>

            <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', backgroundColor: 'var(--color-bg-secondary)', padding: '0.4rem 0.8rem', borderRadius: '20px', border: '1px solid var(--color-border)' }}>
                    <span style={{ fontSize: '0.85rem', fontWeight: 500, color: 'var(--color-text-muted)' }}>AI & Recording</span>
                    <button
                        onClick={onToggleAi}
                        style={{
                            padding: '0.2rem 0.6rem',
                            fontSize: '0.75rem',
                            backgroundColor: isAiEnabled ? 'var(--color-success)' : 'var(--color-bg)',
                            color: isAiEnabled ? '#fff' : 'var(--color-text-muted)',
                            borderRadius: '12px',
                            border: '1px solid var(--color-border)',
                            minWidth: '50px'
                        }}
                    >
                        {isAiEnabled ? 'ON' : 'OFF'}
                    </button>
                </div>

                <div className="timer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                    <Clock size={20} />
                    {formatTime(timerSeconds)}
                </div>
                <div style={{ display: 'flex', gap: '0.5rem' }}>
                    <button onClick={onToggleTimer} title={isActive ? "Pause" : "Start"}>
                        {isActive ? <Pause size={18} /> : <Play size={18} />}
                    </button>
                    <button onClick={onResetTimer} title="Reset">
                        <RotateCcw size={18} />
                    </button>
                </div>
            </div>
        </div>
    );
};

export default StudyHeader;
