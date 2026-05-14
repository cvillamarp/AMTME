import type { Config } from 'tailwindcss';

const config: Config = {
  content: ['./src/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {
      colors: {
        amtme: {
          navy: '#001F36',
          yellow: '#E8FF40',
          white: '#FFFFFF',
          cream: '#F5EFE6',
          petro: '#003D5C',
          terracotta: '#B85C38',
        },
      },
      boxShadow: {
        panel: '0 16px 60px rgba(0, 31, 54, 0.18)',
      },
    },
  },
  plugins: [],
};

export default config;
