<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<article class="pop-up" id="${paramVO.popupId}">
    <div class="pop-up__area select-job">
        <div class="pop-up__top">
            <h3 class="pop-up__title">업종선택</h3>
            <div class="search-bar pop-up-bar">
                <input type="text" class="pop-up-bar__textbar" placeholder="직무 검색어를 검색하세요."/>
                <button type="button" class="primary_btn" onclick="alert('준비중입니다');">검색</button>
            </div>
        </div>
        <div class="pop-up__cont">
            <div class="list-wrap">
                <div class="list-cont" id="bigDepth">
                    <ul>
                    </ul>
                </div>
                <div class="list-cont" id="midDepth">
                    <ul>
                    </ul>
                </div>
                <div class="list-cont check-area" id="subDepth">

                </div>
            </div>
            <div class="pop-up__result">
            </div>
        </div>
        <div class="pop-up__btns">
            <button type="button" class="gray_btn_line closeBtn" onclick="hidePopup('${paramVO.popupId}')">취소</button>
            <button type="button" class="primary_btn" id="btnConfirm">확인</button>
        </div>
    </div>
</article>
<script id="template-big" type="x-tmpl-mustache">
<ul>
    {{#list}}
    <li cd={{bigClassCd}} nm={{bigClassNm}}>{{bigClassDetl}}</li>
    {{/list}}
</ul>
</script>
<script id="template-mid" type="x-tmpl-mustache">
<ul>
    {{#list}}
    <li cd={{midClassCd}} nm={{midClassNm}}>{{midClassDetl}}</li>
    {{/list}}
</ul>
</script>
<script id="template-sub" type="x-tmpl-mustache">
{{#list}}
<div class="check">
    <input type="checkbox" value="{{subClassCd}}|{{subClassNm}}"
    {{#checkState}}checked{{/checkState}}
    category="{{bigClassDetl}}>{{midClassDetl}}>{{subClassDetl}}"/>
    <p>{{subClassDetl}}</p>
</div>
{{/list}}
</script>
<script id="template-result" type="x-tmpl-mustache">
{{#list}}
    <p>{{category}}</>
{{/list}}
{{^list}}
    <p>선택결과가 없습니다.</p>
{{/list}}
<button type="button" class="reset_btn">초기화</button>
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.2.0/mustache.min.js"></script>
<script type="text/javascript">

    var checkStates = [];
    var templateBig = document.getElementById('template-big').innerHTML;
    var templateMid = document.getElementById('template-mid').innerHTML;
    var templateSub = document.getElementById('template-sub').innerHTML;
    var templateRet = document.getElementById('template-result').innerHTML;

    function loadDataBigCode(classType){
        $.ajax({
            url:'/common/popup/data/big.do',
            data: {classType},
            method: 'GET',
            contentType: 'application/json',
            success:function (data){
                var rendered = Mustache.render(templateBig, {list:data});
                $('#bigDepth').html(rendered);
                $('#bigDepth li').first().click();
            },
        })
    }

    function loadDataMidCode(bigCode){
        $.ajax({
            url:'/common/popup/data/mid.do',
            data: {bigCode},
            method: 'GET',
            contentType: 'application/json',
            success:function (data){
                var rendered = Mustache.render(templateMid, {list:data});
                $('#midDepth').html(rendered);
                $('#midDepth li').first().click();
            },
        })
    }
    function loadDataSubCode(midCode){
        $.ajax({
            url:'/common/popup/data/sub.do',
            data: {midCode},
            method: 'GET',
            contentType: 'application/json',
            success:function (data){
                var checkStateAdded = {list:applyCheckState(data)};
                var rendered = Mustache.render(templateSub, checkStateAdded);
                $('#subDepth').html(rendered);

            },
        })
    }
    function applyCheckState(data){
        return data.map(function(elm){
            var found = checkStates.find(function(item) {return item.subClassCd === elm.subClassCd})
            if(found){
                elm['checkState'] = true;
            }else{
                elm['checkState'] = false;
            }
            return elm;
        })
    }


    $(function(){
        // 초기화
        $('.pop-up').css('display', 'block');
        $('.select-job').css('display','block');

        loadDataBigCode('B');


        // event handler
        $("#bigDepth").on("click",'li',function(e){
            $(this).parent().children("li").removeClass("active");
            $(this).addClass("active");

            loadDataMidCode($(this).attr("cd"));
        })

        $("#midDepth").on("click",'li',function(e){
            $(this).parent().children("li").removeClass("active");
            $(this).addClass("active");

            loadDataSubCode($(this).attr("cd"));
        })

        // load 1 depth
        $("#subDepth").on('change', 'input', function(e){

            var subClassCd = $(this).val().split("|")[0];
            var subClassNm = $(this).val().split("|")[1];
            var category = $(this).attr("category");

            if($(this).is(':checked')){
                // add
                checkStates.push({subClassCd, subClassNm, category})
            } else {
                // remove
                var itemToFind = checkStates.find(function(item) {return item.subClassCd === subClassCd})
                var idx = checkStates.indexOf(itemToFind)
                if (idx > -1) checkStates.splice(idx, 1)
            }
            var rendered = Mustache.render(templateRet, {list:checkStates});
            $('.pop-up__result').html(rendered);

        })

        // 결과 돌려주기
        $("#btnConfirm").on("click", function(){

            // input[name=bttsCd] 의 value 에 코드 및 검색 키워드
            var code = checkStates.map(function(elm){
                return elm.subClassCd
            }).join("|")
            var name = checkStates.map(function(elm){
                return elm.subClassNm
            }).join("|")

            $("input[name='${paramVO.codeInput}']").val(code);
            $("input[name='${paramVO.nameInput}']").val(name);

            // 창닫기
            hidePopup('${paramVO.popupId}')

        })
    });

</script>