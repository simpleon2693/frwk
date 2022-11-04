<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/top.jsp" %>
<%--해당페이지에만 쓰이는 CSS --%>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/join.css">
<%--해당페이지에만 쓰이는 CSS --%>
<%@ include file="../common/headerBase.jsp" %>

<main class="main">
        <section class="main__wrap w-600">
            <article class="user">
            	<form name="frmPsnSignup" id="frmPsnSignup" method="post" action="/doSignup.do" novalidate="novalidate">
            	<input type="hidden" name="userType" value="PERSONAL">
                <div class="tab">
                    <button type="button" class="tab__item active user_btn">개인회원</button>
                    <button type="button" class="tab__item conp_btn">기업회원</button>
                </div>
                <div class="join__row">
                    <h3 class="join__title">소셜 간편 로그인</h3>
                    <div class="social">
                        <button type="button" class="social__btn naver" data-name="네이버 로그인"></button>
                        <button type="button" class="social__btn kakao" data-name="카카오 로그인"></button>
                        <button type="button" class="social__btn google" data-name="구글 로그인"></button>
                    </div>
                </div>
                <div class="join__row">
	                    <h3 class="join__title" data-text="*필수정보 입력입니다.">개인정보 입력</h3>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">아이디</p>
	                        <input type="text" name="userId" placeholder="8~12자의 영문,숫자,특수문자만" custom="아이디">
	                    </div>
	                    <p class="notice_text notice_text__warnning" style="display: none;">8~12자의 영문,숫자,특수문자만 가능합니다.</p>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">비밀번호</p>
	                        <input type="password" name="userPw" placeholder="8~12자의 영문,숫자,특수문자 중 3가지 이상 조합" maxlength="12" custom="패스워드">
	                    </div>
	                    <p class="notice_text notice_text__warnning" style="display: none;">유효하지 않은 비밀번호 입니다.</p>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">이름</p>
	                        <input type="text" name="userNm" custom="이름">
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">휴대전화</p>
	                        <div class="include">
	                            <input type="text" name="userPhn" placeholder="‘-’ 없이 입력"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="12" custom="휴대전화">
	                            <button type="button" class="primary_btn">본인인증</button>
	                        </div>
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">생년월일</p>
	                        <input type="text" name="userBirth" placeholder="YYYYMMDD (예:19991231)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="8" custom="생년월일">
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">성별</p>
	                        <div class="include flex_left">
	                            <label class="check">
	                                <input type="radio" name="userSex" value="M" custom="성별"/>
	                                <p class="w-radio">남자</p>
	                            </label>
	                            <label class="check">
	                                <input type="radio" name="userSex" value="F" custom="성별"/>
	                                <p class="w-radio">여자</p>
	                            </label>
	                        </div>
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">이메일</p>
	                        <div class="include">
	                            <input type="text" name="userEmailId"  custom="이메일"/>
	                            <p class="email">@</p>
	                            <select name="userEmail">
	                                <option>naver.com</option>
	                                <option>daum.com</option>
	                                <option>google.com</option>
	                                <option>nate.com</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="emphasis title">주소</p>
	                        <div class="add_text">
	                            <div class="include">
	                                <input type="text" name="userZipCd" placeholder="우편번호" custom="우편번호" readonly>
	                                <button type="button" class="primary_btn" onclick="findAddress('PERSONAL')">주소찾기</button>
	                            </div>
	                            <input type="text" name="userAddr" placeholder="도로명 주소" custom="도로명 주소" readonly>
	                            <input type="text" name="userDetailAddr" placeholder="상세 주소" custom="상세 주소">
	                        </div>
	                    </div>
	                    <div class="join__row put_text">
	                        <p class="title">퇴직소방관 인증</p>
	                        <div class="include">
	                            <input type="file" id="userInputFile" name="userInputFile"  style="display:none;" onchange="changeValue(this,'user')"/>
	                            <input type="text" id="userFileName" name="userFileName" placeholder="파일을 선택해 주세요." />
	                            <button type="button" id="userBtnUpload" class="primary_btn">파일선택</button>
	                        </div>
	                    </div>
	                    <p class="notice_text"><span>3개월 이내의</span> 퇴직(경력)증명서를 첨부해 주세요.</p>
	                    <div class="join__row put_text">
	                        <p class="info_text">퇴직(전직) 소방관님은<br>반드시 퇴직(경력)증명서를 제출해 주세요.<br>경력 인증절차를 거쳐 별도의 전문인재관리 시스템에 등록됩니다.</p>
	                        <div class="join__btns">
	                            <button type="button" class="accent_btn" onclick="window.open('https://www.gov.kr/mw/AA020InfoCappView.do?CappBizCD=00000000008')">경력증명서 발급<br>받으러 가기</button>
	                        </div>
	                    </div>
                    
                </div>
                <div class="join__row">
                    <h3 class="join__title">약관 동의</h3>
                    <div class="check_area">
                        <div class="top">
                            <label class="check">
                                <input type="checkbox" id="chkAll" name="chkAll"/>
                                <p>이용약관에 모두 동의합니다.</p>
                            </label>
                            <hr>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkAge" custom="필수동의 항목"/>
                                <p><span class="check__red">[필수]</span>만 15세 이상입니다.</p>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkService" custom="필수동의 항목"/>
                                <p><span class="check__red">[필수]</span>서비스 이용약관 동의</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkPrivacy" custom="필수동의 항목"/>
                                <p><span class="check__red">[필수]</span>개인정보 수집 및 이용 동의</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkPrivacyOptional"/>
                                <p>[선택] 개인정보 수집 및 이용 동의</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkSms"/>
                                <p>[선택] 광고성 정보 수신 동의 (SMS)</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkSub" name="chkEmail"/>
                                <p>[선택] 광고성 정보 수신 동의 (이메일)</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="join__row">
                    <h3 class="join__title">개인정보 유효기간 선택</h3>
                    <div class="include flex_left">
                    <div class="check_area check_area__flex">
                        <label class="check">
                            <input type="radio" name="validity" value="1" custom="개인정보 유효기간"/>
                            <p>1년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validity" value="3" custom="개인정보 유효기간"/>
                            <p>3년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validity" value="5" custom="개인정보 유효기간"/>
                            <p>5년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validity" value="0" custom="개인정보 유효기간"/>
                            <p>회원탈퇴시</p>
                        </label>
                    </div>
                    
                </div>
                <div class="join__row join__btns">
                    <button type="button" class="primary_btn_line" onclick="location.href='/index.do';">취소</button>
                    <!-- <button type="submit" class="primary_btn" form="frmPsnSignup">가입하기</button> -->
                    <button type="submit" class="primary_btn" >가입하기</button>
                </div>
                </form>
            </article>
            <article class="company" style="display: none;">
            	<form name="frmComSignup" id="frmComSignup" method="post" action="/doSignup.do" novalidate="novalidate">
            	<input type="hidden" name="userType" value="COMPANY">
                <div class="tab">
                    <button type="button" class="tab__item user_btn active">개인회원</button>
                    <button type="button" class="tab__item conp_btn">기업회원</button>
                </div>
                <div class="join__row">
                    <h3 class="join__title" data-text="*필수정보 입력입니다.">기업정보 입력</h3>
                    <div class="join__row put_text">
                        <p class="emphasis title">사업자 등록번호</p>
                        <input type="text" name="bizrno" placeholder="사업자등록번호 입력 (10자리 숫자만)" custom="사업자 등록번호">
                    </div>
                    <p class="notice_text notice_text__warnning" style="display: none;">사업등록번호 확인완료, 사업자등록증(증명원) 내용을 입력해주세요.</p>
                    <div class="join__row put_text">
                        <p class="emphasis title">기업명</p>
                        <input type="text" name="conpNm" placeholder="사업자등록증명원 기업명 기재" custom="기업명">
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">대표자명</p>
                        <input type="text" name="conpCeo" placeholder="사업자등록증명원 대표자명 기재" custom="대표자명">
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">회사 주소</p>
                        <div class="add_text">
                            <div class="include">
                                <input type="text" name="conpZipCd" placeholder="우편번호" custom="우편번호" readonly custom="우편번호">
                                <button type="button" class="primary_btn" onclick="findAddress('COMPANY')">주소찾기</button>
                            </div>
                            <input type="text" name="conpAddr" placeholder="도로명 주소" custom="도로명 주소" readonly custom="도로명 주소">
                            <input type="text" name="conpDetailAddr" placeholder="상세 주소" custom="상세 주소" custom="상세 주소">
                        </div>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">기업 인증</p>
                        <div class="include">
	                        <input type="file" id="conpInputFile" name="conpInputFile"  style="display:none;" onchange="changeValue(this,'conp')" />
	                        <input type="text" id="conpFileName" name="conpFileName" placeholder="파일을 선택해 주세요." custom="기업 인증"/>
	                        <button type="button" id="confBtnUpload" class="primary_btn">파일선택</button>
                        </div>
                    </div>
                    <p class="notice_text"><span>3개월 이내의</span> 사업자등록증명원을 첨부해 주세요.</p>
                    <button type="button" class="accent_btn orange_btn" onclick="window.open('https://www.gov.kr/mw/AA020InfoCappView.do?HighCtgCD=&CappBizCD=12100000016')">사업자등록 증명원 발급 받으러 가기</button>
                    <div class="join__row put_text">
                        <p class="emphasis title">로고등록</p>
                        <div class="include">
	                        <input type="file" id="logoInputFile" name="logoInputFile"  style="display:none;" onchange="changeValue(this,'logo')" />
	                        <input type="text" id="logoFileName" name="logoFileName" placeholder="파일을 선택해 주세요." custom="로고등록"/>
	                        <button type="button" id="logoBtnUpload" class="primary_btn">파일선택</button>
                        </div>
                    </div>
                </div>
                <div class="join__row">
                    <h3 class="join__title">약관 동의</h3>
                    <div class="check_area">
                        <div class="top">
                            <label class="check">
                                <input type="checkbox" id="chkConpAll" name="chkConpAll"/>
                                <p>이용약관에 모두 동의합니다.</p>
                            </label>
                            <hr>
                            <label class="check">
                                <input type="checkbox" id="chkConpSub" name="chkConpService" custom="필수동의 항목"/>
                                <p><span class="check__red">[필수]</span>서비스 이용약관 동의</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkConpSub" name="chkConpPrivacy" custom="필수동의 항목"/>
                                <p><span class="check__red">[필수]</span>개인정보 수집 및 이용 동의</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkConpSub" name="chkConpSms"  />
                                <p>[선택] 광고성 정보 수신 동의 (SMS)</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="chkConpSub" name="chkConpEmail"  />
                                <p>[선택] 광고성 정보 수신 동의 (이메일)</p>
                                <button type="button" class="primary_btn_line_s check__detail">세부내용</button>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="join__row">
                    <h3 class="join__title">기업정보 유효기간 선택</h3>
                    <div class="check_area check_area__flex">
                        <label class="check">
                            <input type="radio" name="validityConp" value="1" custom="개인정보 유효기간"/>
                            <p>1년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validityConp" value="3" custom="개인정보 유효기간"/>
                            <p>3년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validityConp" value="5" custom="개인정보 유효기간"/>
                            <p>5년</p>
                        </label>
                        <label class="check">
                            <input type="radio" name="validityConp" value="0" custom="개인정보 유효기간"/>
                            <p>회원탈퇴시</p>
                        </label>
                    </div>
                </div>
                <div class="join__row">
                    <h3 class="join__title" data-text="*필수정보 입력입니다.">인사담당자 정보</h3>
                    <div class="join__row put_text">
                        <p class="emphasis title">아이디</p>
                        <input type="text" name="conpId" placeholder="8~12자의 영문,숫자,특수문자만" custom="아이디">
                    </div>
                    <p class="notice_text notice_text__warnning" style="display: none;">유효하지 않은 아이디입니다.</p>
                    <div class="join__row put_text">
                        <p class="emphasis title">비밀번호</p>
                        <input type="password" name="conpPW" placeholder="8~12자의 영문,숫자,특수문자 중 3가지 이상 조합" custom="비밀번호">
                    </div>
                    <p class="notice_text notice_text__warnning" style="display: none;">유효하지 않은 비밀번호 입니다.</p>
                    <div class="join__row put_text">
                        <p class="emphasis title">담당자명</p>
                        <input type="text" name="picNm" custom="담당자명"/>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">담당자 연락처</p>
                        <div class="include">
                            <input type="text" name="picPhn" placeholder="핸드폰 번호 ‘-’ 없이 입력" custom="담당자 연락처">
                            <button type="button"  class="primary_btn">본인인증</button>
                        </div>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">담당자 이메일</p>
                        <div class="include">
                        	<input type="text" name="picEmailId"  custom="이메일"/>
                            <p class="email">@</p>
                            <select name="picEmail">
                                <option>naver.com</option>
                                <option>daum.com</option>
                                <option>google.com</option>
                                <option>nate.com</option>
                            </select>
                        </div>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">담당 부서명</p>
                        <input type="text" name="picDep" custom="담당 부서명"/>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">담당자 직급</p>
                        <input type="text" name="picRank" custom="담당자 직급"/>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">회사전화번호</p>
                        <input type="text" name="picTel" placeholder="예 : 02-123-1234" custom="회사전화번호"/>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">회사팩스번호</p>
                        <input type="text" name="picFax" placeholder="예 : 02-123-1234" custom="회사팩스번호"/>
                    </div>
                    <div class="join__row put_text">
                        <p class="emphasis title">연락처 노출구분</p>
                        <div class="include flex_left check_btns">
                            <label class="check">
                                <input type="checkbox" id="openYn" name="phnYn"/>
                                <p class="w-radio">핸드폰 공개</p>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="openYn" name="telYn"/>
                                <p class="w-radio">전화번호 공개</p>
                            </label>
                            <label class="check">
                                <input type="checkbox" id="openYn" name="emailYn"/>
                                <p class="w-radio">이메일 공개</p>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="join__row join__btns">
                    <button type="button" class="primary_btn_line">취소</button>
                    <button type="submit" class="primary_btn">가입하기</button>
                </div>
				</form>
            </article>
        </section>
    </main>


<%@ include file="../common/footer.jsp" %>
<script src="/js/allHeader.js"></script>
<script src="/js/signup.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 뷰 컨트롤러 -->
<%@ include file="../common/bottom.jsp" %>

