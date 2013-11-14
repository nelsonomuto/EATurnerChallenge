$ ->

  updateMovieList '/titles'

updateMovieList = ( url ) ->
  nowPlayingMovies = []
  $.mobile.showPageLoadingMsg();
  $.ajax
    type: 'GET'
    url: url
  .then ( data ) ->
    debugger
    $.mobile.hidePageLoadingMsg();
    $( data ).each ->
      nowPlayingMovies.push this

    movieListTemplate = Handlebars.compile $( '#movieList-template' ).html()
    $( '#movieList' ).html movieListTemplate
      movies: nowPlayingMovies
    $( '#movieList' ).listview 'refresh'

  .fail ( response ) ->
    alert('Error retrieving movie list.')
    console.log 'error retrieving movie list'
    console.log response
