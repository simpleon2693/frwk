<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/top.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal/userMyhome.css">
<%@ include file="../common/headerPersonal.jsp" %>

<main class="main">
	<section class="main__wrap">
	    <article class="box u-profile">
	        <div class="u-profile__top">
	            <div class="user">
	                <div class="user__l">
	                    <div class="user__picture">
	                        <img src="${pageContext.request.contextPath}/img/user_pic.png" alt="개인회원 프로필 사진">
	                    </div>
	                    <button type="button" class="user__pic-btn"></button>
	                </div>
	                <div class="user__r">
	                    <div class="user__user-info">
	                        <h2>홍길동 님</h2>
	                        <p>남자 55세 (1968 년생)</p>
	                    </div>
	                </div>
	            </div>
	            <div class="u-profile__state">
	                <div class="u-profile__row">
	                    <p class="u-profile__title">퇴직소방관 인증</p>
	                    <p class="u-profile__accent"><strong>인증완료</strong>(인증완료일 : 2022.08.10)</p>
	                    <button type="button" class="accent_btn">바로가기</button>
	                </div>
	                <div class="u-profile__row">
	                    <p class="u-profile__title">등록이력서</p>
						<%-- 
	                    <p class="u-profile__accent"><strong>${resumeListCnt + 2} 개</strong>(인증일자 : 2022.09.30)</p>
	                    --%>
	                    <!-- // 시연종료후 삭제 ******************* -->
	                    <p class="u-profile__accent"><strong>3 개</strong>(인증일자 : 2022.09.30)</p>
	                </div>
	            </div>
	            <div class="u-profile__btn-wrap">
	                <button type="button" class="primary_btn_line u-profile__btn">이력서 관리</button>
	            </div>
	        </div>
	        <div class="u-profile__bottom">
	            <div class="user-now">
	                <button type="button" class="user-now__box">
	                    <h2 class="user-now__num">2</h2>
	                    <p class="user-now__kind">입사지원</p>
	                </button>
	                <button type="button" class="user-now__box">
	                    <h2 class="user-now__num">1</h2>
	                    <p class="user-now__kind">이력서 열람</p>
	                </button>
	                <button type="button" class="user-now__box">
	                    <h2 class="user-now__num">1</h2>
	                    <p class="user-now__kind">면접 제의</p>
	                </button>
	                <button type="button" class="user-now__box">
	                    <h2 class="user-now__num">8</h2>
	                    <p class="user-now__kind">스크랩</p>
	                </button>
	            </div>
	        </div>
	    </article>
	    
	    <article class="box">
	        <h3 class="box__title">내 이력서<span class="box__text">총 <strong>3개</strong></span></h3>
	       <%--  시연용 막아놓음 
	        <c:forEach items="${resumeList}" var="item" >
				<div class="resume">
	            <div class="resume__l">
	                <h3 class="resume__title" onclick="resumeModify(${item.rsuSeq})">${item.rsuSjt}</h3>
	                <div class="resume__bottom">
	                    <div class="resume__text">
	                        <p>최종수정일</p>
	                        <p>${item.modiDt}</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>등록일</p>
	                        <p>${item.regDt}</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>열람현황</p>
	                        <p>-</p>
	                    </div>
	                </div>
	            </div>
	            <div class="resume__btn-wrap">
	                <button type="button" class="primary_btn_line_s" onclick="resumeModify(${item.rsuSeq})">이력서 수정</button>
	                <button type="button" class="gray_btn_line">이력서 삭제</button>
	            </div>
	        </div>		        	
	        </c:forEach>
	         --%>
	         <!-- // 시연종료후 삭제 ********************** -->
	        <div class="resume">
	            <div class="resume__l">
	                <h3 class="resume__title" onclick="resumeModifyTest(3)" style="cursor: pointer;">소방설비기사 자격증 소지자, 소방설비를 책임지겠습니다.</h3>
	                <div class="resume__bottom">
	                    <div class="resume__text">
	                        <p>최종수정일</p>
	                        <p>2022-08-10 11:10</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>등록일</p>
	                        <p>2022-08-10 11:10</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>열람현황</p>
	                        <p>3건</p>
	                    </div>
	                </div>
	            </div>
	            <div class="resume__btn-wrap">
	                <button type="button" class="primary_btn_line_s" onclick="resumeModifyTest(3)">이력서 수정</button>
	                <button type="button" class="gray_btn_line">이력서 삭제</button>
	            </div>
	        </div>
	        <div class="resume">
	            <div class="resume__l">
	                <h3 class="resume__title" onclick="resumeModifyTest(2)"  style="cursor: pointer;">소방/방재 및 시설물관리 경험을 바탕으로 최선을 다하겠습니다.</h3>
	                <div class="resume__bottom">
	                    <div class="resume__text">
	                        <p>최종수정일</p>
	                        <p>2022-08-14 13:10</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>등록일</p>
	                        <p>2022-08-14 10:07</p>
	                    </div>
	                    <div class="resume__text">
	                        <p>열람현황</p>
	                        <p>3건</p>
	                    </div>
	                </div>
	            </div>
	            <div class="resume__btn-wrap">
	                <button type="button" class="primary_btn_line_s" onclick="resumeModifyTest(2)">이력서 수정</button>
	                <button type="button" class="gray_btn_line">이력서 삭제</button>
	            </div>
	        </div>
	        <div class="resume">
	            <div class="resume__l">
	                <h3 class="resume__title" onclick="resumeModifyTest(1)"  style="cursor: pointer;">소방공무원 경력 30년의 준비된 소방안전관리자 입니다.</h3>
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
	                <button type="button" class="primary_btn_line_s" onclick="resumeModifyTest(1)">이력서 수정</button>
	                <button type="button" class="gray_btn_line">이력서 삭제</button>
	            </div>
	        </div>
	        <button type="button" class="primary_btn" onclick="location.href='/psn/resume/registration.do';">이력서 작성</button>
	    </article>
	
	    <article class="box">
	        <h3 class="box__title">입사지원 현황</h3>
	        <div class="x_scroll">
	            <table>
	                <colgroup>
	                    <col style="width:10%">
	                    <col style="width:36%">
	                    <col style="width:10%">
	                    <col style="width:10%">
	                    <col style="width:10%">
	                    <col style="width:12%">
	                    <col style="width:12%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>지원일</th>
	                        <th>회사명/공고제목</th>
	                        <th>지원분야</th>
	                        <th>마감일</th>
	                        <th>지원방법</th>
	                        <th colspan="2">지원상태</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>2022-09-08 14:06:25</td>
	                        <td class="left">
	                            <a href="#">
	                                <p class="t_strong">한국전자금융(주) - 소방/방제 시설물 관리 ...</p>
	                            </a>
	                            <p>담당업무 - 소방/방제 시설물 관리</p>
	                        </td>
	                        <td>소방</td>
	                        <td>2022.09.22</td>
	                        <td>온라인</td>
	                        <td class="no_border">
	                            <p class="t_strong">지원 완료</p>
	                            <p class="t_accent">열람</p>
	                        </td>
	                        <td>
	                            <button type="button" class="gray_btn_line">지원 취소</button>
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
	                        <td>소방</td>
	                        <td>2022.09.22</td>
	                        <td>온라인</td>
	                        <td class="no_border">
	                            <p class="t_strong">지원 완료</p>
	                            <p class="t_gray">미열람</p>
	                        </td>
	                        <td>
	                            <button type="button" class="gray_btn_line">지원 취소</button>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </article>
	    <article class="box">
	        <h3 class="box__title">추천채용정보</h3>
	        <div class="x_scroll">
	            <table>
	                <colgroup>
	                    <col style="width:10%">
	                    <col style="width:46%">
	                    <col style="width:12%">
	                    <col style="width:12%">
	                    <col style="width:10%">
	                    <col style="width:10%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>공고일</th>
	                        <th>공고내용</th>
	                        <th>경력</th>
	                        <th>학력</th>
	                        <th colspan="2">소방근무</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>2022-10-11</td>
	                        <td class="left">
	                            <a href="#">
	                                <p class="t_strong">한국전자금융(주) - 소방/방제 시설물 관리 ...</p>
	                            </a>
	                            <p>담당업무 - 소방/방제 시설물 관리</p>
	                        </td>
	                        <td>신입·경력</td>
	                        <td>고졸</td>
	                        <td class="no_border">정규직</td>
	                        <td>
	                            <button type="button" class="primary_btn_line" onclick="alert('준비중입니다.');">스크랩</button>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <button type="button" class="primary_btn" onclick="alert('준비중입니다.');">맞춤 조건 등록</button>
	    </article>
	</section><!-- main__wrap end -->
</main>
<%@ include file="../common/footer.jsp" %>
<!-- 뷰 컨트롤러 -->
<script src="${pageContext.request.contextPath}/js/otherHader.js"></script>
<script src="${pageContext.request.contextPath}/js/personal/personalIndex.js"></script>
<%@ include file="../common/bottom.jsp" %>