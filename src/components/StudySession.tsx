import React, { useState, useEffect, useCallback } from 'react';
import type { Case } from '../types/case';
import { useTimer } from '../hooks/useTimer';
import { useAiFeatures } from '../hooks/useAiFeatures';
import { useProcessedSections } from '../hooks/useProcessedSections';
import StudyHeader from './Study/StudyHeader';
import SectionAccordion from './Study/SectionAccordion';
import SettingsModal from './Study/SettingsModal';

interface StudySessionProps {
    data: Case;
    onBack: () => void;
}

const StudySession: React.FC<StudySessionProps> = ({ data, onBack }) => {
    // Hooks
    const timer = useTimer();
    const ai = useAiFeatures();
    const processedSections = useProcessedSections(data);

    // UI state
    const [isSettingsOpen, setIsSettingsOpen] = useState(false);

    // UI Local State
    const [expandedSections, setExpandedSections] = useState<Set<string>>(new Set());
    const [revealedAnswers, setRevealedAnswers] = useState<Set<string>>(new Set());
    const [transcripts, setTranscripts] = useState<Record<string, string>>({});

    useEffect(() => {
        // Reset state when data changes
        timer.resetTimer();
        ai.resetAiState();
        setExpandedSections(new Set([processedSections[0]?.id]));
        setRevealedAnswers(new Set());
        setTranscripts({});
    }, [data, processedSections]);

    const handleTranscriptChange = useCallback((id: string, text: string) => {
        setTranscripts(prev => ({ ...prev, [id]: text }));
    }, []);

    const toggleSection = useCallback((id: string) => {
        setExpandedSections(prev => {
            const next = new Set(prev);
            if (next.has(id)) next.delete(id);
            else next.add(id);
            return next;
        });
    }, []);

    const toggleReveal = useCallback((id: string) => {
        setRevealedAnswers(prev => {
            const next = new Set(prev);
            if (next.has(id)) next.delete(id);
            else next.add(id);
            return next;
        });
    }, []);

    const handleHideAnswer = useCallback((id: string) => {
        setRevealedAnswers(prev => {
            const next = new Set(prev);
            next.delete(id);
            return next;
        });
        if (ai.isAiEnabled) {
            ai.setFeedbacks(prev => {
                const next = { ...prev };
                delete next[id];
                return next;
            });
        }
    }, [ai]);

    const handleNextSection = useCallback((currentId: string) => {
        const currentIndex = processedSections.findIndex(s => s.id === currentId);
        if (currentIndex !== -1 && currentIndex < processedSections.length - 1) {
            const nextSection = processedSections[currentIndex + 1];
            setExpandedSections(new Set([nextSection.id]));

            // Scroll to the new section after a brief delay to allow render
            setTimeout(() => {
                const element = document.getElementById(`section-${nextSection.id}`);
                if (element) {
                    element.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }, 100);
        }
    }, [processedSections]);

    return (
        <div className="fade-in">
            <StudyHeader
                onBack={onBack}
                onOpenSettings={() => setIsSettingsOpen(true)}
                isAiEnabled={ai.isAiEnabled}
                onToggleAi={ai.toggleAiFeatures}
                timerSeconds={timer.seconds}
                isActive={timer.isActive}
                onToggleTimer={timer.toggleTimer}
                onResetTimer={timer.resetTimer}
                formatTime={timer.formatTime}
            />

            <div style={{ maxWidth: '800px', margin: '0 auto' }}>
                <h1 style={{ marginBottom: '0.5rem' }}>{data.title}</h1>
                <p style={{ color: 'var(--color-primary)', marginBottom: '2rem' }}>Oral Board Case Study</p>

                {/* Patient Presentation */}
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
                    {processedSections.map((section) => (
                        <SectionAccordion
                            key={section.id}
                            section={section}
                            isExpanded={expandedSections.has(section.id)}
                            onToggleExpand={() => toggleSection(section.id)}
                            isRevealed={revealedAnswers.has(section.id)}
                            onToggleReveal={() => toggleReveal(section.id)}
                            isAiEnabled={ai.isAiEnabled}
                            apiKey={!!ai.apiKey}
                            onOpenSettings={() => setIsSettingsOpen(true)}
                            transcript={transcripts[section.id] || ''}
                            onTranscriptChange={(text) => handleTranscriptChange(section.id, text)}
                            feedback={ai.feedbacks[section.id]}
                            isGenerating={ai.generatingFeedbackFor.has(section.id)}
                            onGetFeedback={(id, answer) => ai.getFeedback(id, transcripts[id] || '', answer)}
                            onHideAnswer={() => handleHideAnswer(section.id)}
                            onNext={() => handleNextSection(section.id)}
                        />
                    ))}
                </div>
            </div>

            <SettingsModal
                isOpen={isSettingsOpen}
                onClose={() => setIsSettingsOpen(false)}
                apiKey={ai.apiKey}
                onSave={ai.handleSaveSettings}
            />
        </div>
    );
};

export default StudySession;
