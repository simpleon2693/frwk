/**
* 설   명 : 내 이력서 리스트 가져오기
* 사용법 : 페이지 진입시 로드
* 작성일 : 2022.10.18
* 작성자 : 김영지                   
**/
// TODO el문-> ajax로변환 (페이지 진입시 로드)



/**
* 설   명 :이력서 수정페이지 GO
* 사용법 : 버튼클릭
* 작성일 : 2022.10.18
* 작성자 : 김영지                   
**/
function resumeModify(rsuSeq) {
	location.href="/psn/resume/registration.do?rsuSeq="+rsuSeq;
}

// 시연종료후 삭제 **********************
function resumeModifyTest(rsuSeq) {
	location.href="/psn/resume/registrationTest.do?rsuSeq="+rsuSeq;
}