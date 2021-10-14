// VARIABLES & PATHS

const theme = 'winter' // Theme folder name
const paths = {
  deploy: {
    hostname: 'host.ru', // Deploy hostname
    destination: 'domen.ru/www/', // Deploy destination
    include: ['*.htaccess'], // Included files to deploy
    exclude: [
      // Excluded files from deploy
      '.git',
      // 'bootstrap',
      // 'config',
      // 'modules',
      // 'mysql',
      // 'plugins',
      // 'storage',
      // 'vendor',
      // 'storage/*.sqlite',
      'node_modules',
      `themes/${theme}/app`,
      `themes/${theme}/gulp`,
      'gulpfile.js',
      'package.json',
      '*.editorconfig',
      '*.gitignore',
      'package-lock.json',
      'npm-debug.log',
      'debug.log',
      '**/Thumbs.db',
      '**/*.DS_Store',
    ],
  },
}

// LOGIC
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import rsync from 'gulp-rsync'

export function deploy() {
  return src('./').pipe(
    rsync({
      root: './',
      hostname: paths.deploy.hostname,
      destination: paths.deploy.destination,
      // clean: true, // Mirror copy with file deletion
      include: paths.deploy.include,
      exclude: paths.deploy.exclude,
      recursive: true,
      archive: true,
      silent: false,
      compress: true,
    })
  )
}
