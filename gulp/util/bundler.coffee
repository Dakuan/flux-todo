gulp         = require 'gulp'
source       = require 'vinyl-source-stream'
browserify   = require 'browserify'
watchify     = require 'watchify'
logger       = require './logger'
errorHandler = require './errorHandler'

module.exports = ->
  bundleMethod = if global.isWatching then watchify else browserify

  bundler = bundleMethod(global.config.browserify)
  bundler.on('update', bundle) if global.isWatching

  logger.start()
  bundler.bundle()
    .on('error', errorHandler)
    .pipe source('app.js')
    .pipe gulp.dest(global.config.paths.dst.js)
    .on('end', logger.end)
