$(function () {
    $('#friend_search input').keyup(function () {
        $.get($("#friend_search").attr("action"), $("#friend_search").serialize(), null, 'script');
    });
});