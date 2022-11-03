<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	margin-top: 54px;
    margin-bottom: 41px;
    margin-left: 50%;
    font-size:19px;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		 setTotalInfo();
	 //주문요청 일괄승인
	 $("#BuyConfirm").click(function(){
	    document.ConfirmForm.action="${path}/ConfirmOrderAction.or";
	   	document.ConfirmForm.submit();
	});	
	 $("#RefundConfrim").click(function(){
		document.ConfirmForm.action="${path}/ConfirmRefundAction.or";
		document.ConfirmForm.submit();
	});	
});
	//매출 금액, 수량 구하기
	function setTotalInfo() {
		let totalPrice = 0;			// 총 가격
		let totalCnt = 0; 			// 총 수량
		
		$(".sold_info").each(function(index, element) {
				// 총 가격 (각 상품별 수량*금액의 합)
				totalPrice += parseInt($(element).find(".totalMoney").val());
				totalCnt += parseInt($(element).find(".totalCnt").val());
			});
		$(".totalPrice").val(totalPrice); //상품합계
		$(".totalCnt").val(totalCnt); //상품수량
	};
	
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
					<h1 style="font-family: 'Gowun_Batang', serif">상품별 매출액</h1>
				</div>
				<!-- 게시판 컨텐츠 시작 -->
				<form name="ConfirmForm" action="" method="post">
					<div id="box">
					<tr style="text-align-last: center";>
							<td scope="col">총 판매금액<input type="text" style="border: 0 solid black;"
												id="totalPrice" class=totalPrice name="totalPrice"
												value="0"></td>
							<td scope="col">총 판매수량<input type="text" style="border: 0 solid black;"
												id="totalCnt" class="totalCnt" name="totalCnt"
												value="0"></td>
							</tr>
					</div>	
					
					<table class="table" style="width: 83%; margin-left: 150;">
						<thead>
							<tr>
								<th scope="col">상품번호</th>
								<th scope="col">상품정보</th>
								<th scope="col">판매수량</th>
								<th scope="col">매출액</th>
								
							</tr>
						</thead>
						<tbody>
  							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr class="sold_info">
									<td>${dto.pdNo}</td>
									<td><img src="${dto.pdImg}" width=90px height=90px>${dto.pdName}</td>
									<td><input type="hidden" class="totalCnt" value="${dto.totalCnt}"><fmt:formatNumber  value="${dto.totalCnt}" groupingUsed="true"/>개</td>
									<td><input type="hidden" class="totalMoney"value="${dto.totalMoney}"><fmt:formatNumber value="${dto.totalMoney}" pattern="\#,###.##"/>원</td>
										
							</c:forEach>
									
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