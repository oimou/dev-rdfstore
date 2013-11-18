
bunyan = require "bunyan"
{spawn: spawn} = require "child_process"

endpoint = spawn "/bin/env", ["coffee", "#{__dirname}/endpoint/server.coffee"]
rdfstore = spawn "/bin/env", ["coffee", "#{__dirname}/rdfstore/server.coffee"]

# logging for endpoint
do ->
  endpoint.stdout.on "data", (chunk) ->
    console.log "endpoint: ", chunk.toString()

# logging for rdfstore
do ->
  rdfstore.stdout.on "data", (chunk) ->
    console.log "rdfstore: ", chunk.toString()

