import { useState, useCallback } from 'react';
import { generateFeedback, type FeedbackAnalysis } from '../services/ai';

export const useAiFeatures = () => {
    const [apiKey, setApiKey] = useState(localStorage.getItem('gemini_api_key') || '');
    const [isAiEnabled, setIsAiEnabled] = useState(() => {
        const saved = localStorage.getItem('is_ai_enabled');
        return saved === null ? true : saved === 'true';
    });
    const [feedbacks, setFeedbacks] = useState<Record<string, FeedbackAnalysis | string>>({});
    const [generatingFeedbackFor, setGeneratingFeedbackFor] = useState<Set<string>>(new Set());

    const handleSaveSettings = useCallback((key: string) => {
        localStorage.setItem('gemini_api_key', key);
        setApiKey(key);
    }, []);

    const toggleAiFeatures = useCallback(() => {
        const newValue = !isAiEnabled;
        setIsAiEnabled(newValue);
        localStorage.setItem('is_ai_enabled', String(newValue));
    }, [isAiEnabled]);

    const getFeedback = useCallback(async (id: string, transcript: string, sectionContent: string) => {
        // Removed silent return. Let generateFeedback handle empty transcripts with a UI message.

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
    }, [apiKey]);

    const resetAiState = useCallback(() => {
        setFeedbacks({});
        setGeneratingFeedbackFor(new Set());
    }, []);

    return {
        apiKey,
        isAiEnabled,
        feedbacks,
        generatingFeedbackFor,
        handleSaveSettings,
        toggleAiFeatures,
        getFeedback,
        resetAiState,
        setFeedbacks
    };
};
