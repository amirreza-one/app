$(function () {
    $(document).on('click','.pagination a', function () {
        $.get(this.href, null, null, 'script');
        return false;
    });
    $('#profile_search input').keyup(function () {
        $.get($("#profile_search").attr("action"), $("#profile_search").serialize(), null, 'script');
        return false;
    });
});