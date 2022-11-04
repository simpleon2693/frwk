$(document).ready(function () {

    // 채용공고 리스트
    $.ajax({
        url: '/com/jobopen/getJobopenList.do',
        data: {},
        method: 'GET',
        contentType: 'application/json',
        success: function (data) {
            var template = document.getElementById('template').innerHTML;
            var rendered = Mustache.render(template, data);
            $('.box tbody').append(rendered);

        },
    })
});