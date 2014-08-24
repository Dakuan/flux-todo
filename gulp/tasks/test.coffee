gulp = require('gulp')
jest = require('gulp-jest')

gulp.task 'jest', ->
    gulp.src('__tests__').pipe(jest({
        scriptPreprocessor: "./spec/support/preprocessor.js"
        unmockedModulePathPatterns: ["node_modules/react"]
        testDirectoryName: "spec"
        testPathIgnorePatterns: ["node_modules", "spec/support"]
        moduleFileExtensions: ["js", "json", "react"]
    }))
