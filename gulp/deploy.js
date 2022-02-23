// deploy.js

// variables & paths
const theme = 'winter' // Theme folder name
const paths = {
  deploy: {
    hostname: 'hostname.com', // Deploy hostname
    destination: 'domen.com/www/', // Deploy destination
    include: ['*.htaccess', 'download'], // Included files to deploy
    exclude: [
      // Excluded files from deploy
      '.git',
      '.vscode',
      'bootstrap',
      'config',
      'gulp',
      'modules',
      'mysql',
      'node_modules',
      'plugins',
      'storage',
      'tests',
      'vendor',
      `themes/${theme}/src`,
      'gulpfile.js',
      'package.json',
      'package-lock.json',
      'prettier.config.js',
      '*.babelrc',
      '*.browserslistrc',
      '*.editorconfig',
      '*.gitignore',
      'npm-debug.log',
      'debug.log',
      '**/Thumbs.db',
      '**/*.DS_Store',
    ],
  },
}

// require
import gulp from 'gulp'
const { src, dest, parallel, series, watch } = gulp
import rsync from 'gulp-rsync'

// tasks
export function deploy() {
  return src('./').pipe(
    rsync({
      root: './',
      hostname: paths.deploy.hostname,
      destination: paths.deploy.destination,
      clean: true, // Mirror copy with file deletion
      include: paths.deploy.include,
      exclude: paths.deploy.exclude,
      recursive: true,
      archive: true,
      silent: false,
      compress: true,
    })
  )
}
