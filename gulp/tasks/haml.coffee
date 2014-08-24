gulp = require('gulp')
notify = require('gulp-notify')
changed = require('gulp-changed')
rubyHaml = require('gulp-haml')
minifyHtml = require('gulp-minify-html')

gulp.task 'haml', ->
  gulp.src paths.src.haml
    .pipe changed('build/', { extension: '.html' })
    .pipe haml()
    .pipe minifyHtml()
    .pipe gulp.dest('build/')
    .pipe notify 'haml to html conversion complete'
