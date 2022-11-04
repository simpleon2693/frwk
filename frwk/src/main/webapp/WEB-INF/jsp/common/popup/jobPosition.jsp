<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<article class="pop-up" id="${paramVO.popupId}">
    <div class="pop-up__area select-rank">
        <div class="pop-up__top">
            <h3 class="pop-up__title">직급·직책 선택</h3>
            <div class="search-bar pop-up-bar">
                <input type="text" class="pop-up-bar__textbar" placeholder="직급·직책을 검색하세요." />
                <button type="button" class="primary_btn" onclick="alert('준비중입니다');">검색</button>
            </div>
        </div>
        <div class="pop-up__cont">
            <div class="list-wrap">
                <div class="list-cont check-area" id="leftPanel">
                    <p class="list-title">[직급]</p>

                </div>
                <div class="list-cont check-area" id="rightPanel">
                    <p class="list-title">[직책]</p>
                </div>
            </div>
        </div>
        <div class="pop-up__btns">
            <button type="button" class="gray_btn_line closeBtn" onclick="hidePopup('${paramVO.popupId}')">취소</button>
            <button type="button" class="primary_btn" id="btnConfirm">확인</button>
        </div>
    </div>
</article>
<script id="template" type="x-tmpl-mustache">
{{#list}}
<div class="check">
    <input type="checkbox" value="{{detlCd}}|{{detlCdNm}}"/>
    <p>{{detlCdNm}}</p>
</div>
{{/list}}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<script type="text/javascript">
    var checkStates = [];
    var template = document.getElementById('template').innerHTML;

    function loadData(commonCode, position){
        $.ajax({
            url:'/common/popup/data/common.do',
            data: {commonCode},
            method: 'GET',
            contentType: 'application/json',
            success:function (data){
                var rendered = Mustache.render(template, {list:data});
                if(position==='left'){
                    $('#leftPanel').html(rendered);
                }else{
                    $('#rightPanel').html(rendered);
                }

            },
        })
    }

    $(function(){
        $('.pop-up').css('display','block');
        $('.select-rank').css('display','block');

        loadData("JOT", "left");
        loadData("JTM", "right");


        $(".pop-up__cont").on('change', 'input', function(e){

            var cd = $(this).val().split("|")[0];
            var nm = $(this).val().split("|")[1];
            if($(this).is(':checked')){
                // add
                checkStates.push({cd, nm})
            }else{
                // remove
                var itemToFind = checkStates.find(function(item) {return item.cd === cd})
                var idx = checkStates.indexOf(itemToFind)
                if (idx > -1) checkStates.splice(idx, 1)
            }
        });


        $("#btnConfirm").on("click", function(){

            // input[name=bttsCd] 의 value 에 코드 및 검색 키워드
            var code = checkStates.map(function(elm){
                return elm.cd
            }).join("|")
            var name = checkStates.map(function(elm){
                return elm.nm
            }).join("|")

            console.log(checkStates)
            $("input[name='${paramVO.codeInput}']").val(code);
            $("input[name='${paramVO.nameInput}']").val(name);

            // 창닫기
            hidePopup('${paramVO.popupId}')
        });
    });
</script>