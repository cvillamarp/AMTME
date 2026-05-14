import type { Metadata } from 'next';
import type { ReactNode } from 'react';
import { StudioShell } from '@/components/studio-shell';
import { StudioProvider } from '@/components/studio-provider';
import './globals.css';

export const metadata: Metadata = {
  title: 'AMTME Studio OS',
  description: 'Sistema operativo editorial, documental y operativo para AMTME.',
};

export default function RootLayout({ children }: Readonly<{ children: ReactNode }>) {
  return (
    <html lang="es">
      <body>
        <StudioProvider>
          <StudioShell>{children}</StudioShell>
        </StudioProvider>
      </body>
    </html>
  );
}
