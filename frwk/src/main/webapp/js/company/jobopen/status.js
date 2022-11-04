$(document).ready(function () {

    $.ajax({
        url: '/com/jobopen/getJobopenList.do',
        data: {},
        method: 'GET',
        contentType: 'application/json',
        success: function (data) {
            console.log(data)
            var template = document.getElementById('template').innerHTML;
            var rendered = Mustache.render(template, data);
            $('.cont').append(rendered);
        },
    })
});