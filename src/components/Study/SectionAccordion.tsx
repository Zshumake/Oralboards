import React from 'react';
import { EyeOff, Sparkles } from 'lucide-react';
import VoiceRecorder from './VoiceRecorder';
import FeedbackCard from './FeedbackCard';
import type { FeedbackAnalysis } from '../../services/ai';

export interface StudySection {
    id: string;
    title: string;
    prompt?: string;
    answer: string;
    hasRecorder: boolean;
    originalIndex: number;
}

interface SectionAccordionProps {
    section: StudySection;
    isExpanded: boolean;
    onToggleExpand: () => void;
    isRevealed: boolean;
    onToggleReveal: () => void;
    isAiEnabled: boolean;
    apiKey: boolean; // boolean if key exists
    onOpenSettings: () => void;
    transcript: string;
    onTranscriptChange: (text: string) => void;
    feedback?: FeedbackAnalysis | string;
    isGenerating: boolean;
    onGetFeedback: (id: string, answer: string) => void;
    onHideAnswer: () => void;
    onNext: () => void;
}

const SectionAccordion: React.FC<SectionAccordionProps> = ({
    section,
    isExpanded,
    onToggleExpand,
    isRevealed,
    onToggleReveal,
    isAiEnabled,
    apiKey,
    onOpenSettings,
    transcript: _transcript, // Mark as intentionally unused for now if VoiceRecorder is uncontrolled but receives changes
    onTranscriptChange,
    feedback,
    isGenerating,
    onGetFeedback,
    onHideAnswer,
    onNext
}) => {
    return (
        <div className="accordion">
            <div
                className="accordion-header"
                onClick={onToggleExpand}
            >
                <span>{section.title}</span>
                <span style={{ color: 'var(--color-text-muted)' }}>
                    {isExpanded ? "−" : "+"}
                </span>
            </div>

            {isExpanded && (
                <div className="accordion-content">
                    {section.prompt && (
                        <div style={{ marginBottom: '1.5rem', fontSize: '1.05rem', lineHeight: '1.6' }}>
                            <div dangerouslySetInnerHTML={{ __html: section.prompt.replace(/\n/g, '<br/>') }} />
                        </div>
                    )}

                    {section.hasRecorder ? (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                            {isAiEnabled && (
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
                                        onTranscriptChange={onTranscriptChange}
                                        isEnabled={apiKey}
                                        onMissingKeyClick={onOpenSettings}
                                    />
                                </div>
                            )}

                            <div>
                                <h4 style={{ marginTop: 0, marginBottom: '0.5rem', color: 'var(--color-accent)' }}>
                                    Model Answer
                                </h4>
                                <div
                                    className={`hidden-answer ${isRevealed ? 'revealed' : ''}`}
                                    onClick={() => !isRevealed && onToggleReveal()}
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

                            {isRevealed && isAiEnabled && (
                                <div className="fade-in">
                                    <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                                        <button
                                            className="primary"
                                            onClick={() => onGetFeedback(section.id, section.answer)}
                                            disabled={isGenerating}
                                        >
                                            <Sparkles size={16} />
                                            {isGenerating ? 'Analyzing...' : 'Get AI Feedback'}
                                        </button>
                                    </div>

                                    {feedback && (
                                        <div className="card" style={{ marginTop: '1rem', backgroundColor: 'var(--color-bg)', borderColor: 'var(--color-accent)' }}>
                                            <h4 style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: 'var(--color-accent)' }}>
                                                <Sparkles size={16} /> AI Feedback Analysis
                                            </h4>
                                            <FeedbackCard feedback={feedback} />
                                        </div>
                                    )}
                                </div>
                            )}

                            {isRevealed && (
                                <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: '1.5rem', borderTop: '1px solid var(--color-border)', paddingTop: '1rem' }}>
                                    <button
                                        onClick={(e) => {
                                            e.stopPropagation();
                                            onHideAnswer();
                                        }}
                                        style={{ fontSize: '0.8rem', padding: '0.4rem 0.8rem', background: 'transparent', border: '1px solid var(--color-border)', color: 'var(--color-text-muted)' }}
                                    >
                                        Hide Answer
                                    </button>

                                    <button
                                        onClick={(e) => {
                                            e.stopPropagation();
                                            onNext();
                                        }}
                                        className="primary"
                                        style={{ fontSize: '1rem', padding: '0.6rem 1.2rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}
                                    >
                                        Continue →
                                    </button>
                                </div>
                            )}
                        </div>
                    ) : (
                        <div dangerouslySetInnerHTML={{ __html: section.answer.replace(/\n/g, '<br/>') }} />
                    )}
                </div>
            )}
        </div>
    );
};

export default SectionAccordion;
