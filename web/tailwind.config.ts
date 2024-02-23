import type { Config } from 'tailwindcss';
import { nextui } from "@nextui-org/react";

const config: Config = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    "./node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}"
  ],
  theme: {
    extend: {}
  },
  darkMode: "class",
  plugins: [nextui({
    themes: {
      "mint": {
        extend: "dark",
        colors: {
          background: "#191919",
          foreground: "#FFFFFF",
          primary: {
            50: '#daffef',
            100: '#adffd5',
            200: '#7cffbb',
            300: '#4affa0',
            400: '#1aff86',
            500: '#00e66c',
            600: '#00b353',
            700: '#00803b',
            800: '#004e21',
            900: '#001c06',
            // DEFAULT: "#00ff78",
            DEFAULT: "#00e66c",
            foreground: "#FFFFFF"
          },
          focus: "#00e66c"
        }
      }
    }
  })]
};

export default config;
