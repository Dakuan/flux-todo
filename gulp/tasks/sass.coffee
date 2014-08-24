gulp = require('gulp')
sass = require('gulp-ruby-sass')
handleErrors = require('../util/bundleErrorHandler')
browserSync  = require('browser-sync')

paths = require('../config/paths')

gulp.task 'sass', ['images'], ->
  gulp.src(paths.src.sass)
    .pipe(sass({
      compass: true
      bundleExec: true
      sourcemap: true
      sourcemapPath: '../sass'
    }))
    .on('error', handleErrors)
    .pipe(gulp.dest('build'))
