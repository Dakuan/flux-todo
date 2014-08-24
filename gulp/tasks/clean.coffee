gulp = require('gulp')
clean = require('gulp-clean')
ignore = require('gulp-ignore')

gulp.task 'clean', ->
  gulp.src('build', { read: false })
  .pipe(clean())
