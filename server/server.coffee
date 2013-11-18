
express = require "express"
app = express()

app.configure ->
  app.use app.router
  app.use express.bodyParser()
  app.use express["static"] __dirname + "/../public"

app.listen 9058
