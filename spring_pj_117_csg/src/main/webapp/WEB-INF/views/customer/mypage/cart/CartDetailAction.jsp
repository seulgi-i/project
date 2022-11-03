<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>장바구니 - 상품 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet"
	href="${path}/resources/css/adminCss/productDetail.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js"
	crossorigin="anonymous"></script>
<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<script>

</script>


</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<!-- header 끝 -->


		<!-- 상품 목록 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 style="font-family: 'Gowun_Batang', serif" align=center>
						ProductPage</h1>
				</div>

				<!-- 상단 중앙2 시작 -->
				<div id="section2">


					<!-- 우측 메뉴 시작 -->
					<div id="right">
						<div class="table_div">
							<form method="post" name="editForm" action="${path}/CartUpdateAction.cr" enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<table style="width: 1000px; align: center; text-align: center;"
									border="1">
									<input type="hidden" name="hiddenId" value="0">
									<input type="hidden" name="pageNum" value="${pageNum}">
									<input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
									<input type="hidden" name="hiddenCartNo" value="${dto.cartNo}">
									<input type="hidden" name="hiddenPdName" value="${dto.pdName}">
									<input type="hidden" name="hiddenPrice" value="${dto.price}">
									<input type="hidden" name="hiddenPdImg" value="${dto.pdImg}">
									<!-- 기존 상품 이미지 -->
									<tr>
										<th>제품번호</th>
										<td>${dto.pdNo}</td>
										<th>제품명</th>
										<td>${dto.pdName}</td>
									</tr>
									<tr>
										<th>이미지</th>
										<td><img src="${dto.pdImg}" width="80"></td>
									</tr>

									<tr>
										<th>가격</th>
										<td>${dto.price}</td>
									</tr>

									<tr>
										<th>수량</th>
										<td><input type="number" class="input" id="pdCnt"name="pdCnt" value="${dto.pdCnt}" required></td>
									</tr>
			                        <tr>
			                           <th colspan="4" style="text-align: center">
			                           <input type="submit" class="inputButton" value="수정">
			                           <input type="reset" class="inputButton" value="취소" >
			                           <input type="button" class="inputButton" value="목록"onclick="window.location='${path}/cartList.cr'">
			                        </tr>   

								</table>
							</form>
						</div>
						<!-- table_div -->
					</div>
					<!-- right -->
					<!-- 우측 메뉴 시작 -->

				</div>
				<!-- section2 -->
			</div>
			<!-- contents -->
		</div>
		<!-- container -->
		<!-- 상품 목록 컨텐츠 종료 -->


		<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>