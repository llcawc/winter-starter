// gulpfile.js

// VARIABLES & PATHS
const localhost = 'http://winter-starter/' // Local domen
const theme = 'winter' // Theme folder name
const fileswatch = 'html,htm,php,txt,js,mjs,jpg,png,svg,json,md,woff2' // List of files extensions for watching & hard reload (comma separated)

// LOGIC
import gulp from 'gulp'
const { parallel, series, watch } = gulp
import browsersync from 'browser-sync'
import { deploy } from './gulp/deploy.mjs'
import { images } from './gulp/images.mjs'
import { cssDev, cssBuild } from './gulp/css.mjs'
import { jsDev, jsBuild, jsLibDev, jsLibBuild } from './gulp/js.mjs'
import { clean, assetscopy } from './gulp/assets.mjs'

function browserSync() {
  browsersync.init({
    files: [`themes/${theme}/**/*`],
    watch: true,
    notify: false,
    proxy: { target: localhost },
    online: true, // If «false» - Browsersync will work offline without internet connection
    browser: ['firefox'], // open in firefox
  })
}

function watchDev() {
  watch(`themes/${theme}/app/img/**/*.{jpg,png,svg}`, { usePolling: true }, images)
  watch(`themes/${theme}/app/js/**/*.{js,mjs,cjs}`, { usePolling: true }, parallel(jsDev, jsLibDev))
  watch(`themes/${theme}/app/scss/**/*.{scss,sass,css}`, { usePolling: true }, cssDev)
  watch(`themes/${theme}/**/*.{${fileswatch}}`, { usePolling: true }).on('change', browsersync.reload)
}

export { clean, assetscopy, jsDev, jsBuild, cssDev, cssBuild, images, deploy }
export let build = series(clean, assetscopy, images, cssBuild, parallel(jsBuild, jsLibBuild))
export let serve = parallel(browserSync, watchDev)
export let assets = series(assetscopy, images, cssDev, parallel(jsDev, jsLibDev))
export let dev = series(clean, assets, serve)
