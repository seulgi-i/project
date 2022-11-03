<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용  -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>productlist</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->
<script>
$(function(){
$("#btnDelete").click(function(){
    	if(confirm("삭제하시겠습니까?")){
    	       document.ListForm.action="${path}/productDeleteAction.st?pdNo=";
    	       document.ListForm.submit();
    	}
        
    });
});    
</script>  
<style>
@charset "UTF-8";

#container {
   width: 100%;
   margin: 0 auto;
	margin-left: -88px;
}

#contents {
   max-width: 1240px;
   min-width: 1240px;
   width: 100%;
   margin: -28px auto;
   min-height: 800px;
}

#section2 {
    display: flex;
    color: black;
    justify-content: flex-start;
    flex-direction: row;
    align-items: baseline;
}
#section1 {
    font-size: 13px;
    text-align: center;
    margin: 0;
    margin-left: 83px;
    padding: 166px 0px 0px 0px;
}

/* 우측 내용 시작 */ 
right {
    text-align: center;
    padding: 100px 0 0 0px;
 }

.table_div {
   margin-top: 50px;
}

.table_div table {
   border-collapse: collapse;
}

.table_div table th, td {
    height: 50px;
    padding-left: 24px;
}
  
.table_div table th {
}

.inputButton {
   background-color: dark-yellow;
   font-size: 16px;
   padding: 10px 15px 10px 15px;
}

input {
   padding: 2px 2px;
}

.inputButton {
    font-size: 11px;
    padding: 3px 12px 5px 14px;
    line-height: 21px;
}
.input {
    width: 675px;
    height: 40px;
    border: 1px solid gray;
    box-sizing: border-box;
    padding: 6px 0px 0 10px;
    background: none;
}
tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
    font-size: 12px;
    text-align: center;
}
textarea {
    resize: vertical;
    background: linen;
 }
</style> 
</head>
<body style="background:linen;">

	<div class="wrap">
		<!-- header 시작 -->
		      <%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->

		
		<!-- 상품 목록 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center"> 상품 목록 </h1>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->
					<div id="left">
						<div class="left_inside">
							<!-- 좌측 메뉴바 시작-->
							<%@ include file ="/WEB-INF/views/admin/common/leftMenu.jsp" %>
							<!-- 좌측 메뉴바 종료 -->
						</div>
					</div>
					<!-- 좌측 메뉴 종료 -->
					
					<!-- 우측 메뉴 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="ListForm" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<table style="width:1000px; align:center;">
							<tr>
								<th style="width: 5%">번호</th>					
								<th style="width: 8%">브랜드</th>					
								<th style="width: 12%">상품명</th>					
								<th style="width: 10%">상품이미지</th>					
								<th style="width: 10%">카테고리</th>					
								<th style="width: 10%">제품설명</th>					
								<th style="width: 8%">가격</th>					
								<th style="width: 8%">등록수량</th>					
								<th style="width: 7%">상태</th>					
								<th style="width: 10%">등록일</th>					
								<th style="width: 6%">수정</th>					
								<th style="width: 6%">삭제</th>					
							</tr>
							
							<!-- 게시글이 있으면 -->
                       	 <c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.pdNo}</td>					
								<td>${dto.brand}</td>					
								<td>${dto.pdName}</td>					
								<td><img src="${dto.pdImg}" width="100"></td>					
								<td>${dto.category}</td>					
								<td>${dto.content}</td>					
								<td>${dto.price}</td>					
								<td>${dto.quantity}</td>					
								<td>${dto.status}</td>					
								<td>${dto.indate}</td>					
								<td>
								<input  type="button" value="수정"onclick="window.location='${path}/productDetailAction.st?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'"></td>	 
								<td>
								<input type="button" value="삭제"onclick="window.location='${path}/productDeleteAction.st?pdNo=${dto.pdNo}'">
								
								</td>	
												
							</tr>
							</c:forEach>
							
						<tr>
                           <td colspan="12" align="center">
                              <!-- 페이징 처리 -->
                              <!-- 이전 버튼 활성화 여부 -->
                              <c:if test="${paging.startPage > 10 }">
                               <a href="${path}/productList.st?pageNum=${paging.prev}">[이전]</a>
                              </c:if>
                              
                              <!-- 페이지 번호 처리 -->
                              <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                                  <a href="${path}/productList.st?pageNum=${num}">${num}</a> 
                                 
                              
                              </c:forEach>
                              <!-- 다음 버튼 활성화 여부 -->
                              <c:if test="${paging.endPage < paging.pageCount}">
                                 <a href="${path}/productList.st?pageNum=${paging.next}">[다음]</a>
                              </c:if>     
                             </td>                         
                          </tr> 
						</table>
						</form>
						</div>
					</div>
					<!-- 우측 메뉴 시작 -->
					
				</div><!-- section2 -->
			</div><!-- contents -->
		</div><!-- container -->
		<!-- 상품 목록 컨텐츠 종료 -->


		<!-- footer 시작 -->
    	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
</body>
</html>