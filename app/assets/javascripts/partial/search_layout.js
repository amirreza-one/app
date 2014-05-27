$(function () {
    $('#body_search input').keyup(function () {
        $.get($("#body_search").attr("action"), $("#body_search").serialize(), null, 'script');
        return false;
    });
    $('#search_input ').focus(function() {
       $('#results').css('display', 'block');

    });
    var resultsSelected = false;
    $("#results").hover(
        function () { resultsSelected = true; },
        function () { resultsSelected = false; }
    );

    $("#search_input").blur(function () {
        if (!resultsSelected) {  //if you click on anything other than the results
            $("#results").hide();  //hide the results
        }
    });
    $(document).on('click','.pagination a', function () {
        $.get(this.href, null, null, 'script');
        return false;
    });

});
