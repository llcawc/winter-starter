// scripts.js

// variables & paths
let theme = 'winter' // Theme folder name
let paths = {
  src: `themes/${theme}/src/scripts/main.js`,
  dest: `themes/${theme}/assets/js/main.min.js`,
}

// require
import { env } from 'process'
import { rollup } from 'rollup'
import { babel } from '@rollup/plugin-babel'
import commonjs from '@rollup/plugin-commonjs'
import { nodeResolve } from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

// task
export async function scripts() {
  const bundle = await rollup({
    input: paths.src,
    plugins: [nodeResolve(), commonjs({ include: 'node_modules/**' }), babel({ babelHelpers: 'bundled' })],
  })

  await bundle.write({
    file: paths.dest,
    format: 'iife',
    name: 'main',
    sourcemap: env.BUILD === 'production' ? false : true,
    plugins: [env.BUILD === 'production' ? terser({ compress: { passes: 2 }, format: { comments: false } }) : false],
  })
}
