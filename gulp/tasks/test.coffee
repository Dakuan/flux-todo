gulp = require('gulp')
jest = require('gulp-jest')

gulp.task 'test', ['setConfig'], ->
    gulp.src(global.config.paths.spec)
        .pipe(jest(global.config.jest))
