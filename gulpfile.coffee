gulp = require('gulp')
notify = require('gulp-notify')
size = require('gulp-size')

browserify = require('browserify')
watchify = require('watchify')
source = require('vinyl-source-stream')

bundleLogger = require('./gulp/util/bundleLogger')
bundleErrorHandler = require('./gulp/util/bundleErrorHandler')

browserifyConfig = require('./gulp/config/browserify')

gulp.task 'browserify', ->
  bundleLogger.start()
  bundler = browserify(browserifyConfig)
  .bundle()
  .on('error', bundleErrorHandler)
  .pipe source('app.js')
  .pipe gulp.dest('./build/')
  .on('end', bundleLogger.end)
