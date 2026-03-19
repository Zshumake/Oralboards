import React from 'react';
import type { Case } from '../types/case';
import { ArrowRight, Book } from 'lucide-react';

interface CaseCardProps {
    data: Case;
    onClick: () => void;
}

const CaseCard: React.FC<CaseCardProps> = ({ data, onClick }) => {
    return (
        <div className="card case-card interactive fade-in" onClick={onClick}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
                <div style={{ padding: '0.6rem', backgroundColor: 'var(--color-bg-secondary)', borderRadius: '10px', color: 'var(--color-primary)' }}>
                    <Book size={20} />
                </div>
                <button className="icon-button" style={{ color: 'var(--color-accent)' }}>
                    <ArrowRight size={18} />
                </button>
            </div>

            <h3 style={{ marginTop: 0, marginBottom: '0.5rem', fontSize: '1.25rem' }}>{data.title}</h3>
            <p style={{ color: 'var(--color-text-muted)', fontSize: '0.9rem', marginBottom: '1.5rem', display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical', overflow: 'hidden' }}>
                {data.sections[0]?.content || "Practice case for PM&R oral board examination."}
            </p>

            <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
                <span className="badge">High Yield</span>
                <span className="badge secondary">Practice</span>
            </div>
        </div>
    );
};

export default CaseCard;
