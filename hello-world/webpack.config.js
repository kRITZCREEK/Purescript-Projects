// mac os does not distinguish between react and React, case sensitivity


'use strict'

const config = require('hjs-webpack')({
  in: 'index.js',
  out: 'public',
  clearBeforeBuild: true,
  html: false
})

config.resolve.modulesDirectories = ['node_modules', 'output']
config.externals = {
  'react': 'React',
  'react-dom': 'ReactDOM',
  'react-dom/server': 'ReactDOMServer'
}

module.exports = config