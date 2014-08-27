module.exports =
  unmockedModulePathPatterns: [
      'node_modules/react',
      'node_modules/lodash',
      'node_modules/es6-promise'
  ]
  testPathIgnorePatterns: ['node_modules']
  moduleFileExtensions: ['coffee', 'js', 'json', 'react']
  scriptPreprocessor: 'preprocessor.js'
