// gulpfile.js

// variables & paths
const localhost = 'http://winter/' // Local domen
const theme = 'winter' // Theme folder name
const fileswatch = 'html,htm,php,txt,js,mjs,scss,sass,css,jpg,png,svg,json,md,woff2' // List of files extensions for watching & hard reload (comma separated)

// require
import gulp from 'gulp'
const { parallel, series, watch } = gulp
import browsersync from 'browser-sync'
import { deploy } from './gulp/deploy.js'
import { styles } from './gulp/styles.js'
import { scripts } from './gulp/scripts.js'
import {  assetscopy, clean } from './gulp/assets.js'

// tasks
function browserSync() {
  browsersync.init({
    // files: [`themes/${theme}/**/*`],
    // watch: true,
    notify: false,
    proxy: { target: localhost },
    online: true, // If «false» - Browsersync will work offline without intranet connection
    browser: ['firefox'], // open in firefox, crome, msedge or opera
  })
}

function watchstart() {
  watch(`themes/${theme}/src/**/*.{js,mjs,cjs}`, { usePolling: true }, scripts)
  watch(`themes/${theme}/src/**/*.{htm,md,scss,sass,css}`, { usePolling: true }, styles)
  watch(`themes/${theme}/**/*.{${fileswatch}}`, { usePolling: true }).on('change', browsersync.reload)
}

export { clean, assetscopy, scripts, styles, deploy }
export let assets = series(assetscopy, styles, scripts )
export let serve = parallel(browserSync, watchstart)
export let dev = series(clean, assets, serve)
export let build = series(clean, assets)
