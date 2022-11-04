<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/top.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal/userMyhome.css">
<%@ include file="../common/headerPersonal.jsp" %>

<main class="main">
	<section class="main__wrap">
	    <article class="box u-profile">
	        <div class="u-profile__top"></div>       	
	        <script id="myInfoTemp"  type="x-tmpl-mustache">
	        <div class="user">
	        	<div class="user__l">
	             	<div class="user__picture">
	                	<img src="${pageContext.request.contextPath}/img/user_pic.png" alt="개인회원 프로필 사진">
	                </div>
	                <button type="button" class="user__pic-btn"></button>
	            </div>
	            <div class="user__r">
	            	<div class="user__user-info">
	                	<h2>{{nm}} 님</h2>
	                    <p>남자 {{age}}세 ({{birthYear}} 년생)</p>
	                </div>
	            </div>
	        </div>
	        <div class="u-profile__state">
	        	<div class="u-profile__row">
	            	<p class="u-profile__title">퇴직소방관 인증</p>
	            	<p class="u-profile__accent">
						<strong> {{certiYn}} </strong>  {{certiDtFlag}} 
					</p>
	                <button type="button" class="accent_btn">바로가기</button>
	            </div>
	            <div class="u-profile__row">
	            	<p class="u-profile__title">등록이력서</p>
	                <p class="u-profile__accent"><strong class="totalCnt">-</strong>개 (인증일자 : 2022.09.30)</p>
	            </div>
	        </div>
	        <div class="u-profile__btn-wrap">
	        	<button type="button" class="primary_btn_line u-profile__btn">이력서 관리</button>
	        </div>
			</script>
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
	        <h3 class="box__title">내 이력서<span class="box__text">총 <strong class="totalCnt">-</strong>개</span></h3>
	         <div id="resumeTmplResult"></div>
	         <script id="myResumeListTemp" type="x-tmpl-mustache">
			 {{#list}}
			 <div class="resume">
		    	<div class="resume__l">
		         	<h3 class="resume__title" onclick="resumeModify({{rsuSeq}})">{{rsuSjt}}</h3>
		            <div class="resume__bottom">
		            	<div class="resume__text">
		                	<p>최종수정일</p>
		                    <p>{{modiDt}}</p>
		            	</div>
		            	<div class="resume__text">
		                	<p>등록일</p>
		                	<p>{{regDt}}</p>
		              	</div>
		            	<div class="resume__text">
		                	<p>열람현황</p>
		                	<p>-</p>
		           		</div>
		      		</div>
		   		</div>
		    	<div class="resume__btn-wrap">
		        	<button type="button" class="primary_btn_line_s" onclick="resumeModify({{rsuSeq}})">이력서 수정</button>
		        	<button type="button" class="gray_btn_line">이력서 삭제</button>
		  		</div>
			 </div>	
			{{/list}}
			{{^list}}
			<p class="no-data"> 현재 작성한 데이터가 없습니다. </p>
			{{/list}}
		</script>
			<div id="Pagination">
				<div class="pagenation">
			 		<button type="button" class="pagenation__num">1</button>
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
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<script src="${pageContext.request.contextPath}/js/personal/index.js"></script>
<%@ include file="../common/bottom.jsp" %>