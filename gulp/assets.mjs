// VARIABLES & PATHS
const theme = 'winter' // Theme folder name
const paths = {
  cont: {
    src: [`themes/${theme}/app/fonts/**/*`, `themes/${theme}/app/vendor/**/*`],
    dest: `themes/${theme}/assets`,
    base: `themes/${theme}/app`,
  },
}
// LOGIC
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import del from 'del'

export function assetscopy() {
  return src(paths.cont.src, { base: paths.cont.base }).pipe(dest(paths.cont.dest))
}

export function clean() {
  return del([`themes/${theme}/assets/*`, '!' + `themes/${theme}/assets/images`], { force: true })
}
