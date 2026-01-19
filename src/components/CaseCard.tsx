import React from 'react';
import type { Case } from '../data/cases';
import { FileText, ArrowRight } from 'lucide-react';

interface CaseCardProps {
    data: Case;
    onClick: () => void;
}

const CaseCard: React.FC<CaseCardProps> = ({ data, onClick }) => {
    return (
        <div className="card" onClick={onClick} style={{ cursor: 'pointer' }}>
            <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem' }}>
                    <div style={{
                        backgroundColor: 'rgba(56, 189, 248, 0.1)',
                        padding: '10px',
                        borderRadius: '8px',
                        color: 'var(--color-primary)'
                    }}>
                        <FileText size={24} />
                    </div>
                    <h3 style={{ margin: 0, fontSize: '1.2rem' }}>{data.title}</h3>
                </div>
            </div>

            <p style={{ color: 'var(--color-text-muted)', fontSize: '0.9rem', marginBottom: '1.5rem' }}>
                {data.sections.length > 0 ? "Click to start studying this case." : "No content available."}
            </p>

            <button className="primary" style={{ width: '100%', justifyContent: 'center' }}>
                Start Case <ArrowRight size={16} />
            </button>
        </div>
    );
};

export default CaseCard;
