// VARIABLES & PATHS
const theme = 'winter' // Theme folder name

// LOGIC
// import gulp from 'gulp'
// const { src, dest, parallel, series, watch } = gulp
import { rollup } from 'rollup'
import { babel } from '@rollup/plugin-babel'
import commonjs from '@rollup/plugin-commonjs'
import { nodeResolve } from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

export async function jsDev() {
  const bundle = await rollup({
    input: `themes/${theme}/app/js/app.js`,
    plugins: [nodeResolve(), commonjs({ include: 'node_modules/**' }), babel({ babelHelpers: 'bundled' })],
  })

  await bundle.write({
    file: `themes/${theme}/assets/js/app.min.js`,
    format: 'iife',
    sourcemap: true,
    plugins: [terser()],
  })
}

export async function jsBuild() {
  const bundle = await rollup({
    input: `themes/${theme}/app/js/app.js`,
    plugins: [nodeResolve(), commonjs({ include: 'node_modules/**' }), babel({ babelHelpers: 'bundled' })],
  })

  await bundle.write({
    file: `themes/${theme}/assets/js/app.min.js`,
    format: 'iife',
    sourcemap: false,
    plugins: [
      terser({
        compress: { passes: 2 },
        format: {
          comments: false,
        },
      }),
    ],
  })
}

export async function jsLibDev() {
  const bundle = await rollup({
    input: `themes/${theme}/app/js/lib.js`,
    plugins: [nodeResolve(), commonjs({ include: 'node_modules/**' }), babel({ babelHelpers: 'bundled' })],
  })

  await bundle.write({
    file: `themes/${theme}/assets/js/lib.min.js`,
    format: 'iife',
    sourcemap: true,
    plugins: [terser()],
  })
}

export async function jsLibBuild() {
  const bundle = await rollup({
    input: `themes/${theme}/app/js/lib.js`,
    plugins: [nodeResolve(), commonjs({ include: 'node_modules/**' }), babel({ babelHelpers: 'bundled' })],
  })

  await bundle.write({
    file: `themes/${theme}/assets/js/lib.min.js`,
    format: 'iife',
    sourcemap: false,
    plugins: [
      terser({
        compress: { passes: 2 },
        format: {
          comments: false,
        },
      }),
    ],
  })
}
