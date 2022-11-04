$(document).ready(function(){

    /* 내부 링크 스크롤 */

    $('.page-nav li a').on('click',function(){
        let target= $(this.hash);
        let headerHight = 300;
        let offsetTop = target.offset().top - headerHight;
        $('html,body').animate({scrollTop:offsetTop},500);

    })

    /* 탭메뉴 */
    $('.tab__item').on('click',function(){

        let indexNum = $(this).index();

        if(indexNum == 0) {
            $('.user').css('display','block');
            $('.company').css('display','none');
            $('.user_btn').addClass('active');
            $('.conp_btn').removeClass('active');
        }

        else if(indexNum == 1) {
            $('.company').css('display','block');
            $('.user').css('display','none');
            $('.conp_btn').addClass('active');
            $('.user_btn').removeClass('active');
        }
    })

    /* 팝업 */
    $('.closeBtn').on('click',function(){
        $('.pop-up').css('display','none');
        $('.pop-up__area').css('display','none');
    })

    $('.contents .picture').on('click',function(){
        $('.pop-up').css('display','block');
        $('.upload-pic').css('display','block');
    })

    // $('#selecRank').on('click',function(){
    //     $('.pop-up').css('display','block');
    //     $('.select-rank').css('display','block');
    // })
    //
    // $('#selectJob').on('click',function(){
    //     $('.pop-up').css('display','block');
    //     $('.select-job').css('display','block');
    // })

    // $('#loadFile').on('click',function(){
    //     $('.pop-up').css('display','block');
    //     $('.bring-file').css('display','block');
    // })


})


jQuery.validator.setDefaults({
    onkeyup:false,
    onclick:false,
    onfocusout:false,
    showErrors:function(errorMap, errorList){
        if(errorList.length){
            var caption = $(errorList[0].element).attr('caption') ||
                $(errorList[0].element).attr('custom');
            alert('[' + caption + ']' + errorList[0].message);
        }
    }
});

/***
* 함수명 : hidePopup                             
* 설   명 : 팝업 숨기기
* 인   자 : 팝업 해당 아이디
* 사용법 : 온클릭 함수로 팝업 해당아이디 매개변수로 넣어줌
* 작성일 : 2022.10.13
* 작성자 : 김영지                   
***/
	function hidePopup(elementId) {
		$('body').removeClass('ScrollDisabled');
		$('#'+elementId).parents('#popFrame'+elementId).remove();	// 팝업 뼈대 div 제거
	};
	
/***
* 함수명 : showPopup                          
* 설   명 : 팝업 띄우기
* 인   자 : 팝업 해당 아이디
* 사용법 : url , 팝업해당아이디 , param 값을 넘겨줌
* 작성일 : 2022.10.13
* 작성자 : 김영지                   
***/	
	function showPopup(url , elementId , params) {
		$('body').addClass('ScrollDisabled');	// 부모페이지 스크롤 방지

		var popupFrameId = "popFrame"+elementId;	// 팝업 호출 뼈대 div 생성

	  	if(params != null && params != undefined) {
			$('.foot-row__wrap').append($('<div id="'+popupFrameId+'">').load(url, params));
	 	} else{
	    	$('.foot-row__wrap').append($('<div id="'+popupFrameId+'">').load(url));
		}
	};

