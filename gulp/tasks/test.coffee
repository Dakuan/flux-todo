gulp = require('gulp')
jest = require('gulp-jest')

gulp.task 'jest', ->
    gulp.src('__tests__').pipe(jest(config.jest))
