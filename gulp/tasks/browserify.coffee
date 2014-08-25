gulp       = require 'gulp'
bundler    = require '../util/bundler'

gulp.task 'browserify', ['setConfig'], -> bundler()
