<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="./common/top.jsp" %>
<%--해당페이지에만 쓰이는 CSS --%>
    <link rel="stylesheet" href="/css/login.css">
<%--해당페이지에만 쓰이는 CSS --%>
<%@ include file="common/headerBase.jsp" %>

<main class="main">
    <section class="main__wrap divide">
        <article class="left user">
            <div class="tab">
                <button type="button" class="tab__item active user_btn">개인회원</button>
                <button type="button" class="tab__item conp_btn">기업회원</button>
            </div>
            <form name="frmPsnLogin" method="post" action="/doLogin.do">
                <input type="hidden" name="userType" value="PERSONAL" />
                <input type="text" name="userId" placeholder="아이디" custom="아이디"/>
                <input type="password" name="userPw" placeholder="비밀번호" custom="비밀번호"/>
                <button id="btn_psn_login" type="submit" class="primary_btn">로그인(개인)</button>
                <div class="check_wrap">
                    <label class="check">
                        <input type="checkbox" name="keepSession" />
                        <p>로그인 유지</p>
                    </label>
                    <label class="check">
                        <input type="checkbox"name="saveId"/>
                        <p>아이디 저장</p>
                    </label>
                </div>
            </form>
            <div class="social">
                <button type="button" class="social__btn naver" data-name="네이버 로그인"></button>
                <button type="button" class="social__btn kakao" data-name="카카오 로그인"></button>
                <button type="button" class="social__btn google" data-name="구글 로그인"></button>
            </div>
            <div class="login-sub">
                <a href="#">
                    <p>회원가입</p>
                </a>
                <a href="#">
                    <p>아이디 찾기</p>
                </a>
                <a href="#">
                    <p>비밀번호 찾기</p>
                </a>
            </div>

        </article>
        <article class="left company" style="display: none;">
            <div class="tab">
                <button type="button" class="tab__item user_btn">개인회원</button>
                <button type="button" class="tab__item conp_btn active">기업회원</button>
            </div>
            <form name="frmComLogin" method="post" action="/doLogin.do">
                <input type="hidden" name="userType" value="COMPANY">
                <input type="text" name="userId" placeholder="아이디" custom="아이디"/>
                <input type="password" name="userPw" placeholder="비밀번호" custom="비밀번호"/>
                <button id="btn_com_login" type="submit" class="primary_btn">로그인(기업)</button>
                <div class="check_wrap">
                    <label class="check">
                        <input type="checkbox" name="keepSession" />
                        <p>로그인 유지</p>
                    </label>
                    <label class="check">
                        <input type="checkbox" name="saveId" />
                        <p>아이디 저장</p>
                    </label>
                </div>
            </form>
            <div class="login-sub">
                <a href="#">
                    <p>회원가입</p>
                </a>
                <a href="#">
                    <p>아이디 찾기</p>
                </a>
                <a href="#">
                    <p>비밀번호 찾기</p>
                </a>
            </div>

        </article>
        <article class="right">
            <div class="right__ad">

            </div>
        </article>
    </section>
</main>


<%@ include file="./common/footer.jsp" %>
<script src="/js/allHeader.js"></script>
<!-- 뷰 컨트롤러 -->
<script src="/js/login.js"></script>
<%@ include file="./common/bottom.jsp" %>

