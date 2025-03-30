import starlightPlugin from '@astrojs/starlight-tailwind';

// Generated color palettes
const accent = { 200: '#dec784', 600: '#836800', 900: '#3f3000', 950: '#2d2200' };
const gray = { 100: '#f7f6f5', 200: '#f0edeb', 300: '#c4c1bf', 400: '#908a86', 500: '#5c5753', 700: '#3c3734', 800: '#2a2623', 900: '#1a1816' };

/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: { accent, gray },
		},
	},
	plugins: [starlightPlugin()],
};
