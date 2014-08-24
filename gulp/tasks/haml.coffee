gulp = require('gulp')
notify = require('gulp-notify')
changed = requie('gulp-changed')
rubyHaml = require('ruby-haml')
minifyHtml = require('gulp-minify-html')

gulp.task 'haml', ->
  gulp.src paths.pages
    .pipe changed('build/', { extension: '.html' })
    .pipe rubyHaml()
    .pipe minifyHtml()
    .pipe gulp.dest('build/')
    .pipe notify 'haml to html conversion complete'
