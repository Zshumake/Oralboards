import React from 'react';
import { Activity, BarChart2, AlertTriangle, CheckCircle, Mic, Sparkles } from 'lucide-react';
import type { FeedbackAnalysis } from '../../services/ai';

interface FeedbackCardProps {
    feedback: FeedbackAnalysis | string;
}

const FeedbackCard: React.FC<FeedbackCardProps> = ({ feedback }) => {
    if (typeof feedback === 'string') {
        return <div style={{ whiteSpace: 'pre-wrap', padding: '1rem' }}>{feedback}</div>;
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
                            {feedback.content.redFlags.map((flag: string, i: number) => <li key={i}>{flag}</li>)}
                        </ul>
                    </div>
                )}

                <div>
                    <h5 style={{ marginTop: 0, marginBottom: '0.5rem' }}>Missed Concepts</h5>
                    {feedback.content.missedConcepts.length > 0 ? (
                        <ul style={{ margin: 0, paddingLeft: '1.2rem', color: 'var(--color-text-muted)' }}>
                            {feedback.content.missedConcepts.map((item: string, i: number) => <li key={i}>{item}</li>)}
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
                            {feedback.delivery.fillerWords.map((word: string, i: number) => (
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

            {/* 3. Golden Response */}
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

export default FeedbackCard;
