gulp = require('gulp')
jest = require('gulp-jest')

gulp.task 'test', ['setConfig'], ->
    gulp.src('__tests__').pipe(jest(global.config.jest))
