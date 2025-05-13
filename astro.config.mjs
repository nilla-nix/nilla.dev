// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

import tailwindcss from "@tailwindcss/vite";

// https://astro.build/config
export default defineConfig({
	integrations: [
		starlight({
			title: "Nilla",
			social: {
				github: "https://github.com/nilla-nix/nilla",
			},
			sidebar: [
				{
					label: "Guides",
					items: [
						{ label: "Quickstart", slug: "guides/quickstart" },
						{ label: "Using Modules", slug: "guides/using-modules" },
						{ label: "Adding Inputs", slug: "guides/adding-inputs" },
						{ label: "Creating Packages", slug: "guides/creating-packages" },
						{ label: "Creating Shells", slug: "guides/creating-shells" },
						{ label: "NixOS Support", slug: "guides/nixos-support" },
					],
				},
				{
					label: "Reference",
					autogenerate: { directory: "reference" },
				},
			],
			customCss: ["./src/styles/global.css"],
		}),
	],

	vite: {
		plugins: [tailwindcss()],
	},
});
