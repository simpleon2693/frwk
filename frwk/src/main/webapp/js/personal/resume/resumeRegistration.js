
 $("#loadJobPosition").on("click", function () {
    showPopup("/common/popup/jobPosition.do", "popJobPosition",
        {popupId: 'popJobPosition', codeInput: "jobCd", nameInput: "jobCdNm"}
    );
})

$("#loadJobList").on("click", function () {
    showPopup("/common/popup/jobList.do", "popJobList",
        {popupId: 'popJobList', codeInput: "jobList", nameInput: "jobListNm"}
    );
})

var tempStorage = false;

/**
* 설   명 : 학력사항 최종학력 선택에 따라 상세리스트 가변적 출력
* 사용법 : select 값 변경
* 작성일 : 2022.10.11
* 작성자 : 김영지                   
**/
$('#selectAcabkgCd').change(function() {
	var acabkgCd =$('#selectAcabkgCd').val();
	
	console.log(acabkgCd);
	
	$('.high_school').css('display', 'none');
	$('.college').css('display', 'none');
	$('.graduate_school').css('display', 'none');
	
	switch (true) {
		case ["SCH001"].includes(acabkgCd):  
			$('.high_school').css('display', 'block');
			break;
		case ["SCH002","SCH003"].includes(acabkgCd):   
			$('.college').css('display', 'block');
			break;
		case ["SCH004"].includes(acabkgCd):    
			$('.graduate_school').css('display', 'block');
			break;
	}
});

/**
* 설   명 : 학력사항 졸업상태 선택에 따라 상세리스트 가변적 출력
* 사용법 : select 값 변경
* 작성일 : 2022.10.11
* 작성자 : 김영지                   
**/
$('#selectAcabkgStaCd').change(function() {
	var acabkgStaCd = $('#selectAcabkgStaCd').val();
	$('select[name="acabkgStaCd"]').val(acabkgStaCd);
});

/**
* 설   명 : 희망연봉 선택시 text disabled
* 사용법 : 
* 작성일 : 2022.10.28
* 작성자 : 김영지                   
**/
$('#checkItvDeclYn').change(function() {
	if($('#checkItvDeclYn').is(':checked')) {
		$('input[name="desly"]').prop('disabled',true).prop('placeholder',"");
	} else {
		$('input[name="desly"]').prop('disabled',false).prop('placeholder',"희망연봉");
	}
});

/**
* 설   명 : 버튼누르면 폼 추가
* 사용법 : .primary_btn .add_btn 선언
* 작성일 : 2022.10.11
* 작성자 : 김영지                   
**/
var cloneCount = 1;
$(function() {
	$('.primary_btn.add_btn').click(function() {
		
		var cloneElement = $(this).prevAll('.cont').last().clone();
			
		// 포트폴리오는 파일첨부기능이있어서 id추가
		if(cloneElement.find('#portfoFnm')) {
			$('#portfoFnm').attr('id','portfoFnm'+cloneCount);
			$('#portfoFnmInput').attr('id','portfoFnmInput'+cloneCount);
		}
		cloneElement.find("input").val(""); //	클론객체 input 초기화
		cloneElement.find("textarea").val("");
		$(this).before(cloneElement);	
		cloneCount++;
	});
});
/**
* 설   명 : 회원정보 가져오기
* 사용법 : 체크박스 제어
* 작성일 : 2022.10.13
* 작성자 : 김영지                   
**/
// checkBox값이 변할때..
$("#profileApply").change(function() {
	if($(this).is(":checked") ) {
		$.ajax({
	  		url : "/psn/resume/selectPsnInfo.do",
	  		method : "post",
	  		dataType : "json",
	  		success : function(data) {
				try {
						$('#psnNm').val(data.nm);
						$('#psnBirthdd').val(data.birthdd);
						$("input:radio[name='sex'][value="+data.sex+"]").prop("checked", true);
						$('#psnEmail').val(data.email);
						$('#psnPhn').val(data.phn);
						$('#psnAddr').val(data.addr);
						$('#psnDetlAddr').val(data.detlAddr);
						$('#psnHpageAddr').val(data.hpageAddr);
						
						if(data.certiYn == "0") {
							// 투명하게 하기
							$('.state_ssucceed').toggleClass('makeTransparent');
							$('.state_failed').toggleClass('makeTransparent');
						} else {
							$('.state_ssucceed').toggleClass('makeTransparent');
							$('.state_failed').toggleClass('makeTransparent');
						}
						
						if(data.certiFnm) {
							// 실제파일명
							$('#inputCertiFnm').val("파일명 : "+data.certiFnm)
						}
						
				} catch(e) {
					console.log("error : " + e);
				} 
			},
			error : function (e) {
				console.log("error : " + e);
			}
		});
	} else {
		$("input:radio[name='sex']:radio[value='M']").prop("checked", true);
		$('.divide .info input[type="text"]').val(null);
		$('.state_ssucceed').toggleClass('makeTransparent');
		$('.state_failed').toggleClass('makeTransparent');
	}
});


/**
* 설   명 : 폼 유효성 검사
* 사용법 : https://www.incodom.kr/jquery-validation 참고
* 작성일 : 2022.10.12
* 작성자 : 김영지                   
**/
$("form[id=frmRsmRgstr]").validate({
	submitHandler: function (form) {
        $.ajax({
            url:form.action,
            type: form.method,
            data: $(form).serialize(),
            success: function(result){
                console.log(result);
				location.href='/psn/index.do';
            }
        })
        return false;
    },
    rules: {
		rsuSjt: {
            required: true
        },
		nm: {
			/*
			required: function () {
				// 임시저장 및 nm에 값이 없을때 유효성 패스
				if(tempStorage && $('#nm').val() == ""){
					return false;
				}
				return true;
			},
			*/
			required : true,
			minlength: 2
		},
		birthdd: {
			digits: true
		},
		email: {
			email: function () {
				return tempStorage != true;
			}
		},
		phn: {
			required: true,
			digits: true
		},
		hpageAddr: {
			url: true
		},
		enrolYr: {
			maxlength: 4
		},
		gradYr: {
			maxlength: 4
		},
		jncmpDd: {
			maxlength: 6
		},
		lvcmpDd: {
			maxlength: 6
		},
		acqYm: {
			maxlength: 6
		},
		startYm: {
			maxlength: 6
		},
		endYm: {
			maxlength: 6
		},
		ovsExpStartYm: {
			maxlength: 6
		},
		ovsExpEndYm: {
			maxlength: 6
		},
		jnarmyDd: {
			maxlength: 6
		},
		exparmyDd: {
			maxlength: 6
		}
    },
    messages: {
        rsuSjt: {
            required: "을 필수로 입력하세요."
        },
		nm: {
			required: "을 필수로 입력하세요.",
			minlength: "최소 2글자 이상 입력하세요."
		},
		birthdd: {
			digits: "숫자만 입력하세요."
		},
		email: {
			email : "입력하신 이메일은 규칙에 어긋납니다."
		},
		phn: {
			required: "을 필수로 입력하세요.",
			digits: "숫자만 입력하세요."
		},
		hpageAddr: {
			url: "입력하신 url은 규칙에 어긋납니다."
		},
		enrolYr: {
			maxlength: "최대 4글자 이하 입력하세요."
		},
		gradYr: {
			maxlength: "최대 4글자 이하 입력하세요."
		},
		jncmpDd: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		lvcmpDd: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		acqYm: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		startYm: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		endYm: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		ovsExpStartYm: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		ovsExpEndYm: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		jnarmyDd: {
			maxlength: "최대 6글자 이하 입력하세요."
		},
		exparmyDd: {
			maxlength: "최대 6글자 이하 입력하세요."
		}
    }
});

// 임시저장
function tempRegistration() {
	confirm("작성중인 이력서를 임시저장하시겠습니까?");
	tempStorage = true;	
}


/**
* 설   명 : 주소api 호출
* 사용법 : 다음카카오 api 사용
* 작성일 : 2022.10.12
* 작성자 : 김영지                   
**/
function findAddress() {
	new daum.Postcode({
		oncomplete: function(data) {

            var addr = '';		 // 주소 변수
            var extraAddr = ''; 	// 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

			// 상세주소는 현재 입력폼에없어서 주소명에 입력하게끔 처리함
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('psnZipcd').value = data.zonecode;
            document.getElementById("psnAddr").value = addr ;
			if(extraAddr != "") {
				 document.getElementById("psnAddr").value += " (" + extraAddr + ")";
			}
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("psnDetlAddr").focus();
        }
    }).open();
}


/**
* 설   명 : 이력서사진 크롭
* 사용법 : 이력서사진 크롭
* 작성일 : 2022.10.12
* 작성자 : 김영지                   
**/
$(function() {
	var cropper;
    $('#findProfilePic').on('change', function() {
        $('.bProfilePicArea').empty().append('<img id="beforeProfilePic" src="">');
        var image = $('#beforeProfilePic');
        var imgFile = $('#findProfilePic').val();
        var fileForm = /(.*?)\.(jpg|gif|png)$/;
		
        // 이미지가 확장자 확인 후 노출
        if(imgFile.match(fileForm)) {
        	var reader = new FileReader(); 
        	reader.onload = function(event) { 
        		image.attr("src", event.target.result);
        		cropper = image.cropper( {
        			dragMode: 'none',
        			viewMode:3,
        			aspectRatio: 3/4,
					minCropBoxWidth:130,
        			autoCropArea:1,
       				restore: false,
                    guides: false,
                    center: false,
                    highlight: false,
                    cropBoxMovable: true,
                    cropBoxResizable: true,
                    toggleDragModeOnDblclick: false
                });
            }; 
        	reader.readAsDataURL(event.target.files[0]);
        } 
	});
	
	$('.arrow').on('click', function() {
		$('.aProfilePicArea').html('<img id="afterProfilePic" src="">');
		
		var resultProfile = $('#beforeProfilePic');
		var result = $('#afterProfilePic');
		var canvas;
		if($('input[name="findProfilePic"]').val() != "") {
	    	canvas = resultProfile.cropper('getCroppedCanvas',{
	    		width:231,
	    		height:346
	    	});
			result.attr('src',canvas.toDataURL("image/jpg"));
			result.css({'height':'190px','width':'143px'});
		}
	});
});

function pic() {
	$('.pop-up').css('display','none');
    $('.pop-up__area').css('display','none');
	$('.picture').css('padding',0);
	
	var imgClone = $('#afterProfilePic').clone();
	
	$('.picture__upload').html(imgClone);
	
}


/**
* 설   명 : 파일찾기 
* 사용법 : 매개변수에 input file 넣기
* 작성일 : 2022.10.17
* 작성자 : 김영지                   
**/
function findFileList(element) {
	$('#'+element).click();
}
function insertForFileNm(element) {
	var elementVal = $("#"+element).val().split("\\");
	var elementNm = elementVal[elementVal.length-1];
	
	console.log(elementNm);
	
	$('#'+element+'Input').val(elementNm);
	
	/*
	if($(this).find('#portfoFnm')) {
		$('#'+element+'Input'+cloneCount).val(elementNm);
	} else {
		$('#'+element+'Input').val(elementNm);
	}
	*/
}

// test
function testClose() {
	 $('.pop-up').css('display','none');
        $('.pop-up__area').css('display','none');
}






