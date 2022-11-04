<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../common/top.jsp" %>
<link rel="stylesheet" href="/css/company/jobregistration.css">
<%@ include file="../../common/headerCompany.jsp" %>
<%--GNB 는 나눠서--%>
<%--  메인 컨텐츠   --%>
    <main class="main">
        <form name="frmJobOpen" method="post" action="/com/jobopen/actionRegistration.do" >
            <section class="main__wrap divide">
                <aside class="page-nav">
                    <h3 class="page-nav__title">채용공고 관리</h3>
                    <nav>
                        <ul>
                            <li><a href="/com/jobopen/registration.do">채용공고 등록</a></li>
                            <li><a href="/com/jobopen/status.do">채용공고 현황</a></li>
                        </ul>
                    </nav>
                    <button type="button" class="primary_btn_line">미리보기</button>
                    <button type="submit" class="primary_btn" id="btnRegistratioin">채용공고 등록 완료</button>
                </aside>
                <div class="contents">
                    <article class="box">
                        <div class="box__top">
                            <h3 class="box__title--color">채용공고 등록</h3>
                            <button type="button" class="primary_btn_line" id="loadPrevJobopen" onclick="alert('준비중입니다')"> 이전 공고 불러오기</button>
                        </div>
                        <div class="cont">
                            <div class="row">
                                <input type="text" class="w-100" placeholder="채용공고" name="title" caption="채용공고"/>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="box__top">
                                <h3 class="box__title">채용 분야</h3>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="hidden" name="jobArea.jobList"/>
                                    <input type="text" class="w-100" name="jobArea.jobListNm" caption="직무" placeholder="직무"  readonly />
                                    <button type="button" class="add-btn" id="loadJobList">전체보기</button>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="모집분야" name="jobArea.reciArea" caption="모집분야"/>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="hidden" name="bsttCd"/>
                                    <input type="text" class="w-100" name="bsttCdNm" caption="업종" placeholder="업종" readonly>
                                    <button type="button" class="add-btn" id="loadBusiness">전체보기</button>
                                </label>
                            </div>
                            <div class="row divide">
                                <p class="label">퇴직소방관</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.retFrmanCd" caption="퇴직소방관" value="RTF001" />
                                        <p>소방관 근무경력 필수</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.retFrmanCd" caption="퇴직소방관" value="RTF002" checked/>
                                        <p>소방관 근무 무관</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row divide">
                                <p class="label">경력</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.wkexpCd" caption="경력" value="JOG001"/>
                                        <p>신입</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.wkexpCd" caption="경력" value="JOG002"/>
                                        <p>경력</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.wkexpCd" caption="경력" value="JOG003" checked/>
                                        <p>경력 무관</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row divide">
                                <p class="label">고용형태</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="checkbox" name="jobArea.empTpList[]" value="EMT001" caption="고용형태"/>
                                        <p>정규직</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="checkbox" name="jobArea.empTpList[]" value="EMT002" caption="고용형태"/>
                                        <p>계약직</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="checkbox" name="jobArea.empTpList[]" value="EMT003" caption="고용형태"/>
                                        <p>프리랜서</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="checkbox" name="jobArea.empTpList[]" value="EMT004" caption="고용형태"/>
                                        <p>인턴</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="checkbox" name="jobArea.empTpList[]" value="EMT999" caption="고용형태"/>
                                        <p>기타</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row divide">
                                <p class="label">모집인원</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.recNumCd" caption="모집인원" value="ENN999" checked/>
                                        <p>직접입력 <input type="text" class="w-20" name="recNum" value="">명</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.recNumCd" caption="모집인원" value="ENN001"/>
                                        <p>0명</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.recNumCd" caption="모집인원" value="ENN002"/>
                                        <p>00명</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="jobArea.recNumCd" caption="모집인원" value="ENN003"/>
                                        <p>000명</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="hidden" name="jobArea.jobCd" />
                                    <input type="text" class="w-100" name="jobArea.jobCdNm" caption="직급/직책"
                                           placeholder="직급/직책" readonly>
                                    <button type="button" class="add-btn" id="loadJobPosition">전체보기</button>
                                </label>
                            </div>
                        </div>
                    </article>

                   <article class="box">
                        <div class="box__top">
                            <h3 class="box__title" >지원 자격</h3>
                            <!-- <h3 class="box__title box__notice" data-notice="학력사항은 모든 이력서에 동일하게 적용되며, 최종학력 기준으로 노출됩니다.">학력사항</h3> -->
                        </div>
                        <div class="cont">
                            <div class="row">
                                <!-- <input type="text" class="w-100-label" placeholder="학력"> -->
                                <select name="qualification.acabkgCd" caption="학력">
                                    <option value="SCH000" selected>학력무관</option>
                                    <option value="SCH001">고등학교</option>
                                    <option value="SCH002">대학(2,3)년</option>
                                    <option value="SCH003">대학(4년)</option>
                                    <option value="SCH004">대학원</option>
                                </select>
                                <%--<div class="input-check ml-10">
                                    <input type="checkbox" name="qualification.gradExpectYn" caption="졸업예정자 지원 여부" value="Y"/>
                                    <p>졸업예정자 지원 가능</p>
                                </div>--%>
                            </div>
                            <div class="row divide">
                                <p class="label">성별</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="radio" name="qualification.sexCd" caption="성별" value="SEX001" checked/>
                                        <p>성별 무관</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="qualification.sexCd" caption="성별" value="SEX002"/>
                                        <p>남자</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="qualification.sexCd" caption="성별" value="SEX001"/>
                                        <p>여자</p>
                                    </div>
                                    <button class="popup-btn">성차별금지-남여고용평등에 관한 법률</button>
                                </div>
                            </div>
                            <div class="row divide">
                                <p class="label">연령</p>
                                <div class="check divide-select">
                                    <div class="check__item">
                                        <input type="radio" name="qualification.ageCd" caption="연령" value="AGE001" checked/>
                                        <p>연령 무관</p>
                                    </div>
                                    <div class="check__item">
                                        <input type="radio" name="qualification.ageCd" caption="연령" value="AGE002" />
                                        <p>연령 제한</p>
                                    </div>
                                    <div class="check__item add-input">
                                        <div>
                                            <input type="text" class="w-50" name="qualification.underAge" caption="연령제한 하한">
                                            <p>세 이상</p>
                                        </div>
                                        <p class="m-20">~</p>
                                        <div>
                                            <input type="text" class="w-50" name="qualification.overAge" caption="연령제한 상한">
                                            <p>세 이하</p>
                                        </div>
                                    </div>
                                    <button class="popup-btn">연령차별금지-고용상 연령차별 금지에 관한 법률 </button>
                                </div>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="우대조건"
                                           name="qualification.condiList"
                                           caption="우대조건" readonly>
                                    <button type="button" class="add-btn">전체보기</button>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="외국어"
                                           name="qualification.langList"
                                           caption="외국어" readonly
                                    >
                                    <button type="button" class="add-btn">전체보기</button>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="자격증"
                                           name="qualification.licenList"
                                           caption="자격증" readonly
                                    >
                                    <button type="button" class="add-btn">전체보기</button>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="우대직무"
                                           name="qualification.jobList"
                                           caption="우대직무" readonly>
                                    <button type="button" class="add-btn">전체보기</button>
                                </label>
                            </div>
                        </div>
                    </article>
                    <article class="box">
                        <div class="box__top">
                            <h3 class="box__title">근무 조건</h3>
                        </div>
                        <div class="cont">
                            <div class="row">
                                <select name="workCondition.salCd" caption="급여구분">
                                    <option value="SAC001">연봉</option>
                                    <option value="SAC002">월급</option>
                                    <option value="SAC003">주급</option>
                                    <option value="SAC004">일급</option>
                                    <option value="SAC005">시급</option>
                                    <option value="SAC006">건별</option>
                                    <option value="SAC007" selected>회사내규에 따름</option>
                                </select>
                                <input type="text" class="ml-10" placeholder="최소급여" name="workCondition.minSal" caption="급여 하한"/>
                                <p class="m-20">~</p>
                                <input type="text" placeholder="최대급여" name="workCondition.maxSal" caption="급여 상한"/>
<%--                                <div class="input-check">--%>
<%--                                    <input type="checkbox" name="workCondition.afterIntSal" caption="면접후결정"/>--%>
<%--                                    <p>면접 후 결정</p>--%>
<%--                                </div>--%>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-100" placeholder="근무지역" name="workCondition.workPlace" catpion="근무지역">
                                    <button type="button" class="add-btn">추가하기</button>
                                </label>
                            </div>
                            <div class="row">
                                <label class="add-input">
                                    <input type="text" class="w-701 with-btn" placeholder="근무지 주소" id="workAddr"
                                           name="workCondition.workAddr" caption="근무지 주소">
                                    <button type="button" class="add-btn" onclick="findAddress('workAddr')">주소검색</button>
                                </label>
                                <button type="button" class="primary_btn submit_btn" onclick="alert('기능준비중입니다')">위치 보기</button>
                            </div>
                            <div class="row divide-input">
                                <select class="input-item" name="workCondition.subwLineCd" caption="지하철노선" id="subwayRegion">
                                    <optgroup label="수도권지하철">
                                        <option value="SS01">1호선</option>
                                        <option value="SS02">2호선</option>
                                    </optgroup>
                                    <optgroup label="부산권지하철">
                                        <option value="BS01">1호선</option>
                                        <option value="BS02">2호선</option>
                                    </optgroup>
                                </select>
                                <select class="input-item" name="workCondition.subwNmCd" caption="지하철역" id="subwayLine" >
                                </select>
                                <input type="text" class="input-item" name="workCondition.gateNum" caption="출구">
                                <p class="input-item">번 출구에서</p>
                                <select class="input-item" name="workCondition.distCd" caption="이내">
                                    <option value="INC001" select>5분</option>
                                    <option value="INC002">10분</option>
                                    <option value="INC003">15분</option>
                                    <option value="INC004">20분</option>
                                    <option value="INC005">30분</option>
                                </select>
                                <p class="input-item">이내</p>
                                <%--<button type="button" class="primary_btn input-item submit_btn">입력</button>--%>
                            </div>
                            <div class="row">
                                <input type="text" class="w-100" placeholder="복리후생" name="workCondition.walfare"
                                       caption="복리후생">
                            </div>
                        </div>
                    </article>
                    <article class="box">
                        <div class="box__top">
                            <h3 class="box__title">접수 기간</h3>
                        </div>
                        <div class="cont">
                            <div class="row">
                                <div class="calendar">
                                    <input type="date" class="w-150" placeholder="접수 시작일" name="openStartDt"
                                           caption="접수 시작일"
                                    >
                                    <p>~</p>
                                    <input type="date" class="w-150" placeholder="접수 마감일" name="openEndDt"
                                           caption="접수 마감일"
                                    >
                                </div>
                                <select class="ml-10" name="openEndTm">
                                    <option value="">선택</option>
                                    <option value="09">09:00</option>
                                    <option value="10">10:00</option>
                                    <option value="11">11:00</option>
                                    <option value="12">12:00</option>
                                    <option value="13">13:00</option>
                                    <option value="14">14:00</option>
                                    <option value="15">15:00</option>
                                    <option value="16">16:00</option>
                                    <option value="17">17:00</option>
                                    <option value="18">18:00</option>
                                    <option value="19">19:00</option>
                                    <option value="20">20:00</option>
                                    <option value="21">21:00</option>
                                    <option value="22">22:00</option>
                                    <option value="23">23:00</option>
                                    <option value="24">24:00</option>
                                </select>
                                <div class="input-check">
                                    <input type="checkbox" name="whenFullClose" caption="채용시마감"/>
                                    <p>채용 시 마감</p>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="box">
                        <div class="box__top">
                            <h3 class="box__title">인사담당자</h3>
                            <div class="input-check">
                                <button type="button" id="loadHr" class="primary_btn input-item" onclick="alert('준비중입니다.')"/>
                                <p>기존 인사담당자 적용</p>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="row">
                                <input type="text" placeholder="담당자명" name="mngerNm" caption="인사담당자명">
                                <input type="text" class="ml-10" placeholder="담당부서" name="dept" caption="부서">
                            </div>
                            <div class="row">
                                <input type="text" placeholder="전화번호(-)없이" name="phone" caption="전화번호">
                                <input type="text" class="w-279 ml-10" placeholder="메일주소" name="email" caption="메일주소">
                            </div>
<%--                            <div class="row">--%>
<%--                                <label class="add-input">--%>
<%--                                    <input type="text" class="w-701 with-btn" placeholder="회사주소" id="hrAddr" name="addr" caption="회사주소">--%>
<%--                                    <button type="button" class="add-btn" onclick="findAddress('hrAddr')">주소검색</button>--%>
<%--                                </label>--%>
<%--                                <button type="button" class="primary_btn submit_btn" >위치 보기</button>--%>
<%--                            </div>--%>
                        </div>
                    </article>
                    <article class="box">
                        <button type="button" class="primary_btn add_btn" onclick="alert('기능준비중입니다.');">입력한 내용으로 적용하기</button>
                        <!-- 
                        <div class="view">
                        </div>
                         -->
                    </article>
                </div>
            </section><!-- main__wrap end -->
        </form>

    </main>

<%@ include file="../../common/footer.jsp" %>
<script src="/js/company/jobopen/registration.js"></script>
<script src="/js/otherHader.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../../common/bottom.jsp" %>


