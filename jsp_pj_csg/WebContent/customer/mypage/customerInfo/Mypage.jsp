<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용  -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>

<title>Mypage</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet"
	href="${path}/resources/css/customerCss/board.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">

<style>
@charset "UTF-8";
.table_div table th, td {
    height: 50px;
    padding-left: 33px;
    border-bottom: 1px solid black;
}
.table_div table th {
    height: 50px;
    padding-left: 33px;
    border-bottom: 1px solid black;
    vertical-align: middle;
}

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

.product_menu li a {
	
}

#left {
	width: 20%;
	margin-top: -17px;
	height: 10%;
	border-radius: 10px;
	margin-right: 55px;
}

.left_inside {
	background: linen;
	margin: 57px 9px -91px 9px;
	border-radius: 10px;
	padding: 54px 9px 0px 6px;
	box-shadow: 5px 5px 5px 5px rgb(0 0 0/ 10%);
	text-align-last: center;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-weight: 500;
	line-height: 1.2;
	font-size: 16px;
}

.menubarLeft {
	margin-left: -25px;
}

.menubarLeft li {
	list-style: none;
	align: center;
}

.menubarLeft li a {
	font-size: 13px;
	color: black;
	text-decoration: none;
	margin-left: -40px;
}

.menubarLeft .nb:hover {t ext-decoration :underline;
	
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

div#right {
    width: 80%;
}
.table_div table th {
	background: linen;
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
    border-bottom: 1px solid black;
    vertical-align: middle;
}

.mypage_wrap .conts_wrap .conts .inquiry_box {
    width: 742px;
    padding: 20px 10px;
    background-color: #f7f7f7;
    color: #000;
    display: inline-block;
}
.mb20 {
    margin-bottom: 20px !important;
}.btn_style27.white {
    background-color: #fff;
    color: #888 !important;
    border: solid 1px #a8a8a8;
    font-size: 13px;
}.btn_style27.white.on {
    background-color: #444;
    color: #fff !important;
    border: solid 1px #444;
    font-size: 13px;
}.fl_l {
    float: left !important;
}.fl_r {
    float: right !important;
}.mb50 {
    margin-bottom: 50px !important;
}

}.btn_style27.gray {
    height: 27px;
    line-height: 27px;
    background-color: #e3e3e3;
    border: solid 0px #fff;
}
</style>
</head>

<body style="background: linen;">
	<div class="wrap">
		<%@ include file="/common/header.jsp"%>
		<!-- header 끝 -->
		<div id="container">
			<div id="contents">
			
			
	<div id="section1">
		<h1 style="font-family:'Gowun_Batang',serif; font-size: calc(1.375rem + 1.5vw);">My page</h1>
	</div>
	<!-- 상품 목록 컨텐츠 시작 -->
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<!-- 좌측 메뉴 시작 -->
				<div id="left">
					<div class="left_inside">
						<!-- 좌측 메뉴바 시작-->
						<ul class="menubarLeft">
							<li><h3>customer menu</h3></li>
							<li>
								<h5>주문/배송관리</h5>
								<ul class="product_menu">
									<li><a href="${path}/orderList.or">주문조회</a></li>
									<br>
								</ul>
							</li>

							<li>
								<h5>회원관리</h5>
								<ul class="product_menu">
									<li><a href="${path}/modifyCustomer.do">회원정보변경</a></li>
									<li><a href="${path}/deleteCustomer.do">회원탈퇴</a></li>
									<br>
								</ul>
							</li>
							<!-- 주문 관리 -->

						</ul>
						<!-- 좌측 메뉴바 종료 -->
					</div>
				</div>

				<!-- 우측 메뉴 시작 -->
				<div id="right">
					<div class="table_div">
						
								<i class="fa-solid fa-truck">&nbsp;주문 현황</i>
								<table class="table">
									<thead></thead>
									<tbody>
									<tr>
										<th colspan="6">주문현황</th>
									</tr>
									<tr>
										<td class="first">
											<div>입금대기</div>
											<div class="num">0</div>
										</td>
										<td>
											<div>주문완료</div>
											<div class="num">0</div>
										</td>
										<td>
											<div>배송준비중</div>
											<div class="num">0</div>
										</td>
										<td>
											<div>배송 중</div>
											<div class="num">0</div>
										</td>
										<td>
											<div>배송완료</div>
											<div class="num">0</div>
										</td>
										<td>
											<div>주문취소</div>
											<div class="num">0</div>
										</td>
								
									</tr>
								</tbody>
							</table>

								<i class="fa-solid fa-truck">&nbsp;주문 조회</i>
								<table class="table">
									<thead></thead>
									<tbody>
									<tr>
										<th scope="col" class="first">주문일자<br>(반품일자)</th>
											<th scope="col">상품정보</th>
											<th scope="col">결제금액<br>(반품금액)</th>
											<th scope="col">주문상태<br>(반품상태)</th>
											<th scope="col">확인/신청</th>
										<br><a style="font-size: 13px;">·  최근 1년에 대한 주문내역을 조회하실 수 있습니다.</a>
										<tr><td colspan="6">주문배송내역이 없습니다.</td></tr>
									</tr>
								<form id="frmSearch" name="frmSearch" method="post">
								<input type="hidden" name="srchPeriod_type" id="srchPeriod_type" value="1M">
								<input type="hidden" name="pageCount" id="pageCount" value="1">
								<input type="hidden" name="totalCount" id="totalCount" value="0">
								<input type="hidden" name="currentPage" id="currentPage" value="1">
							
								<div class="inquiry_box mb20">
									<div class="fl_l"><br>
										<span class="pr10"><strong>조회기간</strong></span>
										<a href="javascript:;" data-period="7D" class="term btn_style27 white " style="width:55px;"><strong>1주일</strong></a>
										<a href="javascript:;" data-period="1M" class="term btn_style27 white on" style="width:55px;"><strong>1개월</strong></a>
										<a href="javascript:;" data-period="3M" class="term btn_style27 white " style="width:55px;"><strong>3개월</strong></a>
										<a href="javascript:;" data-period="6M" class="term btn_style27 white " style="width:55px;"><strong>6개월</strong></a>
									</div>
								</div>
							</form>
							<div class="mb50">
								<table cellpadding="0" cellspacing="0" class="table_order_list1 type2" summary="주문일자, 상품정보, 결제금액, 주문상태, 확인/신청으로 구성 된 주문현황 표입니다.">
									<tbody>
										
										</tbody>
								</table>
							</div>
								</tbody>
							</table>
									
						
					</div>
				</div>
				<!-- 우측 메뉴 끝 -->

			</div>
			<!-- section2 -->
		</div>
		<!-- contents -->
		</div>
	</div>
	<!-- container -->


	<!-- footer 시작 -->
	<%@ include file="/common/footer.jsp"%>
	<!-- footer 끝 -->
	
</body>
</html>