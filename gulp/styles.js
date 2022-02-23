// styles.js

// variables & paths
let theme = 'winter' // Theme folder name
let paths = {
  styles: {
    src: [
      `themes/${theme}/src/sass/main.*`,
      `themes/${theme}/src/sass/fonts.*`,
    ],
    dest: `themes/${theme}/assets/css`,
  },

  purge: {
    content: [
      `themes/${theme}/**/*.htm`,
      `themes/${theme}/**/*.md`,
      `themes/${theme}/content/**/*.txt`,
      `themes/${theme}/src/scripts/**/*.js`,
      `themes/${theme}/src/sass/blocks/_pswp.scss`,
      'node_modules/bootstrap/scss/_reboot.scss',
      'node_modules/bootstrap/js/dist/dom/*.js',
      'node_modules/bootstrap/js/dist/{base-component,alert,button,collapse,dropdown}.js',
    ],
    safelist: {
      // standart: ["selectorname"],
      deep: [/scrolltotop$/],
      greedy: [/on$/, /down$/, /is-hidden$/, /alert$/, /success$/, /danger$/, /warning$/],
    },
    keyframes: true,
  },
}

// require
import { env } from 'process'
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import sassDark from 'sass'
import sassGulp from 'gulp-sass'
const sass = sassGulp(sassDark)
import purgecss from 'gulp-purgecss'
import postCss from 'gulp-postcss'
import cssnano from 'cssnano'
import autoprefixer from 'autoprefixer'
import rename from 'gulp-rename'

// task
export function styles() {
  if (env.BUILD === 'production') {
    return src(paths.styles.src)
      .pipe(sass.sync())
      .pipe(purgecss(paths.purge))
      .pipe(
        postCss([
          autoprefixer(),
          cssnano({
            preset: ['default', { discardComments: { removeAll: true } }],
          }),
        ])
      )
      .pipe(rename({suffix: '.min'}))
      .pipe(dest(paths.styles.dest))
  } else {
    return src(paths.styles.src, { sourcemaps: true })
    .pipe(sass.sync().on('error', sass.logError))
    .pipe(rename({suffix: '.min'}))
    .pipe(dest(paths.styles.dest, { sourcemaps: '.' }))
  }
}
