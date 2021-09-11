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

  images: {
    src: `themes/${theme}/assets/src/**/*`,
    dest: `themes/${theme}/assets/images`,
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

import gulp from "gulp";
const { src, dest, parallel, series, watch } = gulp;
import browserSync from "browser-sync";
import webpack from "webpack";
import webpackStream from "webpack-stream";
import TerserPlugin from "terser-webpack-plugin";
import sassDark from "sass";
import sassGulp from "gulp-sass";
import sassglob from "gulp-sass-glob";
import sourcemaps from "gulp-sourcemaps";
const sass = sassGulp(sassDark);
import plumber from "gulp-plumber";
import notify from "gulp-notify";
import postCss from "gulp-postcss";
import cssnano from "cssnano";
import autoprefixer from "autoprefixer";
import rename from "gulp-rename";
import imagemin from "gulp-imagemin";
import newer from "gulp-newer";
import rsync from "gulp-rsync";

function browsersync() {
  browserSync.init({
    proxy: { target: `http://${localhost}` },
    notify: false,
    online: true, // If «false» - Browsersync will work offline without internet connection
  });
}

function js() {
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
      webpackStream(
        {
          mode: "production",
          performance: { hints: false },
          plugins: [
            new webpack.ProvidePlugin({
              $: "jquery",
              jQuery: "jquery",
              "window.jQuery": "jquery",
            }), // jQuery (npm i jquery)
          ],
          module: {
            rules: [
              {
                test: /\.(js)$/,
                exclude: /(node_modules)/,
                use: {
                  loader: "babel-loader",
                  options: {
                    presets: ["@babel/preset-env"],
                    plugins: ["babel-plugin-root-import"],
                  },
                },
              },
            ],
          },
          optimization: {
            minimize: false,
            minimizer: [
              new TerserPlugin({
                terserOptions: { format: { comments: true } },
                extractComments: false,
              }),
            ],
          },
        },
        webpack
      )
    )
    .on("error", function handleError() {
      this.emit("end");
    })
    .pipe(rename(paths.jsOutputName))
    .pipe(dest(paths.scripts.dest))
    .pipe(browserSync.stream());
}

function scripts() {
  return src(paths.scripts.src)
    .pipe(
      webpackStream(
        {
          mode: "production",
          performance: { hints: false },
          plugins: [
            new webpack.ProvidePlugin({
              $: "jquery",
              jQuery: "jquery",
              "window.jQuery": "jquery",
            }), // jQuery (npm i jquery)
          ],
          module: {
            rules: [
              {
                test: /\.m?js$/,
                exclude: /(node_modules)/,
                use: {
                  loader: "babel-loader",
                  options: {
                    presets: ["@babel/preset-env"],
                    plugins: ["babel-plugin-root-import"],
                  },
                },
              },
            ],
          },
          optimization: {
            minimize: true,
            minimizer: [
              new TerserPlugin({
                terserOptions: { format: { comments: false } },
                extractComments: false,
              }),
            ],
          },
        },
        webpack
      )
    )
    .on("error", function handleError() {
      this.emit("end");
    })
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
    .pipe(sass({ "include css": true }))
    .pipe(
      postCss([
        autoprefixer({ grid: "autoplace" }),
        cssnano({
          preset: ["default", { discardComments: { removeAll: true } }],
        }),
      ])
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(sourcemaps.write("."))
    .pipe(dest(paths.styles.dest))
    .pipe(browserSync.stream());
}

function styles() {
  return src(paths.styles.src)
    .pipe(sassglob())
    .pipe(sass({ "include css": true }))
    .pipe(
      postCss([
        autoprefixer({ grid: "autoplace" }),
        cssnano({
          preset: ["default", { discardComments: { removeAll: true } }],
        }),
      ])
    )
    .pipe(rename(paths.cssOutputName))
    .pipe(dest(paths.styles.dest))
    .pipe(browserSync.stream());
}

function images() {
  return src(paths.images.src)
    .pipe(plumber())
    .pipe(newer(paths.images.dest))
    .pipe(imagemin({ verbose: "true" }))
    .pipe(dest(paths.images.dest))
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
    js
  );
  watch(
    [`themes/${theme}/**/*.{${fileswatch}}`, `plugins/**/*.{${fileswatch}}`],
    { usePolling: true }
  ).on("change", browserSync.reload);
}

export { css, js, scripts, styles, images, deploy };
export let build = parallel(scripts, styles);
export default series(js, css, parallel(browsersync, startwatch));
