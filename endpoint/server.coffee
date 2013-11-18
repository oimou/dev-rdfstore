
express = require "express"
app = express()

app.configure ->
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express["static"] __dirname + "/../public"

app.post "/", (req, res) ->
  if body = req.body
    console.info body
    res.end JSON.stringify body

  else
    res.send 404
    res.end "Not found"

app.listen 9058
