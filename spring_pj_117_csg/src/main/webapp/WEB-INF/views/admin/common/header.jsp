<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	

<script src="https://kit.fontawesome.com/bb9e081823.js"
	crossorigin="anonymous"></script>
	
<script src="${path}/resources/js/cusomerJs/main.js" defer></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
<title></title>
</head>
<body>
<!-- 네비바 -->
	<nav class="navbar navbar-light bg-light fixed-top" style="width: 100%">
		<div class="container-fluid">
			<i class="fa-brands fa-pagelines"><a class="navbar-brand"
				href="${path}/productAdd.do" style="font-size: 13px">&nbsp;Flower;</a></i>

			<ul class="navbar_menu">
				<li><a href="${path}/main.do">main</a></li>
				<li><a href="${path}/shopAll_flower.do">flower</a></li>
				<li><a href="${path}/boardNotice.do">Notice</a></li>
			</ul>
			<ul class="navbar_icons" style="font-size: 13px">
			
				<li><a href="${path}/login.do">LOGIN</a></li>
				<li><a href="${path}/join.do">JOIN</a></li>
				<li><a href="${path}/cartList.do"><i
						class="fa fa-cart-plus"></i></a></li>
				<li><a href="${path}/userinfo.do"><i class="fa fa-user"></i></a></li>

			</ul>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<!-- 오프캔버스 -->

		<div class="offcanvas offcanvas-end" tabindex="-1"
			id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
			style="width: 600px;">

			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">flower</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>

			<form class="d-flex" style="width: 500px;">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>

			</form>

			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3"
					style="font-size: 13px">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${path}/main.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/customer/product/shopAll_flower.jsp">all items</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/customer/board/review.jsp">Review</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/customer/board/boardNotice.jsp">notice</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/customer/board/boardQnA.jsp">QnA</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="offcanvasNavbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> category </a>


						<ul class="dropdown-menu" style="font-size: 12px"
							aria-labelledby="offcanvasNavbarDropdown">
							<li><a class="dropdown-item" href="${path}/customer/product/shopAll_barsket.jsp">꽃다발</a></li>
							<li><a class="dropdown-item" href="${path}/customer/product/shopAll_flower.jsp">꽃바구니</a></li>
							<li><a class="dropdown-item" href="${path}/customer/product/shopAll_pot.jsp">화분</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">best 10</a></li>
						</ul></li>

				</ul>


			</div>

			<!-- 오프캔버스 하단 -->
			<div class="body_full">
				<dl class="line">
					<dt>customer service</dt>

					<dd class="txt_box">
						<div class="num1">1600-1234</div>
						<div class="txt1">
							am 10:00 - pm 5:00 mon-fri<br>lunch pm 1:00 - 2:00
						</div>
					</dd>

					<dd class="btn_box">
						<a href="#" target="_blank" class="btn1">kakaotalk</a>
						<a href="#" target="_blank" class="btn2">navertalk</a>
					</dd>

				</dl>
				<dl>
					<dt>bank account</dt>
					<dd class="txt4">
						<span class="txt2">카카오뱅크</span><span class="num2">3333-04-8664984</span>
						<br> 
						<span class="txt2">국민</span><span class="num2">039001-04-245314</span>
					</dd>
					<dd class="txt3">(주)flower</dd>
				</dl>
			</div>
		</div>
	</nav>
	
	
	
	
	
	
	
<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>