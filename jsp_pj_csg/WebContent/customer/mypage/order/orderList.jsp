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
		$(function() {
			//체크박스 - 전체선택, 전체해제
			$(".all_check_input").change(function() {
				var is_checked = $(".all_check_input").is(":checked"); //is : 체크 되어있으면 ture 안되면 false
				$(".checkBox").prop("checked", is_checked);
			});
		});
		
		//선택상품 주문취소 요청
		 $("#selectCancle").click(function(){
			 $(".order_info_td").each(function(index, element){
				if($(element).find(".checkBox").is(":checked") === true) {
					document.buyForm.action = "${path}/CancleOrderAction.or";
					document.buyForm.submit();
				}
		 	 });
		  });
		
		//선택상품 환불요청
		 $("#selectRefund").click(function(){
			 $(".order_info_td").each(function(index, element){
				if($(element).find(".checkBox").is(":checked") === true) {
					document.buyForm.action = "${path}/RefundOrderAction.or";
					document.buyForm.submit();
				}
			 });
		 });
		//선택상품  구매확정
		 $("#selectBuy").click(function(){
			 $(".order_info_td").each(function(index, element){
				if($(element).find(".checkBox").is(":checked") === true) {
					document.buyForm.action = "${path}/BuyOrderAction.or";
					document.buyForm.submit();
				}
			 });
		 });		
	});
	
	//1건 주문취소
	function deleteBtn(orderNo){
		if(confirm("구매취소 하시겠습니까?")){
			location.href="${path}/CancleAction.or?orderNo="+orderNo;
		}
	}
	//1건 환불요청
	function refundBtn(orderNo){
		if(confirm("환불 요청 하시겠습니까?")){
			location.href="${path}/RefundAction.or?orderNo="+orderNo;
			alert("요청 되었습니다.");
		}
	}	
	//1건 구매확정
	function buyBtn(orderNo){
		if(confirm("구매확정 하시겠습니까?")){
			location.href="${path}/BuyAction.or?orderNo="+orderNo;
			alert("구매확정 되었습니다.");
		}
	}	
		
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
					<h1 style="font-family: 'Gowun_Batang', serif">order List</h1>
				</div>
				<!-- 게시판 컨텐츠 시작 -->
				<form name="buyForm" action="" method="post">
					<div id="box">
							<button type="button" id="selectCancle">선택 주문취소</button>
							<button type="button" id="selectRefund">선택 환불요청</button>
							<button type="button" id="selectBuy">선택 구매확정</button>
					</div>	
					<table class="table" style="width: 83%; margin-left: 150;">
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">주문날짜</th>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">가격</th>
								<th scope="col">주문현황</th>
								<th scope="col">취소/환불요청</th>
								<th><input type='checkbox' name="checked"
												class="all_check_input"></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="total[]" value="0" />

							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr class="order_info_td">
								
									<td>${dto.orderNo}</td>
									<td>${dto.orderdate}</td>

									<td><img src="${dto.pdImg}" width=90px height=90px>${dto.pdName}</td>

									<td>${dto.orderCnt}</td>
										

									<td><input type="hidden" id="price" value="${dto.price}">
									<fmt:formatNumber pattern="###,###,###" value="${dto.money}" />원</td>
										
									<td>${dto.state}</td>
									
									<!-- 취소/환불 버튼 -->
									<td><c:choose>										
										<c:when test="${dto.state == '주문요청'}">
											<input type="button" id="Btn" class="cancleBtn" value="구매취소" onclick="deleteBtn(${dto.orderNo});">
										</c:when>
										<c:when test="${dto.state == '주문승인'}">
											<input type="button" id="Btn" class="refundBtn" value="환불요청" onclick="refundBtn(${dto.orderNo});"><br><br>
											<input type="button" id="Btn" class="buyBtn" value="구매확정" onclick="buyBtn(${dto.orderNo});">
										</c:when>
										<c:when test="${dto.state == '환불요청'}">
											<input type="text" id="Btn"  value="환불대기" >
										</c:when>		
										<c:when test="${dto.state == '환불승인'}">
											<input type="text" id="Btn"  value="환불완료" >
										</c:when>		
																	
									</c:choose>
									</td>
									<th scope="row">
									<input type='checkbox' name="orderSelectNo"class="checkBox" data-num="${dto.orderNo}" value="${dto.orderNo}">
									</th>
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