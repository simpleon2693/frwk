<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/top.jsp" %>
    <link rel="stylesheet" href="/css/company/index.css">
<%@ include file="../common/headerCompany.jsp" %>
<%--  메인 컨텐츠   --%>
    <main class="main">
        <section class="main__wrap">
            <article class="box u-profile">
                <div class="u-profile__top">
                    <div class="user">
                        <div class="user__l">
                            <div class="user__picture">
                                <img src="/img/conp_pic.png" alt="기업회원 프로필 사진">
                            </div>
                            <button type="button" class="user__pic-btn"></button>
                        </div>
                        <div class="user__r">
                            <div class="user__user-info">
                                <h2>포스코 119</h2>
                            </div>
                        </div>
                    </div>
                    <div class="u-profile__state">
                        <div class="u-profile__row">
                            <p class="u-profile__title">대표</p>
                            <p class="u-profile__nomal">홍길동</p>
                        </div>
                        <div class="u-profile__row">
                            <p class="u-profile__title">사업자등록증</p>
                            <p class="u-profile__nomal">123456-123456</p>
                        </div>
                        <div class="u-profile__row">
                            <p class="u-profile__title">기업인증완료</p>
                            <p class="u-profile__accent"><strong>기업인증완료</strong>(인증일자 : 2022.01.09)</p>
                            <button type="button" class="accent_btn">바로가기</button>
                        </div>
                        <div class="u-profile__row">
                            <p class="u-profile__title">등록 채용공고</p>
                            <p class="u-profile__accent"><strong>5개</strong>(수정일자 : 2022.09.30)</p>
                        </div>
                    </div>
                    <!-- <div class="u-profile__btn-wrap">
                        <button type="button" class="primary_btn_line u-profile__btn">이력서 관리</button>
                    </div> -->
                </div>
                <div class="u-profile__bottom">
                    <div class="user-now">
                        <button type="button" class="user-now__box">
                            <h2 class="user-now__num">3</h2>
                            <p class="user-now__kind">진행중 공고</p>
                        </button>
                        <button type="button" class="user-now__box">
                            <h2 class="user-now__num">12</h2>
                            <p class="user-now__kind">신규 지원자</p>
                        </button>
                        <button type="button" class="user-now__box">
                            <h2 class="user-now__num">2</h2>
                            <p class="user-now__kind">미열람 이력서</p>
                        </button>
                        <button type="button" class="user-now__box">
                            <h2 class="user-now__num">8</h2>
                            <p class="user-now__kind">스크랩 인재</p>
                        </button>
                        <button type="button" class="user-now__box">
                            <h2 class="user-now__num">8</h2>
                            <p class="user-now__kind">이용서비스</p>
                        </button>
                    </div>
                </div>
            </article>

            <article class="box">
                <h3 class="box__title">내 채용공고<span class="box__text">총 <strong>2개</strong></span></h3>
                <div class="resume">
                    <div class="resume__l">
                        <h3 class="resume__title">최고가 아닌 최선을 다하자는 신념으로 일하겠습니다.</h3>
                        <div class="resume__bottom">
                            <div class="resume__text">
                                <p>최종수정일</p>
                                <p>2022-08-10 11:00:55</p>
                            </div>
                            <div class="resume__text">
                                <p>등록일</p>
                                <p>2022-08-10 10:07:55</p>
                            </div>
                            <div class="resume__text">
                                <p>열람현황</p>
                                <p>3건</p>
                            </div>
                        </div>
                    </div>
                    <div class="resume__btn-wrap">
                        <button type="button" class="primary_btn_line_s">채용공고 수정</button>
                        <button type="button" class="gray_btn_line">채용공고 삭제</button>
                    </div>
                </div>
                <div class="resume">
                    <div class="resume__l">
                        <h3 class="resume__title">최고가 아닌 최선을 다하자는 신념으로 일하겠습니다.</h3>
                        <div class="resume__bottom">
                            <div class="resume__text">
                                <p>최종수정일</p>
                                <p>2022-08-25 16:00:55</p>
                            </div>
                            <div class="resume__text">
                                <p>등록일</p>
                                <p>2022-08-25 16:00:55</p>
                            </div>
                            <div class="resume__text">
                                <p>열람현황</p>
                                <p>3건</p>
                            </div>
                        </div>
                    </div>
                    <div class="resume__btn-wrap">
                        <button type="button" class="primary_btn_line_s">채용공고 수정</button>
                        <button type="button" class="gray_btn_line">채용공고 삭제</button>
                    </div>
                </div>
                <button type="button" class="primary_btn" onclick="location.href='/com/jobopen/registration.do'">채용공고 등록</button>
            </article>

            <article class="box">
                <h3 class="box__title">채용공고 현황</h3>
                <div class="x_scroll">
                    <table>
                        <colgroup>
                            <col style="width:10%">
                            <col style="width:50%">
                            <col style="width:10%">
                            <col style="width:10%">
                            <col style="width:10%">
                            <col style="width:10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>공고일</th>
                            <th>채용공고 제목</th>
                            <th>마감일</th>
                            <th>지원방법</th>
                            <th colspan="2">지원자 수</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--<tr>
                            <td>2022-09-08 14:06:25</td>
                            <td class="left">
                                <a href="#">
                                    <p class="t_strong">한국전자금융(주) - 소방/방제 시설물 관리 ...</p>
                                </a>
                                <p>담당업무 - 소방/방제 시설물 관리</p>
                            </td>
                            <td>2022.09.22</td>
                            <td>온라인</td>
                            <td class="no_border">
                                <p><span class="t_accent">11</span>명</p>
                            </td>
                            <td class="hire_btn-wrap">
                                <button type="button" class="primary_btn_line">공고 수정</button>
                                <button type="button" class="gray_btn_line">공고 마감</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2022-09-08 14:06:25</td>
                            <td class="left">
                                <a href="#">
                                    <p class="t_strong">한국전자금융(주) - 소방/방제 시설물 관리 ...</p>
                                </a>
                                <p>담당업무 - 소방/방제 시설물 관리</p>
                            </td>
                            <td>2022.09.22</td>
                            <td>온라인</td>
                            <td class="no_border">
                                <p><span class="t_accent">11</span>명</p>
                            </td>
                            <td class="hire_btn-wrap">
                                <button type="button" class="primary_btn_line">공고 수정</button>
                                <button type="button" class="gray_btn_line">공고 마감</button>
                            </td>
                        </tr>--%>
                        </tbody>
                    </table>
                </div>
            </article>
            <article class="box">
                <h3 class="box__title">추천인재정보</h3>
                <div class="x_scroll">
                    <table>
                        <colgroup>
                            <col style="width:10%">
                            <col style="width:50%">
                            <col style="width:10%">
                            <col style="width:10%">
                            <col style="width:10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>이름</th>
                            <th>이력서 제목</th>
                            <th>경력</th>
                            <th>학력</th>
                            <th colspan="2">근무형태</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>홍길동</td>
                            <td class="left">
                                <a href="#">
                                    <p class="t_strong">소방 안전을 책임지는 취업준비생입니다.</p>
                                </a>
                            </td>
                            <td>신입·경력</td>
                            <td>대학교</td>
                            <td class="no_border">정규직</td>
                            <td class="hire_btn-wrap">
                                <button type="button" class="primary_btn_line">스크랩</button>
                                <button type="button" class="gray_btn_line">맞춤 설정</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <button type="button" class="primary_btn">맞춤 설정</button>
            </article>

        </section><!-- main__wrap end -->
    </main>


<script id="template" type="x-tmpl-mustache">
{{#data}}
<tr>
    <td>{{regDt}}</td>
    <td class="left">
        <a href="#">
            <p class="t_strong">한국전자금융(주) - {{title}}</p>
        </a>
        <p>{{reciArea}}</p>
    </td>
    <td>{{openEndDt}}</td>
    <td>온라인</td>
    <td class="no_border">
        <p><span class="t_accent">11</span>명</p>
    </td>
    <td class="hire_btn-wrap">
        <button type="button" class="primary_btn_line">공고 수정</button>
        <button type="button" class="gray_btn_line">공고 마감</button>
    </td>
</tr>
{{/data}}
</script>
<%@ include file="../common/footer.jsp" %>

<script src="/js/otherHader.js"></script>
<script src="/js/company/index.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<%@ include file="../common/bottom.jsp" %>

