// VARIABLES & PATHS

let theme = 'winter' // Theme folder name
let paths = {
  styles: {
    src: `themes/${theme}/app/scss/main.*`,
    dest: `themes/${theme}/assets/css`,
  },

  purge: {
    content: [
      `plugins/**/*.htm`,
      `themes/${theme}/**/*.htm`,
      `themes/${theme}/app/js/**/*.js`,
      `themes/${theme}/app/vendor/magnific-popup/*.js`,
      `themes/${theme}/app/vendor/magnific-popup/*.scss`,
      'node_modules/photoswipe/dist/photoswipe.css',
      'node_modules/bootstrap/scss/_reboot.scss',
      'node_modules/bootstrap/js/dist/dom/*.js',
      'node_modules/bootstrap/js/dist/{base-component,button,dropdown,collapse}.js',
    ],
    safelist: {
      // standart: ["selectorname"],
      deep: [/scrolltotop$/],
      greedy: [/on$/, /down$/, /is-hidden$/],
    },
    keyframes: true,
  },

  cssOutputName: 'main.min.css',
}

// LOGIC
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import sassDark from 'sass'
import sassGulp from 'gulp-sass'
import sassglob from 'gulp-sass-glob'
import sourcemaps from 'gulp-sourcemaps'
const sass = sassGulp(sassDark)
import purgecss from 'gulp-purgecss'
import postCss from 'gulp-postcss'
import cssnano from 'cssnano'
import autoprefixer from 'autoprefixer'
import rename from 'gulp-rename'

export function cssDev() {
  return src(paths.styles.src)
    .pipe(sourcemaps.init())
    .pipe(sassglob())
    .pipe(sass({ 'include css': true }))
    .pipe(
      postCss([
        autoprefixer({ grid: 'autoplace' }),
        cssnano({
          preset: ['default', { discardComments: { removeAll: true } }],
        }),
      ])
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(sourcemaps.write('.'))
    .pipe(dest(paths.styles.dest))
}

export function cssBuild() {
  return src(paths.styles.src)
    .pipe(sassglob())
    .pipe(sass({ 'include css': true }))
    .pipe(purgecss(paths.purge))
    .pipe(
      postCss([
        autoprefixer({ grid: 'autoplace' }),
        cssnano({
          preset: ['default', { discardComments: { removeAll: true } }],
        }),
      ])
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(dest(paths.styles.dest))
}
