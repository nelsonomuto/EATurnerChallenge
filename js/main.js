(function () {
    var addTitleClickHandler, updateMovieList;

    $(function () {
        return updateMovieList('/titles');
    });

    updateMovieList = function (url) {
        $.mobile.showPageLoadingMsg();
        return $.ajax({
            type: 'GET',
            url: url
        }).then(function (data) {
                var movieListTemplate, titles;
                $.mobile.hidePageLoadingMsg();
                titles = JSON.parse(data);
                movieListTemplate = Handlebars.compile($('#movieList-template').html());
                $('#movieList').html(movieListTemplate({
                    titles: titles
                }));
                $('#movieList').listview('refresh');
                return addTitleClickHandler();
            }).fail(function (response) {
                $.mobile.hidePageLoadingMsg();
                alert('Error retrieving movie list.');
                console.log('error retrieving movie list');
                return console.log(response);
            });
    };

    addTitleClickHandler = function () {
        return $('.Description h3 a').click(function () {
            var detail;
            detail = $(this).parents('.Description').siblings('.HiddenDetail').html();
            return $('#detailPage .TitleDetail').html(detail);
        });
    };

}).call(this);
