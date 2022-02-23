// assets.js

// variables & paths
const theme = 'winter' // Theme folder name
const paths = {
  src:  [
    `themes/${theme}/src/images/**/*`,
    `themes/${theme}/src/fonts/**/*`,
  ],
  dest: `themes/${theme}/assets`,
  base: `themes/${theme}/src`,
}

// require
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import del from 'del'
import changed from 'gulp-changed'

// tasks
function assetscopy() {
  return src(paths.src, { base: paths.base })
  .pipe(changed(paths.dest))
  .pipe(dest(paths.dest))
}

function clean() {
  return del(
    [
    `themes/${theme}/assets/*`,
    `!themes/${theme}/assets/fonts`,
    `!themes/${theme}/assets/images`,
    // `!themes/${theme}/assets/favicons`,
    // `!themes/${theme}/assets/js/vendor`,
    ], { force: true })
}

// export
export { assetscopy, clean }
