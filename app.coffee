express = require 'express'
mongoskin = require 'mongoskin'
db = mongoskin.db 'mongodb://readuser:reader1234@SG-mssmongodev02-874.servers.mongodirector.com:27017/dev-test'

app = express()

app.configure ->
  app.use express.bodyParser()
  app.use express.static __dirname
  app.use express.favicon()

app.get '/titles', ( req, res ) ->
  
  res.setHeader 'Content-Type', 'text/json'
  res.end JSON.stringify
    test: true

app.get '/titles/search', ( req, res ) ->

  res.setHeader 'Content-Type', 'text/json'
  res.end JSON.stringify
    test: true

  
app.listen 3000
    
  