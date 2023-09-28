/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './views/**/*.{html,js,ejs}',
    './*.{html,js}',
    './node_modules/flowbite/**/*.js',
  ],
  darkMode: 'false',
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
//    require('flowbite/plugin')({charts: true}),  // Fixed the syntax here
  ],
}
