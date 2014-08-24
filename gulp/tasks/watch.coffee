gulp = require('gulp')
paths = require('../config/paths')

gulp.task 'watch', ['setWatch', 'browserSync'], ->
  gulp.watch paths.src.sass, ['sass']
  gulp.watch paths.src.images, ['images']
  gulp.watch paths.src.haml, ['haml']
