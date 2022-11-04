<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
</head>
<body>
<article class="ad-top">
    <div class="ad-top__close-btn">
        <p>오늘 하루 보지 않기</p>
        <input type="checkbox" />
    </div>
</article>
<header class="header-d">
    <section class="head-wrap">
        <h1 class="logo">
            <a href="/index.do" class="logo__link">
                <img src="/img/logo.svg" alt="로고" />
            </a>
        </h1>
        <div class="search-area">
            <div class="search-bar">
                <button type="button" class="search-bar__search-btn"></button>
                <input type="text" class="search-bar__textbar" />
                <!-- <div class="search-bar__word">
                    <a href="#">소방시설</a>
                    <a href="#">시설</a>
                    <a href="#">건물관리</a>
                    <a href="#">급구</a>
                </div> -->
            </div>
        </div>
        <div class="user-info">
            <a href="/logout.do" class="user-info__login">로그아웃</a>
            <a href="#" class="user-info__join">정보수정</a>
        </div>
    </section>
    <nav class="head-nav">
        <ul class="head-nav__depth-01">
            <li class="sitemap head-nav__item-01"><a href="/psn/index.do">개인MY홈</a></li>
            <li class="head-nav__item-01"><a href="#">이력서 관리</a></li>
            <li class="head-nav__item-01"><a href="#">입사지원 관리</a></li>
            <li class="head-nav__item-01"><a href="#">MY맞춤정보</a></li>
            <li class="head-nav__item-01"><a href="#">취업서비스</a></li>
            <li class="head-nav__item-01"><a href="#">회원정보관리</a></li>
        </ul>
        <div class="head-btn">
            <button type="button" class="primary_btn_icon ico_resume" onclick="location.href='/psn/resume/registration.do';">이력서 등록</button>
            <!-- <button type="button" class="sub_btn_icon ico_hire">채용공고 등록</button> -->
        </div>
        <div class="mega-menu">
            <div class="mega-menu__row">
                <div>
                    <p>이력서 관리</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="/psn/resume/registration.do">이력서 등록</a></li>
                        <li class="mega-menu__item-02"><a href="#">이력서 현황</a></li>
                        <li class="mega-menu__item-02"><a href="#">인증 내역</a></li>
                    </ul>
                </div>
                <div>
                    <p>입사지원 관리</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">입사지원 현황</a></li>
                        <li class="mega-menu__item-02"><a href="#">이력서열람 현황</a></li>
                        <li class="mega-menu__item-02"><a href="#">면접 제의</a></li>
                        <li class="mega-menu__item-02"><a href="#">내 파일 관리</a></li>
                    </ul>
                </div>
                <div>
                    <p>MY맞춤정보</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">맞춤 정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">스크랩 정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">관심기업 정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">맞춤 설정</a></li>
                    </ul>
                </div>
                <div>
                    <p>취업서비스</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">적성 검사</a></li>
                    </ul>
                </div>
                <div>
                    <p>회원정보관리</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">회원정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">비밀번호 변경</a></li>
                        <li class="mega-menu__item-02"><a href="#">정보수신 설정</a></li>
                        <li class="mega-menu__item-02"><a href="#">사용자제한 설정</a></li>
                        <li class="mega-menu__item-02"><a href="#">간편로그인 관리</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div class="mega-menu__bg"></div>
</header>
<header class="header-m">
    <section class="head-wrap">
        <h1 class="logo">
            <a href="#" class="logo__link">
                <img src="/img/logo.svg" alt="로고" />
            </a>
        </h1>
        <button type="button" class="head-wrap__m-btn"></button>
    </section>
    <nav class="m-nav">
        <div class="m-nav__top">
            <div class="user-info">
                <a href="#" class="user-info__login">로그아웃</a>
                <a href="#" class="user-info__join">정보수정</a>
            </div>
            <button type="button" class="m-nav__close"></button>
        </div>
        <ul class="m-nav__depth-01">
            <li class="m-nav__item-01"><a href="#">이력서 관리</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="/psn/resume/registration.do">이력서 등록</a></li>
                    <li class="m-nav__item-02"><a href="#">이력서 현황</a></li>
                    <li class="m-nav__item-02"><a href="#">인증 내역</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">입사지원 관리</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">입사지원 현황</a></li>
                    <li class="m-nav__item-02"><a href="#">이력서열람 현황</a></li>
                    <li class="m-nav__item-02"><a href="#">면접 제의</a></li>
                    <li class="m-nav__item-02"><a href="#">내 파일 관리</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">MY맞춤정보</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">맞춤 정보</a></li>
                    <li class="m-nav__item-02"><a href="#">스크랩 정보</a></li>
                    <li class="m-nav__item-02"><a href="#">관심기업 정보</a></li>
                    <li class="m-nav__item-02"><a href="#">맞춤 설정</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">취업서비스</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">적성 검사</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">회원정보관리</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">회원정보</a></li>
                    <li class="m-nav__item-02"><a href="#">비밀번호 변경</a></li>
                    <li class="m-nav__item-02"><a href="#">정보수신 설정</a></li>
                    <li class="m-nav__item-02"><a href="#">사용자제한 설정</a></li>
                    <li class="m-nav__item-02"><a href="#">간편로그인 관리</a></li>
                </ul>
            </li>
        </ul>
        <div class="m-nav__head-btn">
            <button type="button" class="primary_btn_icon ico_resume">이력서 등록</button>
            <!-- <button type="button" class="sub_btn_icon ico_hire">채용공고 등록</button> -->
        </div>
    </nav>
</header>