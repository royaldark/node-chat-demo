# Node dependencies
fs = require 'fs'
http = require 'http'

# Library dependencies
async = require 'async'
express = require 'express'
ioLib = require 'socket.io'
swig = require 'swig'

# Project dependencies
Util = require './server/util.coffee'
Packager = require './server/packager.coffee'
Sockets = require './server/sockets.coffee'

PORT = 3000

# Dev swig opts (namely cache: false)
swig.init
  allowErrors: false,
  autoescape: true,
  cache: false,
  encoding: 'utf8',
  filters: {},
  root: '.',
  tags: {},
  extensions: {},
  tzOffset: 0

serverError = (res, msg) ->
  console.log "ERROR: #{msg}"
  res.status(500).send(msg)

startServer = ->
  app = socketIOServer = null

  async.auto {
    initServer: (next) =>
      app = express()
      socketIOServer = http.createServer(app)
      next()

    socketIO: ['initServer', (next) =>
      io = ioLib.listen(socketIOServer)
      io.set('log level', 1) # 1 = warn

      io.sockets.on 'connection', Sockets.connect

      next()
    ]

    routes: ['initServer', (next) =>
      app.get '/js/*', (req, res) ->
        path = "client/#{ req.url[1..] }"
        res.sendfile path

      app.get '/css/*', (req, res) ->
        path = "client/#{ req.url[1..] }"

        await fs.readFile path, 'utf-8', defer err, data
        await Util.compileCSS data, defer err, css

        res.header 'Content-Type', 'text/css'
        res.send css

      app.get '/*', (req, res) ->
        await async.parallel [
          Packager.packageTemplates
          Packager.packageCoffeeFiles
        ], defer err, results
        return serverError err if err

        data =
          views: results[0]
          clientJS: results[1]

        content = swig.compileFile('index.html').render(data)
        res.send content

      socketIOServer.listen PORT
      next()
    ]

    ready: ['routes', 'socketIO', (next) ->
      console.log "Server started on port #{ PORT }"
      next()
    ]
  }

startServer()
