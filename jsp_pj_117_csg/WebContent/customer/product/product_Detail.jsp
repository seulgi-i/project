<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 - 상품 상세페이지</title>
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
<body style="background: linen;">

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/common/header.jsp"%>
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
							<form method="post" name="cartadd" action="${path}/cartAddAction.cr" enctype="multipart/form-data">
								<table style="width: 1000px; align: center; text-align: center;"
									border="1">
									<input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
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
										<th>브랜드</th>
										<td>${dto.brand}</td>

										<th>이미지</th>
										<td><img src="${dto.pdImg}" width="80"></td>
									</tr>

									<tr>
										<th>제품설명</th>
										<td>${dto.content}</td>
										<th>가격</th>
										<td>${dto.price}</td>
									</tr>
									<tr>
										<th>판매 상태</th>
										<td>${dto.status}</td>
										<th>입고 날짜</th>
										<td colspan="3">${dto.indate}</td>
									</tr>
									<tr>
			                        <th>장바구니 수량</th>
			                        <td><input type="number" class="input" id="cartCnt"name="cartCnt" size="10" placeholder="수량 입력" required></td>
			                     </tr>
									<tr>
										<th colspan="4">
										 <input type="submit" class="inputButton"value="장바구니 담기"> 
										 <input type="button"class="inputButton" value="목록"onclick="window.location='${path}/product_flower.st'">
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
		<%@ include file="/common/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>