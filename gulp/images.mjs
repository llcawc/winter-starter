// VARIABLES & PATHS

let theme = 'winter' // Theme folder name
let paths = {
  images: {
    src: `themes/${theme}/app/img/**/*`,
    dest: `themes/${theme}/assets/images`,
  },
}

// LOGIC
import gulp from 'gulp'
const { src, dest } = gulp
import imagemin from 'gulp-imagemin'
import newer from 'gulp-newer'

export function images() {
  return src(paths.images.src)
    .pipe(newer(paths.images.dest))
    .pipe(imagemin({ verbose: 'true' }))
    .pipe(dest(paths.images.dest))
}
