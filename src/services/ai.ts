
export interface FeedbackAnalysis {
    delivery: {
        wpm: number;
        fillerWords: string[];
        concisenessScore: number; // 0-10
        tone: string;
    };
    content: {
        score: number; // 0-10
        missedConcepts: string[];
        redFlags: string[]; // Dangerous omissions
    };
    goldenResponse: string;
}

export const generateFeedback = async (transcript: string, relevantContext: string, apiKey: string): Promise<FeedbackAnalysis | string> => {
    if (!apiKey) return "Please set your API Key in Settings to get AI feedback.";
    if (!transcript.trim()) return "Please record or type an answer first.";

    // Estimated word count for WPM calculation prompt context
    const wordCount = transcript.trim().split(/\s+/).length;

    const prompt = `
    You are an expert PM&R Oral Boards examiner and communication coach.
    Analyze the candidate's answer (Transcript) against the Model Answer (Context).

    Context (Model Answer):
    ${relevantContext}

    Transcript (Candidate's Answer):
    ${transcript}
    (Approx word count: ${wordCount})

    Return a valid JSON object with the following structure (do NOT return markdown formatting like \`\`\`json):
    {
      "delivery": {
        "wpm": number (Estimate words per minute based on transcript length, assuming average speaking speed if unknown, or just analyze text flow),
        "fillerWords": ["um", "uh", "like", "so"],
        "concisenessScore": number (0-10),
        "tone": string (e.g., "Confident", "Hesitant", "Rushed")
      },
      "content": {
        "score": number (0-10),
        "missedConcepts": ["Concept 1", "Concept 2"],
        "redFlags": ["Any dangerous omissions or safety violations"]
      },
      "goldenResponse": "A rewritten, perfect version of the candidate's answer using their logic but professional medical terminology and structure."
    }
  `;

    try {
        const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${apiKey}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                contents: [{
                    parts: [{ text: prompt }]
                }]
            }),
        });

        const data = await response.json();

        if (data.error) {
            throw new Error(data.error.message);
        }

        const textResponse = data.candidates[0].content.parts[0].text;
        // Clean up markdown code blocks if present (Gemini often adds them despite instructions)
        const cleanJson = textResponse.replace(/^```json\s*/, '').replace(/\s*```$/, '');

        return JSON.parse(cleanJson) as FeedbackAnalysis;

    } catch (error: any) {
        console.error("AI Error:", error);
        return `Error generating feedback: ${error.message}`;
    }
};
