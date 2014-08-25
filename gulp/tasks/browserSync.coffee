gulp        = require 'gulp'
browserSync = require 'browser-sync'

gulp.task 'browserSync', ['setConfig', 'build'], ->
  root = global.config.paths.dst.root
  browserSync.init([root + '**'], {
    server: { baseDir: root }
  })
