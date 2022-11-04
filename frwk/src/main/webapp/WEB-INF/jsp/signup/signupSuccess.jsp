<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/top.jsp" %>
<%--해당페이지에만 쓰이는 CSS --%>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/join.css">
<%--해당페이지에만 쓰이는 CSS --%>
<%@ include file="../common/headerBase.jsp" %>

<main class="main">
    <section class="main__wrap w-600 flex_c">
        <div class="finishied">
            <h3 class="finishied__thin">축하합니다.<br>FIREWORK 사이트에 <span class="finishied__accent">
            	<c:if test="${userType eq 'PERSONAL'}">
            		개인회원
            	</c:if>
            	<c:if test="${userType ne 'PERSONAL'}">
            		기업회원
     			</c:if>       	
            	</span>으로 가입되셨습니다.</h3>
            <h3 class="finishied__mt-40">보다 많은 서비스를 위해서 로그인 하시겠습니까?</h3>
        </div>
            <div class="join__row join__btns">
                <button type="button" class="primary_btn_line" onclick="location.href='/index.do';">메인 화면으로 가기</button>
                <button type="button" class="primary_btn" onclick="location.href='/login.do';">로그인 하기</button>
        </article>
    </section>
</main>


<%@ include file="../common/footer.jsp" %>
<script src="/js/allHeader.js"></script>
<!-- 뷰 컨트롤러 -->
<%@ include file="../common/bottom.jsp" %>

