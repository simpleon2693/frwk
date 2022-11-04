var curPageRaw = "1";
	
function getCurrentPage(){
	return curPageRaw;	
}

/************************************************************************
함수명 : showPaging                          
설   명 : 한칸씩 이동하는 페이징 함수
인   자 : 
사용법 : 데이터 뿌려주는 본 페이지 함수에 끼워서 사용
작성일 : 2022.04.28
작성자 : 김영지                   
************************************************************************/	

function showPaging(totalPage, showPageCnt, curPage, searchFunctionName, parentContainerSelect) {
	curPageRaw = curPage;
	
	var pagingWriting = "";
	var target = 1;		
	var pageBlock = Math.ceil(totalPage / showPageCnt);
	var curBlock = Math.ceil(curPage / showPageCnt);
	
	var targetPage ;
	
	if (curPage > 1) {
		pagingWriting += '<button type="button" class="pagenation__num forward" onclick="javascript:' + searchFunctionName + '(\'' + (1) + '\')"></button>'
		pagingWriting += '<button type="button" class="pagenation__num pre" onclick="javascript:' + searchFunctionName + '(\'' + (curPage-1) + '\')"></button>'
	} 
	
	if(totalPage == 0) {
		pagingWriting += '<button type="button" class="pagenation__num">1</button>';
	}
	
	for (i = 0; i < totalPage; i++) {
		var no = i + 1;
		if (((curBlock - 1) * showPageCnt < no) && (no <= curBlock * showPageCnt)) {
			if (curPage == no) {
				target = no;	// 현재페이지를 target에 대입 
				pagingWriting += '<button type="button" class="pagenation__num active" onclick="javascript:' + searchFunctionName + '(\'' + no + '\')">' + no + '</button>';
			} else {
				pagingWriting += '<button type="button" class="pagenation__num" onclick="javascript:' + searchFunctionName + '(\'' + no + '\')">' + no + '</button>';
			}
		}
	}
	// 다음 타겟페이지는 현재 페이지에서 +1
	targetPage = target+1;
	
	// 현재페이지와 전체페이지수가 일치하지 않을때 이동가능 
	if (target != totalPage && totalPage > 1) {
		pagingWriting += '<button type="button" class="pagenation__num next" onclick="javascript:' + searchFunctionName + '(\'' + targetPage + '\')"></button>'
		pagingWriting += '<button type="button" class="pagenation__num backward" onclick="javascript:' + searchFunctionName + '(\'' + totalPage + '\')"></button>'
	} 
	
	if(parentContainerSelect != null && parentContainerSelect != undefined) {
		$(parentContainerSelect).find(".pagenation").html("");
		$(parentContainerSelect).find(".pagenation").html(pagingWriting);
	} else {
		$(".pagenation").html("");
		$(".pagenation").html(pagingWriting);
	}
}