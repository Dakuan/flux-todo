gulp = require('gulp')

gulp.task 'build', ['browserify', 'sass', 'images', 'haml']
