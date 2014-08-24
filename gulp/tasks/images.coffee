gulp = require('gulp')
changed = require('gulp-changed')
imagemin = require('gulp-imagemin')

paths = require('../config/paths')

gulp.task 'images', ->
  gulp.src(paths.src.images)
    .pipe(changed(paths.dst.images))
    .pipe(imagemin())
    .pipe(gulp.dest(paths.dst.images))
