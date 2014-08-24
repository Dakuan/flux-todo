require('./gulp')

var gulp = require('gulp'),
    _ = require('lodash'),
    browserify = require('gulp-browserify'),
    concat = require('gulp-concat');


gulp.task('copy', function() {
  gulp.src('src/index.html')
    .pipe(gulp.dest('dist'));
});

gulp.task('watch', function() {
  gulp.watch('src/**/*.*', ['default']);
});

gulp.task('default', ['browserify', 'copy', 'watch']);
