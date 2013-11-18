
io = require "socket.io-client"
express = require "express"
app = express()
socket = null

app.configure ->
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express["static"] __dirname + "/../public"

# routing
app.post "/", (req, res) ->
  initSocket() if !socket

  if body = req.body
    console.log "log:", body
    socket.emit "query", body
    res.end JSON.stringify body

  else
    res.send 404
    res.end "Not found"

# start endpoint
app.listen 9058

# configure socket.io
initSocket = ->
  socket = io.connect "localhost", {port: 12080}
  socket.on "result", (data) ->
    console.log "result:", data
