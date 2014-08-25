gulp         = require 'gulp'
util         = require 'gulp-util'
sass         = require 'gulp-ruby-sass'
browserSync  = require 'browser-sync'
errorHandler = require '../util/errorHandler'

gulp.task 'sass', ['setConfig', 'images'], ->
  gulp.src(global.config.paths.src.sass)
    .pipe(sass({
      bundleExec: true
      sourcemap: true
      sourcemapPath: '../../src/scss'
    }))
    .on('error', errorHandler)
    .pipe(gulp.dest(global.config.paths.dst.css))
