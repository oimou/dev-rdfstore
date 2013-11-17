
#rdfstore = require("rdfstore")
sparql = require('sparql')
client = new sparql.Client "http://dbpedia.org/sparql"

query = """
PREFIX dbpedia: <http://dbpedia.org/resource/>
PREFIX dbpedia-owl: <http://dbpedia.org/ontology/>
PREFIX dbpprop: <http://dbpedia.org/property/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
SELECT $n, $o
WHERE {
  $p rdf:type foaf:Person.
  $p dbpprop:birthPlace dbpedia:Japan.
  $p dbpprop:deathPlace dbpedia:Japan.
  $p dbpprop:name $n.
  $p dbpedia-owl:occupation dbpedia:Japanese_poetry.
}
LIMIT 10
"""

client.query query, (err, res) ->
  throw err if err
  console.log res.results.bindings

