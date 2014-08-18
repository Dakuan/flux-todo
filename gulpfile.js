var gulp = require('gulp'),
    _ = require('lodash'),
    browserify = require('gulp-browserify'),
    concat = require('gulp-concat'),
    path = require('path'),
    util = require('gulp-util'),
    karma = require('karma').server;

var log = util.log,
    colors = util.colors;

var runKarma = function(configFile, done, options) {
  options = options || {};
  options.singleRun = (options.singleRun === undefined) ?
    false : options.singleRun;

  karma.start({
    configFile: path.resolve(configFile),
    singleRun: options.singleRun
  }, function(exitCode) {
    log('Karma has exited with ' + colors.red(exitCode));
    done();
    process.exit(exitCode);
  });
};

gulp.task('browserify', function() {
  gulp.src('src/js/main.js')
    .pipe(browserify({ transform: 'reactify'}))
    .pipe(concat('main.js'))
    .pipe(gulp.dest('dist/js'));
});

gulp.task('copy', function() {
  gulp.src('src/index.html')
    .pipe(gulp.dest('dist'));
});

gulp.task('watch', function() {
  gulp.watch('src/**/*.*', ['default']);
});

gulp.task('test', function(done) {
  runKarma('./karma.conf.js', done, { singleRun: true });
});

gulp.task('tdd', function(done) {
  runKarma('./karma.conf.js', done, {});
});

gulp.task('default', ['browserify', 'copy', 'watch']);
