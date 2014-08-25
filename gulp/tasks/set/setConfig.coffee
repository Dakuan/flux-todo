requireDir = require 'require-dir'
gulp       = require 'gulp'

gulp.task 'setConfig', ->
  global.config = requireDir '../../config'
