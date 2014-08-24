gulp = require('gulp')
browserSync = require('browserSync')

gulp.task 'browserSync', ['build'], ->
  browserSync.init(['build/**'], {
    server: { baseDir: ['build', 'src'] }
  })
