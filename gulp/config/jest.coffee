module.exports =
  testDirectoryName: '__tests__'
  testFileExtensions: ['coffee', 'js']
  unmockedModulePathPatterns: [
    'node_modules/react',
    'node_modules/lodash',
    'node_modules/es6-promise'
  ]
  testPathIgnorePatterns: [
    'node_modules',
    'bower_components'
  ]
  moduleFileExtensions: [
    'coffee',
    'js',
    'json',
    'letcoffee',
    'coffee.md'
  ]
  scriptPreprocessor: '<rootDir>/coffee-preprocessor.js'
