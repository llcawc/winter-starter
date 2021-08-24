// gulpfile.js for WinterCMS Mockup Starter Template by pasmurno
// repositary: https://github.com/llcawc/winstart.git

// VARIABLES & PATHS

let localhost = "winter", // Local domain
  theme = "winter", // Theme folder name
  fileswatch = "html,htm,php,txt,yaml,twig,json,md,woff2"; // List of files extensions for watching & hard reload (comma separated)

let paths = {
  scripts: {
    src: `themes/${theme}/assets/js/app.js`,
    dest: `themes/${theme}/assets/js`,
  },

  styles: {
    src: `themes/${theme}/assets/sass/main.*`,
    dest: `themes/${theme}/assets/css`,
  },

  deploy: {
    hostname: "host.ru", // Deploy hostname
    destination: "domen.ru/www/", // Deploy destination
    include: ["*.htaccess"], // Included files to deploy
    exclude: [
      // Excluded files from deploy
      ".git",
      "bootstrap",
      "config",
      "modules",
      "mysql",
      "node_modules",
      "plugins",
      "storage",
      "vendor",
      // 'storage/*.sqlite',
      // '.htaccess',
      // 'gulpfile.js',
      // 'package.json',
      // `themes/${theme}/assets/css/main.min.css.map`,
      // `themes/${theme}/assets/js/app.js`,
      // `themes/${theme}/assets/sass`,
      // '*.editorconfig',
      // '*.gitignore',
      "package-lock.json",
      "npm-debug.log",
      "debug.log",
      "**/Thumbs.db",
      "**/*.DS_Store",
    ],
  },

  cssOutputName: "main.min.css",
  jsOutputName: "app.min.js",
};

// LOGIC

const { src, dest, parallel, series, watch } = require("gulp");
const browserSync = require("browser-sync").create();
const webpack = require("webpack-stream");
const sass = require("gulp-sass")(require("sass"));
const sassglob = require("gulp-sass-glob");
const plumber = require("gulp-plumber");
const cleancss = require("gulp-clean-css");
const autoprefixer = require("gulp-autoprefixer");
const sourcemaps = require("gulp-sourcemaps");
const rename = require("gulp-rename");
const notify = require("gulp-notify");
const rsync = require("gulp-rsync");

function browsersync() {
  browserSync.init({
    proxy: { target: `http://${localhost}` },
    notify: false,
    online: true, // If «false» - Browsersync will work offline without internet connection
  });
}

function scripts() {
  return src(paths.scripts.src)
    .pipe(
      plumber({
        errorHandler: function (err) {
          notify.onError({
            title: "JS Error",
            message: "Error: <%= error.message %>",
          })(err);
          this.emit("end");
        },
      })
    )
    .pipe(
      webpack({
        mode: "production",
        performance: {
          hints: false,
        },
        module: {
          rules: [
            {
              test: /\.(js)$/,
              exclude: /(node_modules)/,
              loader: "babel-loader",
              query: {
                presets: ["@babel/env"],
                plugins: ["babel-plugin-root-import"],
              },
            },
          ],
        },
      })
    )
    .pipe(rename(paths.jsOutputName))
    .pipe(dest(paths.scripts.dest))
    .pipe(browserSync.stream());
}

function css() {
  return src(paths.styles.src)
    .pipe(sourcemaps.init())
    .pipe(
      plumber({
        errorHandler: function (err) {
          notify.onError({
            title: "SASS/SCSS Error",
            message: "Error: <%= error.message %>",
          })(err);
          this.emit("end");
        },
      })
    )
    .pipe(sassglob())
    .pipe(sass.sync())
    .pipe(
      cleancss({ level: { 1: { specialComments: 0 } }, format: "beautify" })
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(sourcemaps.write("."))
    .pipe(dest(paths.styles.dest))
    .pipe(browserSync.stream());
}

function styles() {
  return src(paths.styles.src)
    .pipe(sassglob())
    .pipe(sass.sync().on("error", sass.logError))
    .pipe(
      autoprefixer({ overrideBrowserslist: ["last 10 versions"], grid: true })
    )
    .pipe(
      cleancss({
        level: { 1: { specialComments: 0 } } /* format: 'beautify' */,
      })
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(dest(paths.styles.dest))
    .pipe(browserSync.stream());
}

function deploy() {
  return src("./").pipe(
    rsync({
      root: "./",
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
  );
}

function startwatch() {
  watch(`themes/${theme}/assets/sass/**/*`, { usePolling: true }, css);
  watch(
    [
      `themes/${theme}/assets/js/**/*.js`,
      `!themes/${theme}/assets/js/*.min.js`,
    ],
    { usePolling: true },
    scripts
  );
  watch(
    [`themes/${theme}/**/*.{${fileswatch}}`, `plugins/**/*.{${fileswatch}}`],
    { usePolling: true }
  ).on("change", browserSync.reload);
}

exports.css = css;
exports.styles = styles;
exports.scripts = scripts;
exports.deploy = deploy;
exports.assets = parallel(scripts, styles);
exports.default = series(scripts, css, parallel(browsersync, startwatch));
