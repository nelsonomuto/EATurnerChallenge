express = require 'express'
mongoskin = require 'mongoskin'
db = mongoskin.db 'mongodb://readuser:reader1234@SG-mssmongodev02-874.servers.mongodirector.com:27017/dev-test',
  safe: false

XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest

app = express()

app.configure ->
  app.use express.bodyParser()
  app.use express.static __dirname
  app.use express.favicon()

app.get '/titles', ( req, res ) ->
  ###
  # TODO: unable to find collection in the dev-test database

  # Using HTTP api in the meantime while there's no data in mongodb connection

  ###
  titles = ''
  xmlhttp = new XMLHttpRequest()
  xmlhttp.open 'GET', 'http://dc.tbs.io/all', true

  xmlhttp.onreadystatechange = ->
    if xmlhttp.readyState is 4 and xmlhttp.status is 200
#      titles = xmlhttp.responseText
#      console.log title
#      res.setHeader 'Content-Type', 'text/json'
#
#
#      res.end JSON.stringify titles
      res.end xmlhttp.responseText

  xmlhttp.send()

  return
  
app.listen 3000
    
  