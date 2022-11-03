<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 - 게시판</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet"
	href="${path}/resources/css/customerCss/board.css">


<!-- 1. fontawsome.com에서 인증(start for free)
	 2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js"
	crossorigin="anonymous"></script>

<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script src="${path}/resources/js/customerJs/main.js" defer></script>

<style>
#contents a button {
	display: inline-block;
	margin-left: 40px;
	font-size: 13px;
	border-radius: 14px;
	background: transparent;
	color: black;
	border: 1px solid black;
}

#contents a button:hover {
	background-color: transparent;
}

.row>* {
	background: linen;
}

.container-fluid {
	background-color: transparent;
}
</style>
</head>
<body style="background: linen;">

	<div class="wrap">
		<!-- header 시작 -->
      <%@ include file="/common/header.jsp" %>
		<!-- header 끝 -->

		<div id="section">

		</div>
		<!-- 상품 목록 컨텐츠 시작 -->
		<div id="container">
			<h1 style="font-family:'Gowun_Batang', serif; align:center; margin-left:750px;">all item</h1>
			<br>
			<div id="contents">
				<a href="${path}/product_flower.st">
					<button type="button"class="btn btn-light"
						    	 style="margin-left: 650px; background: black; color: linen; margin-bottom:64px;">all</button></a>
				 <a href="${path}/product_flower.st">
					<button type="button" class="btn btn-light"style="margin-bottom: 64px;">꽃다발</button>
				</a> <a href="${path}/product_flower.st">
					<button type="button" class="btn btn-light" style="margin-bottom:64px;">꽃바구니</button></a> 
				<a href="${path}/product_flower.st">
					<button type="button"class="btn btn-light"style="margin-bottom:64px;">화분</button></a>
				<!-- 상단 중앙1 시작 -->


				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 우측 메뉴 시작 -->
					<div class="container-fluid">
					
						<div class="row">
						<c:forEach var="dto" items="${list}">
							<div class="col-md-4">
								<div class="card" style="width: 18rem;">
									<a onclick="window.location='${path}/product_Detail.st?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">
									<img src="${dto.pdImg}" width="300px"
										height="400px" class="card-img-top"></a>
									<div class="card-body">
										<h5 class="card-title"
											style="font-size: 14px; font-style: oblique">${dto.pdName}</h5>
										<p class="card-text" style="font-size: 12px;">${dto.content}</p>
									</div>
								</div>
							</div>
							</c:forEach>
							

							<tr>
								<td colspan="12" align="center">
									<!-- 페이징 처리 --> <!-- 이전 버튼 활성화 여부 --> <c:if
										test="${paging.startPage > 10 }">
										<a href="${path}/product_flower.st?pageNum=${paging.prev}">[이전]</a>
									</c:if> <!-- 페이지 번호 처리 --> <c:forEach var="num"
										begin="${paging.startPage}" end="${paging.endPage}">
										<a href="${path}/product_flower.st?pageNum=${num}">${num}</a>


									</c:forEach> <!-- 다음 버튼 활성화 여부 --> <c:if
										test="${paging.endPage < paging.pageCount}">
										<a href="${path}/product_flower.st?pageNum=${paging.next}">[다음]</a>
									</c:if>
								</td>
							</tr>
							</table>
							</form>
						</div>
					</div>
					<!-- 우측 메뉴 시작 -->

				</div>
				<!-- section2 -->
			</div>
			<!-- contents -->
		</div>
		<!-- container -->
		<!-- 상품 목록 컨텐츠 종료 -->


		<!-- footer 시작 -->
		      <%@ include file="/common/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
</body>
</html>