gulp = require('gulp')
changed = require('gulp-changed')
imagemin = require('gulp-imagemin')

paths = require('../config/paths')

gulp.task 'images', ->
  gulp.src(global.config.paths.src.images)
    .pipe(changed(global.config.paths.dst.images))
    .pipe(imagemin())
    .pipe(gulp.dest(global.config.paths.dst.images))
