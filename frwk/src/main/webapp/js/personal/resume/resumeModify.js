
/**
* 설   명 : 작성한 이력서 가져오기
* 사용법 : 페이지 진입시 로드
* 작성일 : 2022.10.24
* 작성자 : 김영지                   
**/
var infoWrittenArea = document.getElementById('psnInfoWrittenTemp').innerHTML;
var anotherInfoWrittenArea = document.getElementById('anotherInfoWrittenTemp').innerHTML;
$.ajax({
	url : "/psn/resume/selectWrittenPsnInfo.do",
	method : "post",
	contentType : 'application/json',
	data : JSON.stringify({rsuSeq}),
	dataType : "json",
	success : function(data) {
		try {
			// mustache 데이터 가공
			if(data[0].rsuPubiYn == 0) data[0].rsuPubiYnChk = "checked";
			if(data[0].phnPubiYn == 0) data[0].phnPubiYnChk = "checked";
			if(data[0].sex == "F") {
				data[0].femaleChk = "checked";
			} else {
				data[0].maleChk = "checked";
			}
				
			if(data[0].repaYn == 0) data[0].repaYnChk = "checked";
			if(data[0].fnempYn == 0) data[0].fnempYnChk = "checked";
			if(data[0].fipiniYn == 0) data[0].fipiniYnChk = "checked";
			
			var infoRendered = Mustache.render(infoWrittenArea, {list:data});
			var anotherInforendered = Mustache.render(anotherInfoWrittenArea, {list:data});
		
			$('#cont_01 .box__top').after(infoRendered);	
			$('#cont_10 .box__top').after(anotherInforendered);	
			
		} catch(e) {
			console.log("error : " + e);
		} 
	},
	error : function (e) {
		console.log("error : " + e); 
	}
});

var licenseInfoWrittenArea = document.getElementById('licenseInfoWrittenTemp').innerHTML;
$.ajax({
	url : "/psn/resume/selectWrittenLicenseInfo.do",
	method : "post",
	contentType : 'application/json',
	data : JSON.stringify({rsuSeq}),
	dataType : "json",
	success : function(data) {
		try {
			var licenseInfoRendered = Mustache.render(licenseInfoWrittenArea, {list:data});
			$('#cont_04 .box__top').after(licenseInfoRendered);	
		} catch(e) {
			console.log("error : " + e);
		} 
	},
	error : function (e) {
		console.log("error : " + e); 
	}
});

