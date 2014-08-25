gulp = require 'gulp'

gulp.task 'watch', ['setConfig', 'setWatch', 'browserSync'], ->
  gulp.watch global.config.paths.src.sass, ['sass']
  gulp.watch global.config.paths.src.images, ['images']
  gulp.watch global.config.paths.src.haml, ['haml']
