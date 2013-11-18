
bunyan = require "bunyan"
{spawn: spawn} = require "child_process"

rdfstore = spawn "/bin/env", ["coffee", "#{__dirname}/rdfstore/server.coffee"]
endpoint = spawn "/bin/env", ["coffee", "#{__dirname}/endpoint/server.coffee"]

# logging for rdfstore
do ->
  rdfstore.stdout.on "data", (chunk) ->
    console.log "rdfstore: ", chunk.toString()

  rdfstore.stderr.on "data", (chunk) ->
    console.error "rdfstore: ", chunk.toString()

# logging for endpoint
do ->
  endpoint.stdout.on "data", (chunk) ->
    console.log "endpoint: ", chunk.toString()

  endpoint.stderr.on "data", (chunk) ->
    console.error "endpoint: ", chunk.toString()

