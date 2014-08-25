gulp   = require 'gulp'
rimraf = require 'gulp-rimraf'
ignore = require 'gulp-ignore'

gulp.task 'clean', ['setConfig'], ->
  pattern = global.config.paths.dst.root + '**/*.*'
  gulp.src pattern, { read: false }
    .pipe rimraf()
