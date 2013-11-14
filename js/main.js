// Generated by CoffeeScript 1.6.3
(function() {
  var updateMovieList;

  $(function() {
    return updateMovieList('/titles');
  });

  updateMovieList = function(url) {
    var nowPlayingMovies;
    nowPlayingMovies = [];
    $.mobile.showPageLoadingMsg();
    return $.ajax({
      type: 'GET',
      url: url
    }).then(function(data) {
      debugger;
      var movieListTemplate;
      $.mobile.hidePageLoadingMsg();
      $(data).each(function() {
        return nowPlayingMovies.push(this);
      });
      movieListTemplate = Handlebars.compile($('#movieList-template').html());
      $('#movieList').html(movieListTemplate({
        movies: nowPlayingMovies
      }));
      return $('#movieList').listview('refresh');
    }).fail(function(response) {
      alert('Error retrieving movie list.');
      console.log('error retrieving movie list');
      return console.log(response);
    });
  };

}).call(this);