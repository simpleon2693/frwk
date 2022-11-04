<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<article class="pop-up" id="${popupId}">
    <div class="pop-up__area select-job">
        <div class="pop-up__top">
            <h3 class="pop-up__title">직무선택</h3>
            <div class="search-bar pop-up-bar">
                <input type="text" class="pop-up-bar__textbar" placeholder="직무 검색어를 검색하세요."/>
                <button type="button" class="primary_btn">검색</button>
            </div>
        </div>
        <div class="pop-up__cont">
            <div class="list-wrap">
                <div class="list-cont">
                    <ul>
                        <li class="active">경영/사무</li>
                        <li>마케팅/광고/홍보</li>
                    </ul>
                </div>
                <div class="list-cont">
                    <ul>
                        <li>기획/전략/경영</li>
                        <li>사무/총무/법무</li>
                    </ul>
                </div>
                <div class="list-cont check-area">
                    <p class="list-title">[기획·전략·경영 직무분야]</p>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>경영기획</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>경영혁신</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>기획</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>기획조사</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>변화관리</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>사업기획</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>사업제휴</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>서비스 기획</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>신규사업·BD</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>인수·합병</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>전략</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>조직관리</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>출판기획</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>타당성 분석</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>CEO</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>COO</p>
                    </div>
                    <div class="check">
                        <input type="checkbox"/>
                        <p>MBA</p>
                    </div>
                </div>
            </div>
            <div class="pop-up__result">
                <p>선택결과가 없습니다.</p>
                <button type="button" class="reset_btn">초기화</button>
            </div>
        </div>
        <div class="pop-up__btns">
            <button type="button" class="gray_btn_line closeBtn" onclick="hidePopup('${popupId}')">취소</button>
            <button type="button" class="primary_btn">확인</button>
        </div>
    </div>
</article>
<script type="text/javascript">
    $('.pop-up').css('display', 'block');
    $('.select-job').css('display','block');
</script>