/** @type {import('tailwindcss').Config} */
export default {
  content: [
    // Incluimos los archivos que queremos que tailwind analice
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

