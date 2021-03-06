
async = require "async"
rdfstore = require "rdfstore"

opt =
  persistent: true
  engine: "mongodb"
  name: "rdfstore"
  overwrite: true

rdfstore.create opt, (store) ->
  async.waterfall [

    (done) ->
      store.setPrefix 'local', 'http://localhost/'
      store.setPrefix 'oimou', 'http://oimou.com/'
      done()

    (done) ->
      store.execute "LOAD <http://dbpedia.org/resource/Tim_Berners-Lee>", (success, result) ->
        done !success

    (done) ->
      store.execute "INSERT DATA { localhost:a rdf:first 'annonymous' }", (success, result) ->
        done !success

    (done) ->
      store.execute "INSERT DATA { localhost:a rdf:type oimou:a }", (success, result) ->
        done !success

    (done) ->
      store.execute "INSERT DATA { oimou:a rdf:first 'potato' }", (success, result) ->
        done !success

    (done) ->
      command = """
               SELECT $f
               WHERE {
                 $o rdf:first 'potato' .
                 $a rdf:type $o .
                 $a rdf:first $f
               }
               """
      store.execute command, (success, result) ->
        done !success, result

  ], (err, result) ->
    console.log err, JSON.stringify result
