gulp       = require 'gulp'
notify     = require 'gulp-notify'
changed    = require 'gulp-changed'
rubyHaml   = require 'gulp-ruby-haml'
minifyHtml = require 'gulp-minify-html'

gulp.task 'haml', ['setConfig'], ->
  gulp.src global.config.paths.src.haml
    .pipe changed('build/', { extension: '.html' })
    .pipe rubyHaml()
    .pipe minifyHtml()
    .pipe gulp.dest(global.config.paths.dst.html)
    .pipe notify 'haml to html conversion complete'
