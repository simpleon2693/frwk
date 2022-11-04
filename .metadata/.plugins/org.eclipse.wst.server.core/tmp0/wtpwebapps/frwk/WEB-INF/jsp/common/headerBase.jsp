<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
            <a href="/" class="logo__link">
                <img src="/img/logo.svg" alt="로고" />
            </a>
        </h1>
        <div class="search-area">
            <div class="search-bar">
                <button type="button" class="search-bar__search-btn"></button>
                <input type="text" class="search-bar__textbar" />
            </div>
        </div>
        <div class="user-info">
            <c:choose>
	            <c:when test="${empty sessionScope.loginVO}">
	            <a href="/login.do" class="user-info__login">로그인</a>
	            <a href="/signup.do" class="user-info__join">회원가입</a>
	            </c:when>
	            <c:otherwise>
	                <a href="/logout.do" class="user-info__login">로그아웃</a>
	            </c:otherwise>
            </c:choose>
        </div>
    </section>
    <nav class="head-nav">
        <ul class="head-nav__depth-01">
            <li class="sitemap head-nav__item-01"><a href="#">전체메뉴</a></li>
            <li class="head-nav__item-01 list-01"><a href="#">채용정보</a></li>
            <li class="head-nav__item-01 list-02"><a href="#">인재정보</a></li>
            <li class="head-nav__item-01"><a href="#">취업서비스</a></li>
            <li class="head-nav__item-01"><a href="#">맞춤정보</a></li>
        </ul>
        <div class="head-btn">
            <c:choose>
                <c:when test="${sessionScope.loginVO.userType eq 'PERSONAL'}">
                    <button type="button" class="primary_btn_icon ico_resume" onclick="location.href='/psn/resume/registration.do';">이력서 등록</button>
                </c:when>
                <c:when test="${sessionScope.loginVO.userType eq 'COMPANY'}">
                    <button type="button" class="sub_btn_icon ico_hire" onclick="location.href='/com/jobopen/registration.do';">채용공고 등록</button>
                </c:when>
				<c:otherwise>
	               <button type="button" class="primary_btn_icon ico_resume" onclick="location.href='/psn/resume/registration.do';">이력서 등록</button>
	               <button type="button" class="sub_btn_icon ico_hire" onclick="location.href='/com/jobopen/registration.do';">채용공고 등록</button>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="mega-menu all-menu sitemenu">
            <div class="mega-menu__row all-menu__row">
                <div>
                    <p class="mega-menu__title all-menu__title">전체메뉴</p>
                </div>
                <div>
                    <p>채용정보</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">일반채용</a></li>
                        <li class="mega-menu__item-02"><a href="#">지역별 채용</a></li>
                        <li class="mega-menu__item-02"><a href="#">분류별 채용</a></li>
                        <li class="mega-menu__item-02"><a href="#">조건별 채용</a></li>
                        <li class="mega-menu__item-02"><a href="#">맞춤 정보</a></li>
                    </ul>
                </div>
                <div>
                    <p>인재정보</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">일반인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">전문인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">능력별인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">맞춤 정보</a></li>
                    </ul>
                </div>
                <div>
                    <p>취업서비스</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">적성검사</a></li>
                        <li class="mega-menu__item-02"><a href="#">채용광고상품</a></li>
                    </ul>
                </div>
                <div>
                    <p>고객지원</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">공지사항</a></li>
                        <li class="mega-menu__item-02"><a href="#">자주묻는질문</a></li>
                        <li class="mega-menu__item-02"><a href="#">공고등록대행 안내</a></li>
                        <li class="mega-menu__item-02"><a href="#">온라인 문의</a></li>
                        <li class="mega-menu__item-02"><a href="#">채용서비스 안내</a></li>
                        <li class="mega-menu__item-02"><a href="#">제휴 및 배너광고 문의</a></li>
                        <li class="mega-menu__item-02"><a href="#">이용약관</a></li>
                        <li class="mega-menu__item-02"><a href="#">개인정보처리방침</a></li>
                        <li class="mega-menu__item-02"><a href="#">위치기반서비스 이용약관</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mega-menu all-menu menu-01">
            <div class="mega-menu__row all-menu__row">
                <div>
                    <p class="mega-menu__title all-menu__title">채용정보</p>
                </div>
                <div>
                    <p>일반채용</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">전체 채용공고</a></li>
                        <li class="mega-menu__item-02"><a href="#">오늘 등록정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">마감임박 채용정보</a></li>
                    </ul>
                </div>
                <div>
                    <p>지역별 채용</p>
                    <ul class="mega-menu__depth-02 all-menu__divide">
                        <li class="mega-menu__item-02"><a href="#">전국</a></li>
                        <li class="mega-menu__item-02"><a href="#">부산</a></li>
                        <li class="mega-menu__item-02"><a href="#">대전</a></li>
                        <li class="mega-menu__item-02"><a href="#">대구</a></li>
                        <li class="mega-menu__item-02"><a href="#">세종</a></li>
                        <li class="mega-menu__item-02"><a href="#">강원</a></li>
                        <li class="mega-menu__item-02"><a href="#">충남</a></li>
                        <li class="mega-menu__item-02"><a href="#">전남</a></li>
                        <li class="mega-menu__item-02"><a href="#">경남</a></li>
                        <li class="mega-menu__item-02"><a href="#">서울</a></li>
                        <li class="mega-menu__item-02"><a href="#">인천</a></li>
                        <li class="mega-menu__item-02"><a href="#">광주</a></li>
                        <li class="mega-menu__item-02"><a href="#">울산</a></li>
                        <li class="mega-menu__item-02"><a href="#">경기</a></li>
                        <li class="mega-menu__item-02"><a href="#">충북</a></li>
                        <li class="mega-menu__item-02"><a href="#">전북</a></li>
                        <li class="mega-menu__item-02"><a href="#">경북</a></li>
                        <li class="mega-menu__item-02"><a href="#">제주</a></li>
                    </ul>
                </div>
                <div>
                    <p>분류별 채용</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">업종(소방)</a></li>
                        <li class="mega-menu__item-02"><a href="#">업종(일반)</a></li>
                        <li class="mega-menu__item-02"><a href="#">직무</a></li>
                        <li class="mega-menu__item-02"><a href="#">자격</a></li>
                    </ul>
                </div>
                <div>
                    <p>조건별 채용</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">고용형태</a></li>
                        <li class="mega-menu__item-02"><a href="#">기업분류</a></li>
                        <li class="mega-menu__item-02"><a href="#">직급/직책</a></li>
                        <li class="mega-menu__item-02"><a href="#">우대사항</a></li>
                        <li class="mega-menu__item-02"><a href="#">복리후생</a></li>
                    </ul>
                </div>
                <div>
                    <p>맞춤 정보</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">맞춤 채용정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">스크랩 채용정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">오늘본 채용정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">맞춤 설정</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mega-menu all-menu menu-02">
            <div class="mega-menu__row all-menu__row">
                <div>
                    <p class="mega-menu__title all-menu__title">인재정보</p>
                </div>
                <div>
                    <p>일반인재</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">전체 인재정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">오늘 등록정보</a></li>
                    </ul>
                </div>
                <div>
                    <p>전문인재</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">소방 자격증</a></li>
                        <li class="mega-menu__item-02"><a href="#">소방관 근무경력</a></li>
                        <li class="mega-menu__item-02"><a href="#">해외 근무경력</a></li>
                        <li class="mega-menu__item-02"><a href="#">외국어 가능</a></li>
                    </ul>
                </div>
                <div>
                    <p>능력별 인재</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">자격증별 인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">외국어가능별 인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">지역별 인재</a></li>
                        <li class="mega-menu__item-02"><a href="#">경력조건별 인재</a></li>
                    </ul>
                </div>
                <div>
                    <p>맞춤 정보</p>
                    <ul class="mega-menu__depth-02">
                        <li class="mega-menu__item-02"><a href="#">맞춤 채용정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">오늘본 인재정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">스크랩 인재정보</a></li>
                        <li class="mega-menu__item-02"><a href="#">맞춤 설정</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div class="all-menu__bg"></div>
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
                <a href="#" class="user-info__login">로그인</a>
                <a href="#" class="user-info__join">회원가입</a>
            </div>
            <button type="button" class="m-nav__close"></button>
        </div>
        <ul class="m-nav__depth-01">
            <li class="m-nav__item-01"><a href="#">채용정보</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">일반 채용</a></li>
                    <li class="m-nav__item-02"><a href="#">지역별 채용</a></li>
                    <li class="m-nav__item-02"><a href="#">분류별 채용</a></li>
                    <li class="m-nav__item-02"><a href="#">조건별 채용</a></li>
                    <li class="m-nav__item-02"><a href="#">맞춤 정보</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">인재정보</a>
                <ul class="m-nav__depth-02">
                    <li class="m-nav__item-02"><a href="#">일반 인재</a></li>
                    <li class="m-nav__item-02"><a href="#">전문 인재</a></li>
                    <li class="m-nav__item-02"><a href="#">능력별 인재</a></li>
                    <li class="m-nav__item-02"><a href="#">맞춤 정보</a></li>
                </ul>
            </li>
            <li class="m-nav__item-01"><a href="#">취업서비스</a>
            </li>
            <li class="m-nav__item-01"><a href="#">고객지원</a>
            </li>
        </ul>
        <div class="m-nav__head-btn">
            <button type="button" class="primary_btn_icon ico_resume" onclick="location.href='/psn/resume/registration.do';">이력서 등록</button>
            <button type="button" class="sub_btn_icon ico_hire" onclick="location.href='/com/jobopen/registration.do';">채용공고 등록</button>
        </div>
    </nav>
</header>
