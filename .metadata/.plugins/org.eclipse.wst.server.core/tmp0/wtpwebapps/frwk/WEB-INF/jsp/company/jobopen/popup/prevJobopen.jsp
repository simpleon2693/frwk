<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<article class="pop-up" id="${popupId}">
    <div class="pop-up__area bring-file">
        <div class="pop-up__top">
            <h3 class="pop-up__title">이전 공고 불러오기</h3>
            <button type="button" class="x-btn closeBtn" onclick="hidePopup('${popupId}')"></button>
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
<script type="text/javascript">
    $('.pop-up').css('display', 'block');
    $('.bring-file').css('display','block');
</script>