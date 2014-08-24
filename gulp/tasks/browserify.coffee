gulp = require('gulp')
notify = require('gulp-notify')
size = require('gulp-size')

browserify = require('browserify')
watchify = require('watchify')
source = require('vinyl-source-stream')

bundleLogger = require('../util/bundleLogger')
bundleErrorHandler = require('../util/bundleErrorHandler')

paths = require('../config/paths')

gulp.task 'browserify', ->
  bundleMethod = if global.isWatching then watchify else browserify

  bundler = bundleMethod({
    entries: ['../../src/coffee/app.coffee']
    extensions: ['.coffee']
    debug: true
  })

  bundle = ->
    bundleLogger.start()
    bundler.bundle()
      .on('error', bundleErrorHandler)
      .pipe source('app.js')
      .pipe gulp.dest('./dist/')
      .on('end', bundleLogger.end)

  bundler.on('update', bundle) if global.isWatching
  bundle()
