<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="./common/top.jsp" %>
<%--해당페이지에만 쓰이는 CSS --%>
<link rel="stylesheet" href="/css/main.css">
<%--해당페이지에만 쓰이는 CSS --%>
<%@ include file="common/headerBase.jsp" %>


<main class="main">
    <section class="main__wrap">
        <article class="area-01">
            <div class="left">
                <div class="ad-box"></div>
                <div class="box">
                    <div class="box__title">
                        <h3>키워드별 채용</h3>
                    </div>
                    <div class="keyword-cont">
                        <button type="button" class="primary_btn_line">소방공무원</button>
                        <button type="button" class="primary_btn_line">소방</button>
                        <button type="button" class="primary_btn_line">소방안전관리자</button>
                        <button type="button" class="primary_btn_line">소방청</button>
                        <button type="button" class="primary_btn_line">소방설비기사</button>
                        <button type="button" class="primary_btn_line">소방교육</button>
                    </div>
                </div>
                <div class="box">
                    <div class="box__title">
                        <h3>지역별 채용</h3>
                    </div>
                    <div class="area-cont">
                        <button type="button">서울</button>
                        <button type="button">경기</button>
                        <button type="button">인천</button>
                        <button type="button">강원</button>
                        <button type="button">대전</button>
                        <button type="button">세종</button>
                        <button type="button">충남</button>
                        <button type="button">충북</button>
                        <button type="button">부산</button>
                        <button type="button">울산</button>
                        <button type="button">경남</button>
                        <button type="button">경북</button>
                        <button type="button">대구</button>
                        <button type="button">광주</button>
                        <button type="button">전남</button>
                        <button type="button">전북</button>
                        <button type="button">제주</button>
                        <button type="button">전국</button>
                    </div>
                </div>
            </div>
            <div class="right">
				<c:choose>
	                <c:when test="${sessionScope.loginVO.userType eq 'PERSONAL'}">
	                    <div class="box login">
	                        <div class="login__profile">
	                            <div class="profile_left">
	                                <div class="profile_pic">
	                                    <img src="/img/user_pic.png" alt="유저이미지">
	                                </div>
	                            </div>
	                            <div class="profile_right">
	                                <h3 class="name">홍길동</h3>
	                                <button type="button" onclick="location.href='/psn/index.do';" class="primary_btn_line">이력서 관리</button>
	                                <p>(수정일 2022.10.05)</p>
	                            </div>
	                        </div>
	                        <div class="login__sub">
	                            <a href="#">지원현황</a>
	                            <a href="#">열람기업</a>
	                            <a href="#">스크랩</a>
	                            <a href="#">최근 본 공고</a>
	                        </div>
	                    </div>
	                    <div class="box board-info main_btns">
	                        <button type="button" class="primary_btn">인재서비스 적성 검사 받기</button>
	                        <button type="button" class="accent_btn">퇴직소방관 경력인증제</button>
	                        <button type="button" class="primary_btn">구인기업회원 인증방법</button>
	                    </div>
	                </c:when>
	                <c:when test="${sessionScope.loginVO.userType eq 'COMPANY'}">
	                    <div class="box login">
	                        <div class="login__profile">
	                            <div class="profile_left">
	                                <div class="profile_pic">
	                                    <img src="/img/conp_pic.png" alt="유저이미지">
	                                </div>
	                            </div>
	                            <div class="profile_right">
	                                <h3 class="name">포스코119</h3>
	                                <button type="button" onclick="location.href='/com/index.do';" class="sub_btn_line">채용공고 관리</button>
	                                <p>(수정일 2022.10.05)</p>
	                            </div>
	                        </div>
	                        <div class="login__sub">
	                            <a href="#">지원현황</a>
	                            <a href="#">열람기업</a>
	                            <a href="#">스크랩</a>
	                            <a href="#">최근 본 인재</a>
	                        </div>
	                    </div>
	                    <div class="box board-info main_btns">
	                        <button type="button" class="primary_btn">인재서비스 적성 검사 받기</button>
	                        <button type="button" class="accent_btn">퇴직소방관 경력인증제</button>
	                        <button type="button" class="primary_btn">구인기업회원 인증방법</button>
	                    </div>
	                </c:when>
					<c:otherwise>
						<div class="box login">
		                    <button type="button" onclick="location.href='/login.do';" >개인회원<br>로그인</button>
		                    <button type="button" onclick="location.href='/login.do';" >기업회원<br>로그인</button>
		                    <div class="login__sub">
		                    	<a href="/signup.do" class="user-info__join">회원가입</a>
		                    	<a href="#" class="user-info__login">아이디 비밀번호 찾기</a>
		            			
		                    </div>
		                </div>
		                <div class="box board-info">
		                    <div class="box__title">
		                        <h3>공지사항·이벤트</h3>
		                    </div>
		                    <ul>
		                        <li><a href="#">[공지] 퇴직 소방관 인증받는 방법을 알려드립니다.</a></li>
		                        <li><a href="#">[이벤트] 오픈 이벤트 관련한 공지사항</a></li>
		                        <li><a href="#">[공지] 2022 하반기 대한소방공제회 신입채용...</a></li>
		                    </ul>
		                </div>
	                </c:otherwise>
	            </c:choose>            
            
                
            </div>
        </article>
        <article class="area-02 job">
            <div class="area-02__top">
                <h2>VVIP채용정보</h2>
                <a href="#" class="more">상품안내</a>
            </div>
            <div class="area-02__cont">
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-01.jpg" alt="VVIP채용공고 이미지-01">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)서해소방공사</p>
                            <span>D-34</span>
                        </div>
                        <h3>소방안전관리자 및 유틸리티 관리자 경력사원 모집 </h3>
                        <div class="bedge">
                            <span>#충북 청주시</span>
                            <span>#신입·경력</span>
                        </div>
                    </div>
                </div>
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-02.jpg" alt="VVIP채용공고 이미지-02">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)현대글로비스</p>
                            <span>D-34</span>
                        </div>
                        <h3>소방안전관리 팀장 및 팀원 모집</h3>
                        <div class="bedge">
                            <span>#연봉 4,000만원</span>
                            <span>#경기 화성시</span>
                        </div>
                    </div>
                </div>
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-03.jpg" alt="VVIP채용공고 이미지-03">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)청명엔지니어링</p>
                            <span>D-34</span>
                        </div>
                        <h3>[정규직] 소방관리&소방공사 채용공고</h3>
                        <div class="bedge">
                            <span>#경남 양산시</span>
                            <span>#경력 무관</span>
                            <span>#정규직</span>
                        </div>
                    </div>
                </div>
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-04.jpg" alt="VVIP채용공고 이미지-04">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)아모텍</p>
                            <span>D-34</span>
                        </div>
                        <h3>소방감리사 모십니다.</h3>
                        <div class="bedge">
                            <span>#대전 유성구</span>
                            <span>#경력 1~3년</span>
                        </div>
                    </div>
                </div>
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-05.jpg" alt="VVIP채용공고 이미지-05">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)포스코케미칼</p>
                            <span>D-34</span>
                        </div>
                        <h3>소방공사 전기팀 신입 및 경력직 모집 (필수 : 운전가능자)</h3>
                        <div class="bedge">
                            <span>#고졸 이상</span>
                            <span>#경력무관</span>
                        </div>
                    </div>
                </div>
                <div class="job__item">
                    <div class="pic">
                        <button type="button" class="btn_like"></button>
                        <img src="/img/main_vvip-06.jpg" alt="VVIP채용공고 이미지-06">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>용지로마스(주)</p>
                            <span>D-34</span>
                        </div>
                        <h3>소방시설관리사 채용합니다.</h3>
                        <div class="bedge">
                            <span>#계약직</span>
                            <span>#학력무관</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="area-02__btn">
                <button type="button" class=" gray_btn_line">더 많은 VVIP 채용정보 보기</button>
            </div> -->
        </article>
        <article class="area-02 job vip">
            <div class="area-02__top">
                <h2>VIP채용정보</h2>
                <a href="#" class="more">상품안내</a>
            </div>
            <div class="area-02__cont">
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-01.png" alt="VIP이미지-01">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>한국국제협력단</p>
                        </div>
                        <h3>2022 일반직·직원 채용</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-02.png" alt="VIP이미지-02">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>참엔지리어링(주)</p>
                        </div>
                        <h3>2022 하반기 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-03.png" alt="VIP이미지-03">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>키엔스코리아(주)</p>
                        </div>
                        <h3>각 부문 직원 채용</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-04.png" alt="VIP이미지-04">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>LS그룹</p>
                        </div>
                        <h3>2022 하반기 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-05.png" alt="VIP이미지-05">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>유니셈(주)</p>
                        </div>
                        <h3>반도체장비 유지보수 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-06.png" alt="VIP이미지-06">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>중소기업기술정보진흥원</p>
                        </div>
                        <h3>스마트한 인재 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-07.png" alt="VIP이미지-07">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)신성이엔지</p>
                        </div>
                        <h3>2022 하반기 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-08.png" alt="VIP이미지-08">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>노벨리스코리아(주)</p>
                        </div>
                        <h3>신입·경력 각 부분 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-09.png" alt="VIP이미지-09">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)에스티오</p>
                        </div>
                        <h3>2022 하반기 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item vip__item">
                    <div class="pic">
                        <img src="/img/main_vip-10.png" alt="VIP이미지-10">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)디알텍</p>
                        </div>
                        <h3>2022 하반기 사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
            </div>
        </article>
        <article class="area-02 job top">
            <div class="area-02__top">
                <h2>TOP채용정보</h2>
                <a href="#" class="more">상품안내</a>
            </div>
            <div class="area-02__cont">
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-01.png" alt="TOP 이미지-01">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)한익스프레스</p>
                        </div>
                        <h3>시설물 유지보수 공무관..</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-02.png" alt="TOP 이미지-02">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>LS그룹</p>
                        </div>
                        <h3>2022 LS그룹 하반기 채용</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-03.png" alt="TOP 이미지-03">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)쌍곰</p>
                        </div>
                        <h3>생산직 직원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-04.png" alt="TOP 이미지-04">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>동광제약(주)</p>
                        </div>
                        <h3>2022년 영업부 공개채용</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-05.png" alt="TOP 이미지-05">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>LG그룹 D&O</p>
                        </div>
                        <h3>레저사업부 신입/경력 채용</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
                <div class="job__item top__item">
                    <div class="pic">
                        <img src="/img/main_top-06.png" alt="TOP 이미지-06">
                    </div>
                    <div class="title">
                        <div class="title__s">
                            <p>(주)에스티오</p>
                        </div>
                        <h3>STO 하반기 신입사원 모집</h3>
                        <button type="button" class="btn_like"></button>
                        <p class="date">D-20</p>
                    </div>
                </div>
            </div>
        </article>
    </section>
</main>
<main>
    <section class="main__wrap">
        <article class="area-02 job deadline">
            <div class="area-02__top">
                <h2>마감임박 채용공고</h2>
            </div>
            <div class="area-02__cont">
                    <div class="job__item deadline__item">
                        <div class="title">
                            <div class="title__s">
                                <p>(주)영원교육법인</p>
                            </div>
                            <h3>[함영원 소방입시전문학원] 학원 강사 및 수강생 ...</h3>
                        </div>
                        <p class="date">D-2</p>
                    </div>
                    <div class="job__item deadline__item">
                        <div class="title">
                            <div class="title__s">
                                <p>(주)베르티스</p>
                            </div>
                            <h3>소방시설관리사 채용합니다.</h3>
                        </div>
                        <p class="date">D-2</p>
                    </div>
                    <div class="job__item deadline__item">
                        <div class="title">
                            <div class="title__s">
                                <p>(주)이랜드리테일</p>
                            </div>
                            <h3>소방감리사 모십니다.</h3>
                        </div>
                        <p class="date">D-2</p>
                    </div>
                    <div class="job__item deadline__item">
                        <div class="title">
                            <div class="title__s">
                                <p>AK PLAZA(에이케이플라자)</p>
                            </div>
                            <h3>소방공사 전기팀 신입 및 경력직 모집</h3>
                        </div>
                        <p class="date">D-2</p>
                    </div>
                </div>
        </article>
        <article class="area-03">
            <div class="left">
                <h2>잡119 서비스</h2>
                <div class="service">
                    <div class="service__item">
                        <p>직업심리검사로<br>직업 적성을 찾으세요.</p>
                        <button type="button">바로가기</button>
                    </div>
                    <div class="service__item">
                        <p>여러가지 상품들로<br>공고 효과를 극대화하세요.</p>
                        <button type="button">바로가기</button>
                    </div>
                </div>
            </div>
            <div class="right">
                <h2>잡119 정보 안내</h2>
                <div class="info_article">
                    <p>그림으로 보는 취업 동향</p>
                    <div class="news">
                        <div class="news__item">
                            <img src="/img/main_news-01.png" alt="취업동향-01">
                            <p>친환경 이동수단,그리고</p>
                        </div>
                        <div class="news__item">
                            <img src="/img/main_news-02.png" alt="취업동향-01">
                            <p>친환경 이동수단,그리고</p>
                        </div>
                        <div class="news__item">
                            <img src="/img/main_news-03.png" alt="취업동향-01">
                            <p>친환경 이동수단,그리고</p>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>
</main>


<%@ include file="./common/footer.jsp" %>
<%--해당페이지에만 쓰이는 JS ( 뷰 컨트롤러 등 ) --%>
<script src="/js/allHeader.js"></script>
<%--해당페이지에만 쓰이는 JS ( 뷰 컨트롤러 등 ) --%>
<%@ include file="./common/bottom.jsp" %>