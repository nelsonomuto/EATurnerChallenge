$ ->

  updateMovieList '/titles'

updateMovieList = ( url ) ->
  $.mobile.showPageLoadingMsg();
  $.ajax
    type: 'GET'
    url: url
  .then ( data ) ->
    $.mobile.hidePageLoadingMsg();

    titles = JSON.parse( data )

    movieListTemplate = Handlebars.compile $( '#movieList-template' ).html()

    $( '#movieList' ).html movieListTemplate
      titles: titles
    $( '#movieList' ).listview 'refresh'

    addTitleClickHandler()

  .fail ( response ) ->
    $.mobile.hidePageLoadingMsg();
    alert('Error retrieving movie list.')
    console.log 'error retrieving movie list'
    console.log response

addTitleClickHandler = ->
  $('.Description h3 a').click ->
    detail = $( this ).parents('.Description').siblings('.HiddenDetail').html()
    $('#detailPage .TitleDetail').html detail
