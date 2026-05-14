'use client';

import { createContext, useContext, useEffect, useState, type Dispatch, type ReactNode, type SetStateAction } from 'react';
import { initialStudioState } from '@/lib/studio-data';
import type { StudioState } from '@/lib/studio-types';

type StudioContextValue = {
  state: StudioState;
  setState: Dispatch<SetStateAction<StudioState>>;
};

const StudioContext = createContext<StudioContextValue | undefined>(undefined);

const STORAGE_KEY = 'amtme-studio-os-state';

export function StudioProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<StudioState>(initialStudioState);

  useEffect(() => {
    try {
      const stored = window.localStorage.getItem(STORAGE_KEY);
      if (stored) {
        const parsed = JSON.parse(stored) as StudioState;
        setState(parsed);
      }
    } catch {
      setState(initialStudioState);
    }
  }, []);

  useEffect(() => {
    try {
      window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
    } catch {
      // Keep the first version functional even if persistence is not available.
    }
  }, [state]);

  return <StudioContext.Provider value={{ state, setState }}>{children}</StudioContext.Provider>;
}

export function useStudio() {
  const context = useContext(StudioContext);
  if (!context) {
    throw new Error('useStudio must be used within StudioProvider');
  }
  return context;
}
