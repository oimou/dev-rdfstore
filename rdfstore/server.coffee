
rdfstore = require "rdfstore"

opt =
  persistent: true
  engine: "mongodb"
  name: "rdfstore"
  overwrite: true

# create store
store = rdfstore.create opt

# getter of the store
exports.getStore = -> store
