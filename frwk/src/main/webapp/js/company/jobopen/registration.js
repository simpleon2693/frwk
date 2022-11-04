var _kakaoPopup;

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

function setForm(data){
    
    // 채용분야
    $('input[name="title"]').val(data.title);
    $('input[name="jobArea.jobListNm"]').val(data.jobListNm);
    $('input[name="jobArea.reciArea"]').val(data.reciArea);
    $('input[name="bsttCdNm"]').val(data.bsttCdNm);
    $('input[name="jobArea.retFrmanCd"][value="' + data.retFrmanCd + '"]').prop('checked', true);
    $('input[name="jobArea.wkexpCd"][value="' + data.wkexpCd + '"]').prop('checked', true);

    if(data.empTpList.indexOf(',')>-1){
        data.empTpList.split(",").forEach(function(empTp){
            $('input[name="jobArea.empTpList[]"][value="' + empTp + '"]').prop('checked', true);
        })
    }else{
        $('input[name="jobArea.empTpList[]"][value="' + data.empTpList + '"]').prop('checked', true);
    }
    $('input[name="jobArea.recNumCd"][value="' + data.recuNumCd + '"]').prop('checked', true);
    $('input[name="jobArea.jobCdNm"]').val(data.jobCdNm);
    
    // 지원자격
    $('select[name="qualification.acabkgCd"] option[value="' +data.acabkgCd + '"]').prop('selected', true);
    $('input[name="qualification.sexCd"][value="' + data.sexCd + '"]').prop('checked', true);
    $('input[name="qualification.ageCd"][value="' + data.ageCd + '"]').prop('checked', true);

    $('input[name="qualification.condiList"]').val(data.condiList);
    $('input[name="qualification.langList"]').val(data.langList);
    $('input[name="qualification.licenList"]').val(data.licenList);
    $('input[name="qualification.prefJobList"]').val(data.prefJobList);

    // 근무조건
    $('select[name="workCondition.salCd"] option[value="' +data.salCd + '"]').prop('selected', true);
    $('input[name="workCondition.minSal"]').val(data.minSal);
    $('input[name="workCondition.maxSal"]').val(data.maxSal);

    $('input[name="workCondition.salDecideAfterInterview"]').prop('checked', data.salDeciAftrInv === 'Y'?true:false);
    $('input[name="ovsYn"][value="' + data.ovsYn + '"]').prop('checked', true);
    $('input[name="workCondition.workPlace"]').val(data.workPlace);
    $('input[name="workCondition.workAddr"]').val(data.workAddr);

    $('select[name="workCondition.subwLineCd"] option[value="' +data.subwLineCd + '"]').prop('selected', true);
    $('select[name="workCondition.subwNmCd"] option[value="' +data.subwNmCd + '"]').prop('selected', true);
    $('input[name="workCondition.gateNum"]').val(data.gateNum);
    $('input[name="workCondition.walfare"]').val(data.walfare);

    // 접수기간
    $('input[name="openStartDt"]').val(data.openStartDt);
    $('input[name="openEndDt"]').val(data.openEndDt);
    $('select[name="openEndTm"] option[value="' +data.openEndTm + '"]').prop('selected', true);

    // 인사담당자
    $('input[name="mngerNm"]').val(data.mngerNm);
    $('input[name="dept"]').val(data.dept);
    $('input[name="phone"]').val(data.phn);
    $('input[name="email"]').val(data.email);


}

$(document).ready(function () {
    // input 초기화
    loadDataSubCode('SS01');
    $('#subwayRegion').on("change", function(){
        console.log("change", $(this).val())
        loadDataSubCode($(this).val())
    })

    // 수정 모드일 경우는 데이터 로드
    if(_jobOpenSeq){

        // 데이터 로드
        $.ajax({
            url:'/com/jobopen/getJobOpenData.do',
            data: {jobOpenSeq:_jobOpenSeq},
            method: 'GET',
            contentType: 'application/json',
            success:function(data){
                console.log(data)
                setForm(data.data)


            }
        })
    }

    // 이벤트 등록
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
            {popupId: 'popPrevJobopen', codeInput: "", nameInput: ""}
        );
    })
    $("#loadBusiness").on("click", function () {
        showPopup("/common/popup/businessCode.do", "popBusinessCode",
            {popupId: 'popBusinessCode', codeInput: "bsttCd", nameInput: "bsttCdNm"}
        );
    })

    $("#openKakaoMap").on("click", function(){
        var windowFeatures = "left=100,top=300,width=600,height=500";
        var url = "/common/openpopup/kakaoMap.do";
        var workAddr = $("input[name='workCondition.workAddr']").val().trim();
        if(workAddr===''){
            alert('정확한 주소를 먼저 입력해 주세요')
            return false;
        }
        if(!_kakaoPopup) {
            _kakaoPopup = window.open(url + '?arg1=' + encodeURI(workAddr), 'kakaoMapPopup', windowFeatures);
            _kakaoPopup.onload = function() {
                _kakaoPopup.onbeforeunload = function () {
                    _kakaoPopup = undefined;
                }
            }
        } else {
            _kakaoPopup.focus();
        }
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
            ovsYn: {
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
            whenFullClose: {
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
            ovsYn: {
                required: "를 필수로 선택하세요"
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
            whenFullClose: {
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