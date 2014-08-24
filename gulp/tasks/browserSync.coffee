gulp = require('gulp')
browserSync = require('browser-sync')

gulp.task 'browserSync', ['build'], ->
  browserSync.init(['build/**'], {
    server: { baseDir: ['build', 'src'] }
  })
