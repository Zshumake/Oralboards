import { useState, useMemo } from 'react';
import { cases } from './data/cases/index';
import type { Case } from './types/case';
import CaseCard from './components/CaseCard';
import StudySession from './components/StudySession';
import { Search, Shuffle, BookOpen } from 'lucide-react';

function App() {
  const [selectedCase, setSelectedCase] = useState<Case | null>(null);
  const [searchTerm, setSearchTerm] = useState('');

  const filteredCases = useMemo(() => {
    return cases.filter(c =>
      c.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      c.sections.some(s => s.content.toLowerCase().includes(searchTerm.toLowerCase()))
    );
  }, [searchTerm]);

  const handleRandomCase = () => {
    const pool = filteredCases.length > 0 ? filteredCases : cases;
    const randomIndex = Math.floor(Math.random() * pool.length);
    setSelectedCase(pool[randomIndex]);
  };

  return (
    <div className="container">
      {selectedCase ? (
        <StudySession data={selectedCase} onBack={() => setSelectedCase(null)} />
      ) : (
        <>
          <header className="header" style={{ marginBottom: '3rem', flexDirection: 'column', alignItems: 'flex-start', gap: '1rem' }}>
            <div style={{ width: '100%', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                <div style={{ padding: '0.8rem', backgroundColor: 'var(--color-primary)', borderRadius: '12px', color: '#0f172a' }}>
                  <BookOpen size={32} />
                </div>
                <div>
                  <h1 style={{ margin: 0, fontSize: '2rem' }}>PM&R Oral Boards</h1>
                  <p style={{ margin: 0, color: 'var(--color-text-muted)' }}>{cases.length} High-Yield Practice Cases</p>
                </div>
              </div>

              <button onClick={handleRandomCase} className="primary">
                <Shuffle size={18} /> Pick Random Case
              </button>
            </div>

            <div style={{ width: '100%', position: 'relative' }}>
              <Search size={20} style={{ position: 'absolute', left: '1rem', top: '50%', transform: 'translateY(-50%)', color: 'var(--color-text-muted)' }} />
              <input
                type="text"
                placeholder="Search cases by title or content..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                style={{
                  width: '100%',
                  padding: '1rem 1rem 1rem 3rem',
                  borderRadius: '12px',
                  border: '1px solid var(--color-border)',
                  backgroundColor: 'var(--color-surface)',
                  color: 'var(--color-text)',
                  fontSize: '1rem',
                  outline: 'none',
                  boxSizing: 'border-box'
                }}
              />
            </div>
          </header>

          <main>
            {filteredCases.length === 0 ? (
              <div style={{ textAlign: 'center', padding: '4rem', color: 'var(--color-text-muted)' }}>
                <h3>No cases found</h3>
                <p>Try adjusting your search terms.</p>
              </div>
            ) : (
              <div className="grid">
                {filteredCases.map(c => (
                  <CaseCard
                    key={c.id}
                    data={c}
                    onClick={() => setSelectedCase(c)}
                  />
                ))}
              </div>
            )}
          </main>

          <footer style={{ marginTop: '4rem', textAlign: 'center', color: 'var(--color-text-muted)', fontSize: '0.9rem' }}>
            <p>Data scraped from PM&R Recap for educational purposes.</p>
          </footer>
        </>
      )}
    </div>
  );
}

export default App;
