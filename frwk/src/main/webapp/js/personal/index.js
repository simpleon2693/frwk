$('document').ready(function() {
	selectMyResumeList('1');
});

/**
* 설   명 : 내 이력서 리스트 가져오기
* 사용법 : 페이지 진입시 로드
* 작성일 : 2022.10.20
* 작성자 : 김영지                   
**/
var resumeListArea = document.getElementById('myResumeListTemp').innerHTML;
var params = {
	 pageSize : 3
}
function selectMyResumeList(page) {
	params.pageNo = page;
	$.ajax({
		url : "/psn/resume/selectMyResumeList.do",
		data: params,
		method : "post",
		dataType : "json",
		success : function(result) {
			try {
				var cnt = result.totalCnt;
				var rendered = Mustache.render(resumeListArea, {list:result.data});
				
				$('#resumeTmplResult').html(rendered);	
				$('.totalCnt').html(cnt);
				
				showPaging(Math.ceil(cnt / 3),10,page,'selectMyResumeList',$("#Pagination"));		
			} catch(e) {
				console.log("error : " + e);
			} 
		},
		error : function (e) {
			console.log("error : " + e); 
		}
	});
}
/**
* 설   명 : 로그인한 내 정보 가져오기
* 사용법 : 페이지 진입시 로드
* 작성일 : 2022.10.20
* 작성자 : 김영지                   
**/
var myInfoArea = document.getElementById('myInfoTemp').innerHTML;
$.ajax({
	url : "/psn/resume/selectPsnInfo.do",
	method : "post",
	dataType : "json",
	success : function(data) {
		try {
			// Mustache Template 가공
			if(data.certiYn == '0') {
				data.certiYn = "인증 완료";
				// mustache if-else condition problem
				data.certiDtFlag = "(인증완료일 : "+ data.certiDt + ")";
			} else {
				data.certiYn = "인증 미완료";
			}
			
			var nowYear = new Date().getFullYear();
			data.birthYear = data.birthdd.substr(0,4);
			data.age = nowYear - data.birthYear;
			
			var rendered = Mustache.render(myInfoArea, data);
			$('.u-profile__top').html(rendered);	
		} catch(e) {
			console.log("error : " + e);
		} 
	},
	error : function (e) {
		console.log("error : " + e); 
	}
});

/**
* 설   명 :이력서 수정페이지 GO
* 사용법 : 버튼클릭 | 파라미터에 이력서 시퀀스
* 작성일 : 2022.10.18
* 작성자 : 김영지                   
**/
function resumeModify(rsuSeq) {
	location.href="/psn/resume/modifyRegistration.do?rsuSeq="+rsuSeq;
}
