import { useState, useEffect, useCallback } from 'react';

export const useTimer = () => {
    const [seconds, setSeconds] = useState(0);
    const [isActive, setIsActive] = useState(false);

    useEffect(() => {
        let interval: any = null;
        if (isActive) {
            interval = setInterval(() => {
                setSeconds(s => s + 1);
            }, 1000);
        } else if (!isActive && seconds !== 0) {
            clearInterval(interval);
        }
        return () => clearInterval(interval);
    }, [isActive, seconds]);

    const toggleTimer = useCallback(() => setIsActive(prev => !prev), []);

    const resetTimer = useCallback(() => {
        setIsActive(false);
        setSeconds(0);
    }, []);

    const formatTime = useCallback((totalSeconds: number) => {
        const min = Math.floor(totalSeconds / 60);
        const sec = totalSeconds % 60;
        return `${min.toString().padStart(2, '0')}:${sec.toString().padStart(2, '0')}`;
    }, []);

    return {
        seconds,
        isActive,
        toggleTimer,
        resetTimer,
        formatTime,
        setSeconds,
        setIsActive
    };
};
