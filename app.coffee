express = require './webapp/node_modules/express'

server = express()

server.configure ->
  server.use express.static __dirname + '/webapp'
  server.use express.bodyParser()

server.get '/MyFirstApp/posts', ( req, res ) ->
  jf = require './webapp/node_modules/jsonfile'
  
  file = './webapp/myFirstApp/mockData/datasets/posts.json'
  
  posts = jf.readFileSync file
  
  res.setHeader 'Content-Type', 'text/json'
  res.end JSON.stringify posts
  
server.post '/MyFirstApp/post', ( req, res ) ->
  jf = require './webapp/node_modules/jsonfile'
  
  file = './webapp/myFirstApp/mockData/datasets/posts.json'
  
  posts = jf.readFileSync file
  
#  post = preparePostToSave req.body, posts.posts
  post = req.body
  
  posts['posts'].push post
  
  jf.writeFileSync file, posts
  
  res.setHeader 'Content-Type', 'text/json'
  
  res.end JSON.stringify { postId: post.postId }
  
server.listen 3000

preparePostToSave = ( post, posts ) ->
  return {
    postId: ( ->
      posts.length++
      )().toString()
    author: post.author or 'Anonymous'
    title: post.title
    content: post.content
  }
    
  