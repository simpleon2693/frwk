<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common/top.jsp" %>
<link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal/resumeView.css">
<%@ include file="../../common/headerPersonal.jsp" %>
<main class="main">
	<section class="main__wrap">
	    <article class="box">
	        <div class="box__top box__top--underline">
	            <h3>이력서 제목</h3>
	        </div>
	        <div class="box__cont box__cont--divide">
	            <div class="box__left">
	                <!-- <img src="" alt="이력서 사진"> -->
	         </div>
	         <div class="box__right">
	             <div class="box__right--row">
	                 <h5>홍길동 <span>1974년(49세/만48세)</span></h5>
	                 <p class="gender">남</p>
	             </div>
	             <div class="box__right--row">
	                 <p class="phone">010-1234-4567</p>
	                 <p class="call">02-123-1234</p>
	             </div>
	             <div class="box__right--row">
	                 <p class="address">(03385) 서울 은평구 대조동</p>
	                 <p class="mark box--orange">퇴직소방관 인증</p>
	             </div>
	         </div>
	     </div>
	 </article>
	 <article class="box">
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>학력</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:20%"/>
	                     <col style="width:40%"/>
	                     <col style="width:30%"/>
	                     <col style="width:10%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>재학기간</th>
	                         <th>학교명(소재지)</th>
	                         <th>전공</th>
	                         <th>구분</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>2002.02~2003.12</td>
	                         <td>한국대학교</td>
	                         <td>소방공학과</td>
	                         <td>졸업</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>경력</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:20%"/>
	                     <col style="width:26%"/>
	                     <col style="width:20%"/>
	                     <col style="width:20%"/>
	                     <col style="width:14%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>근무기간</th>
	                         <th>회사명</th>
	                         <th>직급/직책</th>
	                         <th>직무</th>
	                         <th>연봉</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>
	                             2002.02~2003.12
	                             <p class="box--orange">1년 10개월</p>
	                         </td>
	                         <td>삼성전자</td>
	                         <td>솔루션사업부 과장</td>
	                         <td>영업</td>
	                         <td>7,000만원</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>자격증</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:20%"/>
	                     <col style="width:40%"/>
	                     <col style="width:30%"/>
	                     <col style="width:10%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>취득일자</th>
	                         <th>자격증명</th>
	                         <th>발행처</th>
	                         <th>합격구분</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>2002.02</td>
	                         <td>정보처리기사</td>
	                         <td>한국인력관리공단</td>
	                         <td>합격</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>수상/교육/대외활동</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:10%"/>
	                     <col style="width:40%"/>
	                     <col style="width:30%"/>
	                     <col style="width:20%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>활동구분</th>
	                         <th>활동명</th>
	                         <th>발행처</th>
	                         <th>기간</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>수상</td>
	                         <td>국토교통부장관표창</td>
	                         <td>국토교통부</td>
	                         <td>2006.12 ~ 2007.01</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>희망근무조건</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:10%"/>
	                     <col style="width:30%"/>
	                     <col style="width:20%"/>
	                     <col style="width:40%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>고용형태</th>
	                         <th>희망근무지</th>
	                         <th>희망연봉</th>
	                         <th>지원분야</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>정규직</td>
	                         <td>서울시 구로구</td>
	                         <td>8,000만원</td>
	                         <td>소프트웨어, 프로젝트 관리</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>해외경험</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:20%"/>
	                     <col style="width:20%"/>
	                     <col style="width:60%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>기간</th>
	                         <th>국가명</th>
	                         <th>활동내용</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>2002.02 ~ 2003.12</td>
	                         <td>미국</td>
	                         <td>이런저런 업무를 수행하면서 일했어요</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>어학</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:33.3%"/>
	                     <col style="width:33.3%"/>
	                     <col style="width:33.3%"/>
	                 </colgroup>
	                 <thead>
	                     <tr>
	                         <th>어학구분</th>
	                         <th>외국어명</th>
	                         <th>회화능력</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <tr>
	                         <td>TOEIC</td>
	                         <td>영어</td>
	                         <td>상</td>
	                     </tr>
	                 </tbody>
	             </table>
	         </div>
	     </div>
	     <div class="table-box">
	         <div class="box__top table-box__top">
	             <h3>포트폴리오·기타문서</h3>
	         </div>
	         <div class="box__cont table-box__cont x_scroll">
	             <table>
	                 <colgroup>
	                     <col style="width:30%"/>
	                     <col style="width:70%"/>
	                 </colgroup>
	                        <thead>
	                            <tr>
	                                <th>포트폴리오</th>
	                                <th>추천서</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td>추천서</td>
	                                <td>
	                                    <a href="#">job119.png</a>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>포트폴리오</td>
	                                <td>
	                                    <a href="#">oflagdev.iptime.org:9096/psn/resume/registration.do#cont_0</a>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="table-box">
	                <div class="box__top table-box__top">
	                    <h3>취업우대</h3>
	                </div>
	                <div class="box__cont table-box__cont x_scroll">
	                    <table>
	                        <tbody>
	                            <tr class="table-box__row">
	                                <th>보훈대상 여부</th>
	                                <td>-</td>
	                                <th>취업보호대상 여부</th>
	                                <td>-</td>
	                                <th>고요지원금대상 여부</th>
	                                <td>-</td>
	                            </tr>
	                            <tr class="table-box__row">
	                                <th>병역사항</th>
	                                <td colspan="3">[군필] 1994.02 ~ 1997.04 육군 병장 제대</td>
	                                <th>장애 여부</th>
	                                <td>-</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="table-box">
	                <div class="box__top table-box__top">
	                    <h3>자기소개서</h3>
	                </div>
	                <div class="box__cont table-box__cont">
	                    <textarea placeholder="소개내용" readonly></textarea>
	                </div>
	            </div>
	        </article>
	    </section>
	</main>

<%@ include file="../../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/otherHader.js"></script>
<!-- 뷰 컨트롤러 -->
<%@ include file="../../common/bottom.jsp" %>