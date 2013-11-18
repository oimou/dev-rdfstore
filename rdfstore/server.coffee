
async = require "async"
socketio = require "socket.io"
rdfstore = require "rdfstore"

io = socketio.listen 12080
io.set "log level", 1

store = null
opt =
  persistent: true
  engine: "mongodb"
  name: "rdfstore"
  overwrite: false

# create store
rdfstore.create opt, (_store) ->
  store = _store

  # listen connections to the store
  io.sockets.on "connection", (socket) ->
    socket.on "query", onQuery

onQuery = (data) ->
  async.waterfall [

    (done) ->
      console.log "query: ", data
      done null

    (done) ->
      store.execute data.query, (success, result) ->
        done !success, result

  ], (err, result) =>
    @emit "result", result


