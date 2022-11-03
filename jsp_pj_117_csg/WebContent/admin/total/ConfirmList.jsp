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

<title>orderList</title>
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
input#Btn {
    background: transparent;
    border: 1px solid black;
    border-radius: 10px;
    width: 95px;
    text-align: center;
}
#box {
	margin-top: 55px;
    margin-bottom: 42px;
    margin-left: 75%;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
	 //주문요청 일괄승인
	 $("#BuyConfirm").click(function(){
	    document.ConfirmForm.action="${path}/ConfirmOrderAction.or";
	   	document.ConfirmForm.submit();
	});
	 //환불요청 일괄승인
	 $("#RefundConfrim").click(function(){
		document.ConfirmForm.action="${path}/ConfirmRefundAction.or";
		document.ConfirmForm.submit();
	});	
});
</script>

</head>

<body>

	<div class="wrap">
		<%@ include file="/common/header.jsp"%>
		<!-- header 끝 -->
		<div id="container">
			<div id="contents">
				<!-- 컨텐츠 시작 -->
				<div id="section1">
					<h1 style="font-family: 'Gowun_Batang', serif">ConfirmList</h1>
				</div>
				<!-- 게시판 컨텐츠 시작 -->
				<form name="ConfirmForm" action="" method="post">
					<div id="box">
							<button type="button" id="BuyConfirm">구매승인</button>
							<button type="button" id="RefundConfrim">환불승인</button>
					</div>	
					<table class="table" style="width: 83%; margin-left: 150;">
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">날짜</th>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">가격</th>
								<th scope="col">요청상태</th>
								<th scope="col">고객ID</th>
								
							</tr>
						</thead>
						<tbody>
							<c:set var="total[]" value="0" />

							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td>${dto.orderNo}</td>
									<td>${dto.orderdate}</td>
									<td><img src="${dto.pdImg}" width=90px height=90px>${dto.pdName}</td>
									<td>${dto.orderCnt}</td>
									<td><input type="hidden" id="price" value="${dto.price}">
									<fmt:formatNumber pattern="###,###,###" value="${dto.money}" />
								원</td>
									<td>${dto.state}</td>
									<td>${dto.id}</td>
								</tr>
							</c:forEach>
							<c:set var="total" value="${total + dto.money}" />
						</tbody>

					</table>
				</form>
			</div>

			<!-- container -->
		</div>
	</div>

	<!-- 상품 목록 컨텐츠 종료 -->


	<!-- 푸터 -->
	<%@ include file="/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>