<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../common/top.jsp" %>
<link rel="stylesheet" href="/css/company/jobregistrationstatus.css">
<%@ include file="../../common/headerCompany.jsp" %>
<%--  메인 컨텐츠   --%>
<main class="main">
    <section class="main__wrap divide">
        <aside class="page-nav">
            <h3 class="page-nav__title">채용공고 관리</h3>
            <nav>
                <ul>
                    <li><a href="/com/jobopen/registration.do">채용공고 등록</a></li>
                    <li><a href="/com/jobopen/status.do">채용공고 현황</a></li>
                </ul>
            </nav>
            <%--<button type="button" class="primary_btn_line">미리보기</button>
            <button type="button" class="primary_btn">채용공고 등록 완료</button>--%>
        </aside>
        <div class="contents">
            <article class="box">
                <div class="box__top">
                    <h3 class="box__title--color">채용공고 현황</h3>
                    <button type="button" class="primary_btn_line" onclick="location.href='/com/jobopen/registration.do'">채용공고 등록</button>
                </div>
                <div class="tab">
                    <button type="button" class="tab__item active user_btn">진행중(1)</button>
                    <button type="button" class="tab__item conp_btn">접수마감(5)</button>
                    <button type="button" class="tab__item conp_btn">채용종료(5)</button>
                </div>
                <div class="cont">
                    <div class="row">
                        <div class="list-btn">
                            <button type="button">등록일순</button>
                            <button type="button">수정일순</button>
                            <button type="button">마감일순</button>
                        </div>
                        <select>
                            <option>10개씩 보기</option>
                        </select>
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
            </article>
        </div>
    </section>
</main>



<script id="template" type="x-tmpl-mustache">
{{#data}}
<div class="state-list">
    <div class="state-list__top">
        <p>[공고번호 {{jobOpenSeq}}]</p>
        <div class="btn-wrap">
            <button type="button">공고보기</button>
            <button type="button">수정</button>
            <button type="button">복사</button>
            <button type="button">마감</button>
            <button type="button">삭제</button>
        </div>
    </div>
    <div class="state-list__bottom">
        <div class="list-title">
            <h3>{{title}}</h3>
            <span class="is-ing">진행중</span>
        </div>
        <div class="left">
            <div class="info">
                <p class="info__title">공고기간</p>
                <p>{{openStartDt}} ~ {{openEndDt}}</p>
            </div>
            <div class="info">
                <p class="info__title">등록</p>
                <p>{{regDt}}</p>
            </div>
        </div>
        <div class="right">
            <button type="button" class="state-notice" data-title="전체지원자">4</button>
            <button type="button" class="state-notice" data-title="미열람">4</button>
            <button type="button" class="state-notice" data-title="열람">4</button>
            <button type="button" class="state-notice" data-title="면접">4</button>
            <button type="button" class="state-notice" data-title="최종합격">4</button>
        </div>
    </div>
</div>
{{/data}}
</script>
<%@ include file="../../common/footer.jsp" %>
<script src="/js/otherHader.js"></script>
<script src="/js/company/jobopen/status.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<%@ include file="../../common/bottom.jsp" %>


