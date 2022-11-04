$(document).ready(function(){
	$('input[type=checkbox][id=chkSub]').change(function(){
		if($("#chkSub:checked").length==6){
			$("input:checkbox[name$='chkAll']").prop('checked', true);
		}else{
			$("input:checkbox[name$='chkAll']").prop('checked', false);
		}
	});
	
	$('input[type=checkbox][id=chkConpSub]').change(function(){
		if($("#chkSub:checked").length==6){
			$("input:checkbox[name$='chkConpAll']").prop('checked', true);
		}else{
			$("input:checkbox[name$='chkConpAll']").prop('checked', false);
		}
	});
});

$("#chkAll").on("click", function() {
    if($("input:checkbox[name='chkAll']").is(':checked')) {
    	$('input[type=checkbox][id=chkSub]').prop('checked',true);
    }else{
    	$('input[type=checkbox][id=chkSub]').prop('checked',false);
	}
});

$("#chkConpAll").on("click", function() {
    if($("input:checkbox[name='chkConpAll']").is(':checked')) {
    	$('input[type=checkbox][id=chkConpSub]').prop('checked',true);
    }else{
    	$('input[type=checkbox][id=chkConpSub]').prop('checked',false);
	}
});


document.querySelector(".naver").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/naver.do","naverPopup", "width=500,height=600");
});
document.querySelector(".kakao").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/kakao.do","kakaoPopup", "width=500,height=600");
});
document.querySelector(".google").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/google.do","googlePopup", "width=500,height=600");
});

//파일 선택 버튼
$(function () {
	$('#userBtnUpload').click(function (e) {
		e.preventDefault();
		$('#userInputFile').click();
	});
	$('#confBtnUpload').click(function (e) {
		e.preventDefault();
		$('#conpInputFile').click();
	});
	$('#logoBtnUpload').click(function (e) {
		e.preventDefault();
		$('#logoInputFile').click();
	});

});

//파일 선택시 파일명 input text 에 입력.
function changeValue(obj,userType){
	var filename = obj.value;
	filename = filename.split('/').pop().split('\\').pop();
	if(userType=='user'){
		$('#userFileName').val(filename);
	}else if(userType=='conp'){
		$('#conpFileName').val(filename);
	}else{
		$('#logoFileName').val(filename);
	}
}

//주소 api
function findAddress(userType) {
	new daum.Postcode({
		oncomplete: function(data) {

            var addr = '';		 // 주소 변수
            var extraAddr = ''; 	// 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            addr = data.roadAddress;
            
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
            if(userType=='PERSONAL'){
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $("input[name='userZipCd']").val(data.zonecode);
	            $("input[name='userAddr']").val(addr);
				if(extraAddr != "") {
					$("input[name='userAddr']").val(addr+" (" + extraAddr + ")");
				}
	            // 커서를 상세주소 필드로 이동한다.
				$("input[name='userDetailAddr']").focus();
			}else{
				 // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $("input[name='conpZipCd']").val(data.zonecode);
	            $("input[name='conpAddr']").val(addr);
				if(extraAddr != "") {
					$("input[name='conpAddr']").val(addr+" (" + extraAddr + ")");
				}
	            // 커서를 상세주소 필드로 이동한다.
				$("input[name='conpDetailAddr']").focus();
			}
        }
    }).open();
}


$.validator.addMethod(name, function(value, element, params){
});

$.validator.addMethod("regexPhone", function(value, element, regex){
	  var regExp = new RegExp(regex);
	  return regExp.test(value);
	});


$("form[name=frmPsnSignup]").validate({
    // debug: true,
	
    rules: {
        userId: {
            required: true
        },
        userPw: {
            required: true
        },
        userNm: {
            required: true
        },
        userPhn: {
            required: true
        },
        userBirth: {
            required: true
        },
        userEmailId: {
            required: true
        },
        userSex: {
            required: true
        },
        userEmailId: {
            required: true
        },
        userZipCd: {
            required: true
        },
        userAddr: {
            required: true
        },
        userDetailAddr: {
            required: true
        },
        chkAge: {
            required: true
        },
        chkService: {
            required: true
        },
        chkPrivacy: {
            required: true
        },
        validity: {
            required: true
        }
    },
    messages: {
    	userId: {
    		required: "를 필수로 입력하세요"
        },
        userPw: {
        	required: "를 필수로 입력하세요"
        },
        userNm: {
        	required: "을 필수로 입력하세요"
        },
        userPhn: {
        	required: "를 필수로 입력하세요"
        },
        userBirth: {
        	required: "을 필수로 입력하세요"
        },
        userEmailId: {
        	required: "을 필수로 선택하세요"
        },
        userSex: {
        	required: "을 필수로 선택하세요"
        },
        userZipCd: {
        	required: "를 필수로 입력하세요"
        },
        userAddr: {
        	required: "를 필수로 입력하세요"
        },
        userDetailAddr: {
        	required: "를 필수로 입력하세요"
        },
        chkAge: {
            required: "을 체크하세요"
        },
        chkService: {
            required: "을 체크하세요"
        },
        chkPrivacy: {
            required: "을 체크하세요"
        },
        validity: {
            required: "을 필수로 선택하세요"
        }
    }
    
});


$("form[name=frmComSignup]").validate({
    // debug: true,
	
    rules: {
    	bizrno: {
            required: true
        },
        conpNm: {
            required: true
        },
        conpCeo: {
            required: true
        },
        conpZipCd: {
            required: true
        },
        conpAddr: {
            required: true
        },
        conpDetailAddr: {
            required: true
        },
        conpFileName: {
            required: true
        },
        logoFileName: {
            required: true
        },
        chkConpService: {
            required: true
        },
        chkConpPrivacy: {
            required: true
        },
        validityConp: {
            required: true
        },
        conpId: {
            required: true
        },
        conpPW: {
            required: true
        },
        picNm: {
            required: true
        },
        picPhn: {
            required: true
        },
        picEmailId: {
            required: true
        },
        picDep: {
            required: true
        },
        picRank: {
            required: true
        },
        picTel: {
            required: true
        },
        picFax: {
            required: true
        }
    },
    messages: {
    	bizrno: {
    		required: "를 필수로 입력하세요"
        },
        conpNm: {
        	required: "를 필수로 입력하세요"
        },
        conpCeo: {
        	required: "을 필수로 입력하세요"
        },
        conpZipCd: {
        	required: "를 필수로 입력하세요"
        },
        conpAddr: {
        	required: "를 필수로 입력하세요"
        },
        conpDetailAddr: {
        	required: "를 필수로 선택하세요"
        },
        conpFileName: {
        	required: "을 필수로 등록하세요"
        },
        logoFileName: {
        	required: "을 필수로 등록하세요"
        },
        chkConpService: {
        	required: "을 체크하세요"
        },
        chkConpPrivacy: {
        	required: "을 체크하세요"
        },
        validityConp: {
            required: "을 체크하세요"
        },
        conpId: {
            required: "를 필수로 입력하세요"
        },
        conpPW: {
            required: "를 필수로 입력하세요"
        },
        picNm: {
            required: "을 필수로 입력하세요"
        },
        picPhn: {
        	required: "를 필수로 입력하세요"
        },
        picEmailId: {
        	required: "을 필수로 입력하세요"
        },
        picDep: {
        	required: "을 필수로 입력하세요"
        },
        picRank: {
        	required: "을 필수로 입력하세요"
        },
        picTel: {
        	required: "를 필수로 입력하세요"
        },
        picFax: {
        	required: "를 필수로 입력하세요"
        }
    }
    
});


