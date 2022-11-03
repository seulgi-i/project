<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/admin.css">
<title>관리자 - 왼쪽메뉴</title>
<style>
@charset "UTF-8";

ol ol, ol ul, ul ol, ul ul {
	margin-bottom: 0;
	margin-right: 41px;
}

.menubarLeft {
	margin-left: -25px;
}

.menubarLeft li {
	list-style: none;
	align: center;
}

.menubarLeft .nb:hover {
	text-decoration: underline;
}

.menubarLeft h3, h4 {
	font-size: 19px;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	margin-top: 0;
	margin-bottom: 0.5rem;
	font-weight: 500;
	line-height: 2.2;
}
</style>
</head>
<body>
	<!-- 좌측 메뉴바 시작-->
	<ul class="menubarLeft">
		<li><h3>admin</h3></li>
		<li>
			<h4>product</h4>
			<ul class="product_menu">
				<li><a href="productList.st">상품목록</a></li>
				<li><a href="productAdd.st">상품등록</a></li>
			</ul>
		</li>

		<li>
			<h4>order</h4>
			<ul class="product_menu">
				<li><a href="ConfirmList.or">승인요청목록</a></li>
			</ul>
		</li>
		
		<!-- 주문 관리 -->
		<li><h4>
				<a href="customerInfo.st" style="margin-left: -9px; font-size: 15px">회원정보</a>
			</h4></li>
		<li><h4>
				<a href="boardList.bo" style="margin-left: -9px; font-size: 15px">게시판</a>
			</h4></li>
		<li><h4>
				<a href="AdminSoldView.or" style="margin-left: -9px; font-size: 15px">결산</a>
			</h4></li>
		<li><h4>
				<a href="logout.do" style="margin-left: -9px; font-size: 15px">로그아웃</a>
			</h4></li>
	</ul>
	<!-- 좌측 메뉴바 종료 -->
</body>
</html>