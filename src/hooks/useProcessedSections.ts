import { useMemo } from 'react';
import type { Case } from '../types/case';
import type { StudySection } from '../components/Study/SectionAccordion';

export const useProcessedSections = (data: Case) => {
    return useMemo(() => {
        const result: StudySection[] = [];

        for (let i = 0; i < data.sections.length; i++) {
            const current = data.sections[i];
            const next = data.sections[i + 1];

            if (current.title.toLowerCase().includes('chief complaint') || current.title.toLowerCase().includes('presentation')) {
                continue;
            }

            const isChallengeQuestion = current.title.toLowerCase().includes('challenge question');
            const isNextAnswer = next?.title.toLowerCase().includes('challenge answer');

            if (isChallengeQuestion && isNextAnswer) {
                result.push({
                    id: `${i}-merged`,
                    title: current.title,
                    prompt: current.content,
                    answer: next.content,
                    hasRecorder: true,
                    originalIndex: i
                });
                i++;
            } else {
                const t = current.title.toLowerCase();
                const isQuestionHeader = current.title.trim().startsWith('+');
                const isHistoryOrExam = t.includes('relevant history') || t.includes('relevant physical');
                const isDiagnosis = t.includes('diagnosis');
                const shouldRecord = isQuestionHeader || isHistoryOrExam || isDiagnosis || t.includes('challenge answer') || t.includes('challenge question');

                result.push({
                    id: `${i}-standard`,
                    title: current.title,
                    prompt: undefined,
                    answer: current.content,
                    hasRecorder: shouldRecord,
                    originalIndex: i
                });
            }
        }
        return result;
    }, [data.sections]);
};
