<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common/top.jsp" %>
<link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal/writeResume.css">
<%@ include file="../../common/headerPersonal.jsp" %>

<main class="main">
	<section class="main__wrap divide">
	    <aside class="page-nav">
	        <h3 class="page-nav__title">이력서 등록</h3>
	        <nav>
	            <ul>
	                <li><a href="#cont_01">기본정보</a></li>
	                <li><a href="#cont_02">학력사항</a></li>
	                <li><a href="#cont_03">경력사항</a></li>
	                <li><a href="#cont_04">자격증</a></li>
	                <li><a href="#cont_05">수상·교육·대외활동</a></li>
	                <li><a href="#cont_06">희망근무조건</a></li>
	                <li><a href="#cont_07">해외경험</a></li>
	                <li><a href="#cont_08">어학</a></li>
	                <li><a href="#cont_09">포트폴리오</a></li>
	                <li><a href="#cont_10">취업우대</a></li>
	                <li><a href="#cont_11">자기소개서</a></li>
	            </ul>
	        </nav>
	        <button type="button" class="primary_btn_line">미리보기</button>
	        <button type="button" class="primary_btn_line" style="margin-top: 0" onclick="tempRegistration()">이력서 임시저장</button>
	        <button type="submit" class="primary_btn" form="frmRsmRgstr">이력서 저장</button>
	    </aside>
	    <%-- jquery-validation.js 사용으로 caption(attr) 추가  --%>
	    <div class="contents">
	    	 <form id="frmRsmRgstr" autocomplete="off" method="post" action="/psn/resume/actionRegistration.do">
		        <article class="box" id="cont_01">
		            <div class="box__top">
		                <h3 class="box__title--color">이력서 등록</h3>
		                <button type="button" class="primary_btn_line">이전 이력서 불러오기</button>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <input type="text" class="w-100" placeholder="제목" name="rsuSjt" caption="제목" value="소방설비기사 자격증 소지자, 소방설비를 책임지겠습니다."/>
		                    <div class="check">
		                        <div class="check__item">
		                            <input type="checkbox" id="checkRsuPubiYn" name="rsuPubiYn"  checked="checked" value="0" />
		                            <p>
		                            	<label for="checkRsuPubiYn">이력서 공개</label>
		                            </p>
		                        </div>
		                        <div class="check__item">
		                            <input type="checkbox" id="checkPhnPubiYn" name="phnPubiYn" value="0"/>
		                            <p>
		                            	<label for="checkPhnPubiYn" checked="checked">연락처 비공개</label>
		                            </p>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="cont">
		                <div class="box__top">
		                    <h3 class="box__title">기본정보</h3>
		                    <div class="check">
		                        <div class="check__item">
		                            <input type="checkbox" id="profileApply"/>
		                            <p>
		                            	<label for="profileApply">회원정보 적용</label>
		                            </p>
		                        </div>
		                    </div>
		                </div>                        
		                <div class="divide">
		                    <div class="picture" style="padding: 0">
		                        <button type="button" class="picture__btn"></button>
		                        <div class="picture__upload">
		                        	 <img src="${pageContext.request.contextPath}/img/dummy.jpg" width="143" height="190" alt="dummy">
		                        </div>
		                    </div>
		                    <div class="info">
		                        <div class="row">
		                            <p class="label">
		                            	<label for="psnNm">이름</label>
		                            </p>
		                            <input type="text" class="w-360" placeholder="이름" id="psnNm" name="nm" caption="이름" value="홍길동"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">
		                            	<label for="psnBirthdd">생년월일</label>
		                            </p>
		                            <input type="text" class="w-360" placeholder="생년월일" id="psnBirthdd" name="birthdd" caption="생년월일" value="19681001"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">성별</p>
		                            <div class="check">
		                                <div class="check__item">
		                                    <input type="radio" id="psnSexM" name="sex" value="M" checked="checked" />
		                                    <p>
		                                    	<label for="psnSexM">남</label>
		                                    </p>
		                                </div>
		                                <div class="check__item">
		                                    <input type="radio" id="psnSexF" name="sex" value="F"/>
		                                    <p>
		                                    	<label for="psnSexF">여</label>
		                                    </p>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <p class="label">
		                            	<label for="psnEmail">이메일</label>
		                            </p>
		                            <input type="text" class="w-100-label" placeholder="이메일" id="psnEmail" name="email" caption="이메일"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">
		                            	<label for="psnPhn">휴대폰 번호</label>
		                            </p>
		                            <input type="text" class="w-360" placeholder="휴대폰 번호" id="psnPhn" name="phn" caption="휴대폰 번호"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">주소</p>
		                            <input type="text" class="w-279" placeholder="우편번호" id="psnZipcd" name="zipcd" readonly value="63309"/>
		                            <button type="button" class="primary_btn submit_btn" onclick="findAddress()">주소찾기</button>
		                            <input type="text" class="w-100-label double-input" placeholder="주소" id="psnAddr" name="addr" value="제주특별자치도 제주시 첨단로 242 (영평동)" caption="주소" readonly />
		                            <input type="text" class="w-100-label double-input" placeholder="주소 상세" id="psnDetlAddr" name="detlAddr" caption="주소 상세" value="63-5"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">
		                            	<label for="psnHpageAddr">홈페이지</label>
		                            </p>	
		                            <input type="text" class="w-100-label" placeholder="홈페이지 주소" id="psnHpageAddr" name="hpageAddr" caption="홈페이지 주소"/>
		                        </div>
		                        <div class="row">
		                            <p class="label">퇴직소방관 인증</p>
		                            <p class="state_ssucceed ">인증 완료</p>
		                            <p class="state_failed makeTransparent" >인증 미완료</p> 
		                            <input type="text" class="w-file" placeholder="퇴직.jpg" id="certiFnmInput" disabled/>
		                            <button type="button" class="primary_btn submit_btn" onclick="findFileList('certiFnm')">파일 찾기</button>
		                            <input type="file" class="makeDisplayNone" id="certiFnm" name="certiFnm" onchange="insertForFileNm('certiFnm')"/>
		                        </div>
		                        <div class="row outlink">
		                            <div class="outlink__text">
		                                <p>퇴직(전직) 소방관님은 반드시 퇴직(경력)증명서를 제출해 주세요.<br>경력 인증절차를 거쳐 별도의 전문인재관리 시스템에 등록됩니다.</p>
		                            </div>
		                            <button type="button" class="outlink__btn" onclick="window.open('https://www.gov.kr/mw/AA020InfoCappView.do?CappBizCD=00000000008')">
		                            	경력증명서<br>발급 받으러 가기
		                            </button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </article>
		        <article class="box" id="cont_02">
		            <div class="box__top">
		                <h3 class="box__title box__notice" data-notice="학력사항은 모든 이력서에 동일하게 적용되며, 최종학력 기준으로 노출됩니다.">학력사항</h3>
		            </div>
		            <div class="cont">
		            	<%-- (최종 학력 선택에 따라, 상세 리스트 가변적 출력 ) 현존컬럼만 name, id 설정함 --%>
		                <div class="row">
		                    <select id="selectAcabkgCd" name="acabkgCd">
		                        <option value="">최종 학력</option>
		                        <option value="1" >고등학교 졸업</option>
		                        <option value="2">대학교 졸업</option>
		                        <option value="3" selected="selected">대학원 졸업</option>
		                    </select>
		                    <select class="ml-10" id="selectAcabkgStaCd" name="acabkgStaCd">
		                        <option value="">졸업 상태</option>
		                        <option value="1">재학</option>
		                        <option value="2" selected="selected">졸업</option>
		                        <option value="3">휴학</option>
		                    </select>
		                </div>
		                 <div class="row high_school" style="display: none;">
		                    <input type="text" class="w-507" placeholder="고등학교명" name="schNm" caption="고등학교명">
		                    <input type="text" class="w-150 ml-10" placeholder="졸업년도 (ex:2022)" name="gradYr" caption="졸업년도">
		                    <select class="ml-10" id="selectHSchoolAcbkgStaCd" name="acabkgStaCd" disabled>
		                        <option value="">졸업상태</option>
		                        <option value="1">재학</option>
		                        <option value="2">졸업</option>
		                        <option value="3">휴학</option>
		                    </select>
		                </div>
		                <div class="row college" style="display: none;">
		                    <select>
		                        <option value="">대학구분</option>
		                        <option value="1">2년제</option>
		                        <option value="2">3년제</option>
		                        <option value="3">4년제</option>
		                    </select>
		                    <input type="text" class="w-314 ml-10" placeholder="대학명" name="schNm" caption="대학명">
		                    <input type="text" class="w-150 ml-10" placeholder="입학년도 (ex:2022)" name="enrolYr" caption="입학년도">
		                    <input type="text" class="w-150 ml-10" placeholder="졸업년도 (ex:2022)" name="gradYr" caption="졸업년도">                      
		                </div>
		                <div class="row college" style="display: none;">
		                    <input type="text" class="w-701" placeholder="전공" name="major" caption="전공">
		                    <select class="ml-10" id="selectCollegeAcbkgStaCd" name="acabkgStaCd" disabled>
		                        <option value="">졸업상태</option>
		                        <option value="1">재학</option>
		                        <option value="2">졸업</option>
		                        <option value="3">휴학</option>
		                    </select>
		                </div>
		                <%-- 2022.10.07 ppt일부수정으로 추가  --%>
		                <div class="row graduate_school" >
		                	<input type="text" class="w-477" placeholder="대학원명" name="schNm" caption="대학명" value="서울대학원">
		                	<input type="text" class="w-150 ml-10" placeholder="입학년도 (ex:2022)" name="enrolYr" caption="입학년도" value="1988">
		                    <input type="text" class="w-150 ml-10" placeholder="졸업년도 (ex:2022)" name="gradYr" caption="졸업년도" value="1995">  
		                </div>
		                <div class="row graduate_school" >
		                    <input type="text" class="w-701" placeholder="전공" value="경영학">
		                    <select class="ml-10" id="selectGSchoolAcbkgStaCd" name="acabkgStaCd" disabled>
		                        <option value="">졸업상태</option>
		                        <option value="1">재학</option>
		                        <option value="2" selected="selected">졸업</option>
		                        <option value="3">휴학</option>
		                    </select>
		                </div>
		            </div>
		        </article>
		        <article class="box" id="cont_03">
		            <div class="box__top">
		                <h3 class="box__title">경력 사항</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <select name="wkexpCd">
		                        <option value="1">경력 구분</option>
		                        <option value="1">신입</option>
		                        <option value="1" selected="selected">경력</option>
		                    </select>
		                </div>
		                <div class="row">
		                    <input type="text" class="w-314" placeholder="회사명" name="cmpNm" caption="회사명" value="대한소방">
		                    <input type="text" class="w-150 ml-10" placeholder="입사월 (ex:202210)" name="jncmpDd" caption="입사월" value="199005">
		                    <input type="text" class="w-150 ml-10" placeholder="퇴사월 (ex:202210)" name="lvcmpDd" caption="퇴사월" value="201201">
		                    <select class="ml-10" name="wkTpCd">
		                        <option value="1">고용형태</option>
		                        <option value="1" selected="selected">정규직</option>
		                        <option value="1">비정규직</option>
		                        <option value="1">프리랜서</option>
		                    </select>                    
		                </div>
		                <div class="row">
		                    <select class="w-279" name="job">
		                        <option value="1">직급/직책</option>
		                        <option value="1">사원</option>
		                        <option value="1">주임</option>
		                        <option value="1">차장</option>
		                        <option value="1" selected="selected">부장</option>
		                    </select>
		                    <select class="w-279 ml-10" name="jobList">
		                        <option value="1">직무</option>
		                        <option value="1" selected="selected">서비스</option>
		                        <option value="1">IT·인터넷</option>
		                        <option value="1">설비</option>
		                    </select>
		                    <input type="text" class="w-279 ml-10" placeholder="연봉" name="sly" caption="연봉" value="7500">
		                </div>
		                <div class="row">
		                    <textarea class="w-100 h-120" placeholder="담당업무" name="respJob" caption="담당업무">소방업</textarea>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">경력 추가</button>
		        </article>
		        <article class="box" id="cont_04">
		            <div class="box__top">
		                <h3 class="box__title">자격증</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <input type="text" class="w-314" placeholder="자격증명" name="licenNm" caption="자격증명" value="소방 설비 안전 2급">
		                    <input type="text" class="w-150 ml-10" placeholder="발행처" name="puco" caption="발행처" value="한국산업인력공단">
		                    <input type="text" class="w-150 ml-10" placeholder="취득월 (ex:202210)" name="acqYm" caption="취득일자" value="200005">
		                    <select class="w-150 ml-10" name="passCd">
		                        <option value="1">합격구분</option>
		                        <option value="1">합격</option>
		                        <option value="1">1차 합격</option>
		                        <option value="1">2차 합격</option>
		                    </select>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">자격증 추가</button>
		        </article>
		        <article class="box" id="cont_05">
		            <div class="box__top">
		                <h3 class="box__title">수상·교육·대외활동</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <select class="w-150" name="actiCd">
		                        <option value="1">활동 구분</option>
		                        <option value="1" selected="selected">수상</option>
		                        <option value="1">교육</option>
		                        <option value="1">대외활동</option>
		                    </select>
		                    <input type="text" class="w-314 ml-10" placeholder="활동명" caption="활동명" value="우수소방원">
		                    <input type="text" class="w-150 ml-10" placeholder="시작월 (ex:202210)" name="startYm" caption="시작일">
		                    <input type="text" class="w-150 ml-10" placeholder="종료월 (ex:202210)" name="endYm" caption="종료일">
		                </div>
		                <div class="row">
		                    <input type="text" class="w-100" placeholder="회사/단체/기관명" name="eduLicenNm" caption="회사/단체/기관명" value="(주)한국소방단체">
		                </div>
		                <div class="row">
		                    <textarea class="w-100 h-120" placeholder="활동내용" name="actiConts" caption="활동내역"></textarea>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">수상·교육·대외활동 추가</button>
		        </article>
		        <article class="box" id="cont_06">
		            <div class="box__top">
		                <h3 class="box__title">희망근무조건</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <select class="w-150" name="empCdtCd">
		                        <option value="1">희망 고용형태</option>
		                        <option value="1">프리랜서</option>
		                        <option value="1" selected="selected">정규직</option>
		                        <option value="1">비정규직</option>
		                    </select>
		                    <input type="text" class="w-314 ml-10 mb-0" placeholder="희망연봉" name="desly" caption="희망연봉">
		                    <div class="check">
		                        <div class="check__item mb-10">
		                            <input type="checkbox" name="itvDeclYn" checked="checked"/>
		                            <p>
		                          		<label for="checkItvDeclYn">면접 후 결정</label>
		                            </p>
		                        </div>
		                    </div>
		                </div>
		                <%-- todo: split 구분자 사용 --%>
		                <div class="row">
		                    <label class="add-input">
		                        <input type="text" class="w-100" placeholder="서울|경기|강원" disabled name="deslyWkpl" caption="희망 근무지역">
		                        <button type="button" class="add-btn">추가하기</button>
		                    </label>
		                </div>
		                <div class="row">
		                    <label class="add-input">
		                        <input type="text" class="w-100" placeholder="설비|서비스" disabled name="jobList" caption="희망 직무">
		                        <button type="button" class="add-btn">추가하기</button>
		                    </label>
		                </div>
		                <div class="row">
		                    <label class="add-input">
		                        <input type="text" class="w-100" placeholder="소방산업|산업" disabled name="induList" caption="산업">
		                        <button type="button" class="add-btn">추가하기</button>
		                    </label>
		                </div>
		            </div>
		            <%-- <button type="button" class="primary_btn add_btn">희망근무조건 추가</button> --%>
		        </article>
		        <article class="box" id="cont_07">
		            <div class="box__top">
		                <h3 class="box__title">해외 경험</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <input type="text" class="w-477" placeholder="국가명" name="couNm" caption="국가명" value="미국">
		                    <input type="text" class="w-150 ml-10" placeholder="시작월 (ex:202210)" name="ovsExpStartYm" caption="시작일" value="202001">
		                    <input type="text" class="w-150 ml-10" placeholder="종료월 (ex:202210)" name="ovsExpEndYm" caption="종료일" value="202005">
		                </div>
		                <div class="row">
		                    <textarea class="w-100 h-120" placeholder="활동내용" name="ovsExpConts" caption="활동내용"> 소방관련 해외연수 </textarea>
		                </div>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <input type="text" class="w-477" placeholder="국가명" name="couNm" caption="국가명" value="중국">
		                    <input type="text" class="w-150 ml-10" placeholder="시작월 (ex:202210)" name="ovsExpStartYm" caption="시작일" value="202011">
		                    <input type="text" class="w-150 ml-10" placeholder="종료월 (ex:202210)" name="ovsExpEndYm" caption="종료일" value="202107">
		                </div>
		                <div class="row">
		                    <textarea class="w-100 h-120" placeholder="활동내용" name="ovsExpConts" caption="활동내용"> 소방설비 세미나 및 어학연수 </textarea>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">해외 경험 추가</button>
		        </article>
		        <article class="box" id="cont_08">
		            <div class="box__top">
		                <h3 class="box__title">어학</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <select class="w-279" name="langTpCd">
		                        <option value="1">어학구분</option>
		                        <option value="1" selected="selected">TOEIC</option>
		                        <option value="1">IELTS</option>
		                        <option value="1">GRE</option>
		                    </select>
		                    <select class="w-279 ml-10" name="langCd">
		                        <option value="1">외국어명</option>
		                        <option value="1" selected="selected">영어</option>
		                        <option value="1">중국어</option>
		                        <option value="1">일본어</option>
		                    </select>
		                    <select class="w-279 ml-10" name="cpacCd">
		                        <option value="1">회화능력</option>
		                        <option value="1" selected="selected">상</option>
		                        <option value="1">중</option>
		                        <option value="1">하</option>
		                    </select>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">어학 추가</button>
		        </article>
		        <article class="box" id="cont_09">
		            <div class="box__top">
		                <h3 class="box__title">포트폴리오</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <select class="w-150" name="classfiCd">
		                        <option value="1">구분</option>
		                        <option value="1">포트폴리오</option>
		                        <option value="1" selected="selected">기획서</option>
		                        <option value="1">증명서</option>
		                        <option value="1">추천서</option>
		                    </select>
		                    <label class="add-input">
		                        <input type="text" class="w-701 ml-10" placeholder="한국소방업 및 설비.pdf" id="portfoFnmInput" disabled>
		                        <button type="button" class="add-btn" onclick="findFileList('portfoFnm')">내 파일 불러오기</button>
		                        <input type="file" class="makeDisplayNone" id="portfoFnm" name="portfoFnm" onchange="insertForFileNm('portfoFnm')"/>
		                    </label>
		                </div>
		            </div>
		            <button type="button" class="primary_btn add_btn">포트폴리오 추가</button>
		        </article>
		        <article class="box" id="cont_10">
		            <div class="box__top">
		                <h3 class="box__title">취업 우대</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <div class="check">
		                        <div class="check__item">
		                            <input type="checkbox" checked="checked" name="repaYn" value="0"/>
		                            <p>
		                            	<label for="checkRepaYn">보훈대상</label>
		                            </p>
		                        </div>
		                        <div class="check__item">
		                            <input type="checkbox" name="fnempYn" value="0"/>
		                            <p>
		                            	<label for="checkFnempYn">취업보호 대상</label>
		                            </p>
		                        </div>
		                        <div class="check__item">
		                            <input type="checkbox" name="fipinYn" value="0"/>
		                            <p>
		                            	<label for="checkFipinYn">고용지원금 대상</label>
		                            </p>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <select class="w-150" name="disabGrdCd">
		                        <option value="1">장애등급</option>
		                        <option value="1">1급</option>
		                        <option value="1">3급</option>
		                        <option value="1">5급</option>
		                    </select>
		                </div>
		                <div class="row">
		                    <select class="w-150" name="misvcCd">
		                        <option value="1">병역구분</option>
		                        <option value="1">전역</option>
		                        <option value="1">공익</option>
		                        <option value="1" selected="selected">면제</option>
		                    </select>
		                    <input type="text" class="w-150 ml-10" placeholder="입대월 (ex:202210)" name="jnarmyDd" caption="입대일"/>
		                    <input type="text" class="w-150 ml-10" placeholder="제대월 (ex:202210)" name="exparmyDd" caption="제대일"/>
		                    <select class="w-150 ml-10" name="clsCd">
		                        <option value="1">군별계급</option>
		                        <option value="1">병장</option>
		                        <option value="1">소위</option>
		                        <option value="1">중위</option>
		                    </select>
		                </div>
		            </div>
		        </article>
		        <article class="box" id="cont_11">
		            <div class="box__top">
		                <h3 class="box__title">자기소개서</h3>
		            </div>
		            <div class="cont">
		                <div class="row">
		                    <textarea class="w-100 h-120" placeholder="자기소개서" name="slfintro">설비경력 20년으로 탄탄한 업무실력을 보여드릴게요</textarea>
		                </div>
		            </div>
		            <%-- <button type="button" class="primary_btn add_btn">자기소개서 저장</button> --%>
		        </article>
			</form>
	    </div>
	</section><!-- main__wrap end -->
	<article class="pop-up">
	    <div class="pop-up__area upload-pic">
	        <div class="top-area">
	            <div class="search-bar pop-up-bar">
	            	<%-- 
	                <input type="text" class="pop-up-bar__textbar" placeholder="파일찾기" disabled/>
	                <button type="button" class="primary_btn">찾아보기</button>
	                 --%>
	                 <input type="file" name="findProfilePic" accept="image/*" capture="camera" id="findProfilePic" />
	            </div>
	            <p>권장 사진 사이즈는 103*132픽셀이며, gif,jpg,png 이미지 파일만 등록 가능합니다. 파일 선택 후 마우스를 드래그하여 사진 크기를 편집하세요.</p>
	        </div>
	        <div class="pop-up__cont">
	            <div class="left">
	                <p>원본사진</p>
	                <div class="resumeProfileArea">
	                	<div class="bProfilePicArea"></div>
	                </div>
	            </div>
	            <img src="${pageContext.request.contextPath}/img/ico_right.png" alt="오른쪽 화살표" class="arrow" style="cursor: pointer;">
	            <div class="right">
	                <p>이력서용 사진</p>
	                <div class="resumeProfileArea">
		                <div class="aProfilePicArea"></div>
	                </div>
	            </div>
	        </div>
	        <div class="pop-up__btns">
	            <button type="button" class="gray_btn_line" class="closeBtn" onclick="testClose()">취소</button>
	            <button type="button" class="primary_btn" id="submitBtn" onclick="pic()">확인</button>
	        </div>
	    </div>
	</article>
</main>
<%@ include file="../../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/otherHader.js"></script>
<!-- 뷰 컨트롤러 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://fengyuanchen.github.io/cropper/js/cropper.js"></script>
<script src="${pageContext.request.contextPath}/js/personal/resume/resumeRegistration.js"></script>
<%@ include file="../../common/bottom.jsp" %>