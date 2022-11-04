<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<article class="pop-up" id="${paramVO.popupId}">
    <div class="pop-up__area bring-file">
        <div class="pop-up__top">
            <h3 class="pop-up__title">이전 공고 불러오기</h3>
            <button type="button" class="x-btn closeBtn" onclick="hidePopup('${paramVO.popupId}')"></button>
        </div>
        <div class="pop-up__cont">
            <div class="f-item">
                <p class="f-item__inner">2022.05.05</p>
                <p class="f-item__inner is-ing ">진행중</p>
                <p class="f-item__inner">소방공무원을 모십니다.</p>
                <button type="button" class="primary_btn f-item__inner">불러오기</button>
            </div>
            <div class="f-item">
                <p class="f-item__inner">2022.05.05</p>
                <p class="f-item__inner is-end ">마감</p>
                <p class="f-item__inner">소방공무원을 모십니다.</p>
                <button type="button" class="primary_btn f-item__inner">불러오기</button>
            </div>
        </div>
        <div class="pagenation">
            <button type="button" class="pagenation__num forward"></button>
            <button type="button" class="pagenation__num pre"></button>
            <button type="button" class="pagenation__num">1</button>
            <button type="button" class="pagenation__num">2</button>
            <button type="button" class="pagenation__num">3</button>
            <button type="button" class="pagenation__num next"></button>
            <button type="button" class="pagenation__num backward"></button>
        </div>
    </div>
</article>
<script id="template" type="x-tmpl-mustache">
{{#list}}
<div class="f-item">
    <p class="f-item__inner">{{openEndDt}}</p>
    <p class="f-item__inner is-ing ">진행중</p>
    <p class="f-item__inner">{{title}}</p>
    <button type="button" class="primary_btn f-item__inner" data-seq={{jobOpenSeq}}>불러오기</button>
</div>
{{/list}}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<script type="text/javascript">

    var template = document.getElementById('template').innerHTML;

    var params = {
        pageSize : 3,
        pageNo : 1
    }

    function loadData(params){
        $.ajax({
            url:'/com/jobopen/getJobopenList.do',
            data: params,
            method: 'GET',
            success:function (data){
                console.log(data)
                var rendered = Mustache.render(template, {list:data.data});
                $('.pop-up__cont').html(rendered);
            },
        })
    }

    $(function(){
        $('.pop-up').css('display', 'block');
        $('.bring-file').css('display','block');

        $(".pop-up__cont").on("click","button", function () {
            console.log($(this).attr("data-seq"))
        })

        loadData(params);
    })
</script>