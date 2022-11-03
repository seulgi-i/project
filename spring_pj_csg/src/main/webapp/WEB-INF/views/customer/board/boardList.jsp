<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link rel="stylesheet" href="${path}/resources/css/customerCss/board.css">

<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script>
$(function(){
   $("#btnInsert").click(function(){
      location.href="${path}/board_insert.bo";
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
    padding-left: 33px;
    border-bottom: 1px solid lightgrey;
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
<body>
	 <!-- header 시작 -->
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->

		<div id="section">
				<h1 style="font-family:'Gowun_Batang',serif">Q&A</h1>
				<br>· 문의글을 남겨주시면 신속한 답변 드리겠습니다. <br>
		</div>
		<!-- 게시판 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section2">
						<!-- 우측 메뉴 시작 -->
						<div id="center">
						<form action="" method="post"> 
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="board_notice_wrap">
							<table class="board_notice" style="width:100%">
							
							
							
								<thead>
									<tr>
										<th>번호</th>
										<th><span>분류</span></th>
										<th>제목</th> 
										<th>작성일</th>
										<th>작성자</th>
									</tr>
									
								</thead>
								 <!-- 게시글이 있으면 -->
                     		   <c:forEach var="dto" items="${list}">
								<tbody>
									<tr>
                              <td align="center">${dto.num}</td>
                              <td align="center">${dto.writer}</td>
                              <td align="center">
                                    <a href="${path}/board_detailAction.bo?num=${dto.num}">${dto.title}</a>
                                    <!-- 댓글 갯수 -->
                                    <c:if test="${dto.comment_count > 0}">
                                       [ ${dto.comment_count} ]
                                    </c:if>
                              </td>
                              <td align="center">${dto.regDate}</td>
                              <td align="center">${dto.readCnt}</td>
                           </tr>
								</tbody>
								 </c:forEach>

							</table>
							<div class="paging" style="margin-left:-80px">
								<c:if test="${paging.startPage > 10 }">
                              		 <a href="${path}/boardList.bo?pageNum=${paging.prev}">[이전]</a>
                              	</c:if>
                              
								 <!-- 페이지 번호 처리 -->
                              <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                                  <a href="${path}/boardList.bo?pageNum=${num}">${num}</a> 
                                 
                              
                              </c:forEach>
                              <!-- 다음 버튼 활성화 여부 -->
                              <c:if test="${paging.endPage < paging.pageCount}">
                                 <a href="${path}/boardList.bo?pageNum=${paging.next}">[다음]</a>
                              </c:if>                              

							</div>

						</div>
						     <tr>
                              <td colspan="5" align="right">
                              <input type="button" class="inputButton" value="글쓰기" id="btnInsert">
                              </td>
                           </tr>
				<!-- 상단 중앙2 시작 -->
						<!-- 우측 메뉴 끝 -->
						</form>
					</div>
					<!-- section2 -->
				</div>

				<!-- contents -->

			</div>
		</div>
			<!-- container -->
			<!-- 상품 목록 컨텐츠 종료 -->


	 <!-- footer 시작 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->
</body>
</html>