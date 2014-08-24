gulp = require('gulp')
coffeelint = require('gulp-coffeelint')
paths = require('../config/paths')

gulp.task 'lint', ->
  gulp.src paths.src.coffee
    .pipe coffeelint()
    .pipe coffeelint.reporter()
