$(function () {
    $("input[name='title'").val("영업직군 모집합니다.");
    $("input[name='jobArea.reciArea'").val("영업직 모집합니다. ");
    $("input[name='jobArea.jobCd'").val("부장");
    $("input[name='jobArea.jobRoleCd'").val("팀장");
    $("input[name='qualification.condiList'").val("전공,자차보유");
    $("input[name='qualification.langList'").val("일본어,영어");
    $("input[name='qualification.licenList'").val("자격증1, 자격증2");
    $("input[name='qualification.jobList'").val("소방공무원,군인");
    $("input[name='workCondition.walfare'").val("카페테리아,도서지원");
    $("input[name='openStartDt'").val("2022-09-01");
    $("input[name='openEndDt'").val("2022-09-30");
    $("input[name='workCondition.workPlace'").val("국내지역>서울시>구로구, 국내지역>서울시>영등포구");

    $("input[name='mngerNm'").val("인사담당자");
    $("input[name='dept'").val("HR부");
    $("input[name='phone'").val("01012345678");
    $("input[name='email'").val("test@test.com");
})

function loadDataSubCode(midCode){
    $.ajax({
        url:'/common/popup/data/sub.do',
        data: {midCode},
        method: 'GET',
        contentType: 'application/json',
        success:function (data){
            var html = '';
            data.forEach(function(elm){
                html += "<option value='"+elm.subClassCd + "||" + elm.subClassNm + "'>" + elm.subClassDetl + "</option>";
            })
            $('#subwayLine').children().remove()
            $('#subwayLine').append(html);
        },
    })
}

$(document).ready(function () {
    // input 초기화
    loadDataSubCode('SS01');
    $('#subwayRegion').on("change", function(){
        console.log("change", $(this).val())
        loadDataSubCode($(this).val())
    })

    // 이벤트
    $("#loadJobList").on("click", function () {
        showPopup("/common/popup/jobList.do", "popJobList",
            {popupId: 'popJobList', codeInput: "jobArea.jobList", nameInput: "jobArea.jobListNm"}
        );
    })
    $("#loadJobPosition").on("click", function () {
        showPopup("/common/popup/jobPosition.do", "popJobPosition",
            {popupId: 'popJobPosition', codeInput: "jobArea.jobCd", nameInput: "jobArea.jobCdNm"}
        )
        ;
    })
    $("#loadPrevJobopen").on("click", function () {
        showPopup("/com/jobopen/popup/prevJobopen.do", "popPrevJobopen",
            {}
        );
    })
    $("#loadBusiness").on("click", function () {
        showPopup("/common/popup/businessCode.do", "popBusinessCode",
            {popupId: 'popBusinessCode', codeInput: "bsttCd", nameInput: "bsttCdNm"}
        );
    })




    //
    $("form[name=frmJobOpen]").validate({
        submitHandler: function (form) {
            $.ajax({
                url: form.action,
                type: form.method,
                data: $(form).serialize(),
				/*
                success: function (data) {
                    alert(data)
                }
				시연용 요구사항으로 인하여 아래와 같이 수정 - 2022.10.19
				*/
				success: function (ret) {
					alert("저장에 성공하였습니다");
                    location.href ="/com/jobopen/status.do";
                }
            })
            return false;
        },
        rules: {
            title: {
                required: true
            },
            "jobArea.jobListNm": {
                required: true
            },
            "jobArea.reciArea": {
                required: true
            },
            "jobArea.bsttCdNm": {
                required: true
            },
            "jobArea.retFrmanCd": {
                required: true
            },
            "jobArea.wkexpCd": {
                required: true
            },
            "jobArea.empTpList[]": {
                required: true
            },
            "jobArea.recNumCd": {
                required: true
            },
            "jobArea.jobCdNm": {
                required: true
            },
            "jobArea.jobRoleCd": {
                required: true
            },
            "qualification.acabkgCd": {
                required: true
            },
            "qualification.sexCd": {
                required: true
            },
            "qualification.ageCd": {
                required: true
            },
            "workCondition.workPlace": {
                required: true
            },
            "workCondition.workAddr": {
                required: true
            },
            openStartDt: {
                required: true
            },
            openEndDt: {
                required: true
            },
            mngerNm: {
                required: true
            },
            dept: {
                required: true
            },
            phone: {
                required: true
            },
            email: {
                required: true
            },
        },
        messages: {
            title: {
                required: "를 필수로 입력하세요"
            },
            "jobArea.jobListNm": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.reciArea": {
                required: "를 필수로 입력하세요"
            },
            "jobArea.bsttCdNm": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.retFrmanCd": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.wkexpCd": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.empTpList[]": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.recNumCd": {
                required: "를 필수로 선택하세요"
            },
            "jobArea.jobCdNm": {
                required: "를 필수로 입력하세요"
            },
            "jobArea.jobRoleCd": {
                required: "를 필수로 입력하세요"
            },
            "qualification.acabkgCd": {
                required: "를 필수로 선택하세요"
            },
            "qualification.sexCd": {
                required: "를 필수로 선택하세요"
            },
            "qualification.ageCd": {
                required: "를 필수로 선택하세요"
            },
            "workCondition.workPlace": {
                required: "를 필수로 입력하세요"
            },
            "workCondition.workAddr": {
                required: "를 필수로 입력하세요"
            },
            openStartDt: {
                required: "를 필수로 선택하세요"
            },
            openEndDt: {
                required: "를 필수로 선택하세요"
            },
            mngerNm: {
                required: "를 필수로 선택하세요"
            },
            dept: {
                required: "를 필수로 선택하세요"
            },
            phone: {
                required: "를 필수로 선택하세요"
            },
            email: {
                required: "를 필수로 선택하세요"
            },
        }
    });
});

/**
 * 설   명 : 주소api 호출
 * 사용법 : 다음카카오 api 사용
 * 작성일 : 2022.10.12
 * 작성자 : 김영지
 **/
function findAddress(domSel) {
    new daum.Postcode({
        oncomplete: function (data) {

            var addr = '';		 // 주소 변수
            var extraAddr = ''; 	// 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 상세주소는 현재 입력폼에없어서 주소명에 입력하게끔 처리함
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById(domSel).value = addr + " ";
            if (extraAddr != "") {
                document.getElementById(domSel).value += " (" + extraAddr + ")" + " ";
            }
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById(domSel).focus();
        }
    }).open();
}