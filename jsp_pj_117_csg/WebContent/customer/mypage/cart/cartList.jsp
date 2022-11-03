<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>

<title>ADMIN: 게시판</title>
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


<script type="text/javascript">
	
	$(document).ready(function() {
		setTotalInfo(".cart_info_td");
	
		$(function() {
						
			//변경 버튼 클릭시 수량 변경
			$(".updateButton").click(function(){
				 var cartNo = $(this).data("num");
				 //입력된 값을 이전 값에 저장함.
			     var cartCnt = $(this).prev().val();
			      location.href = "${path}/CartUpdateAction.cr?cartNo="+cartNo+"&cartCnt="+cartCnt;
			   });
			
			//선택삭제 버튼 클릭시 상품 삭제
			$("#selectDel").click(function(){
			  $(".cart_info_td").each(function(index, element) {
				 //현재 배열의 순서 중 요소를 찾는다. true된 현재 값을 모두 전송
			 	if($(element).find(".checkBox").is(":checked") === true) { 
					document.editForm.action = "${path}/CartDeleteAction.cr";
					document.editForm.submit();
				}
			 }); 
		  });
			
			//전체삭제 버튼 클릭시 장바구니 비우기 실행
		   $("#btnadel").click(function() {
			  document.editForm.action = "${path}/CartAllDeleteAction.cr";
			  document.editForm.submit();
			});
			
			//전체구매 버튼을 눌렀을 때 상품 전부 체크(true)상태로 변경
		   $("#btnbuy").click(function(){
			 $(".checkBox").prop("checked", true);  
			 	$(".cart_info_td").each(function(index, element) {
					//현재 배열의 순서 중 요소를 찾는다. true된 현재 값을 모두 전송
				  if($(element).find(".checkBox").is(":checked") === true) { 
					document.editForm.action = "${path}/OrderPageAction.or";
					document.editForm.submit();
					}
				 });
			   });
				
			//선택상품 주문 
		   $("#selectBuy").click(function(){
			$(".cart_info_td").each(function(index, element) {
				//현재 배열의 순서 중 요소를 찾는다. true된 현재 값을 모두 전송
			  if($(element).find(".checkBox").is(":checked") === true) { 
				document.editForm.action ="${path}/OrderPageAction.or";
				document.editForm.submit();
				}
			 });
		   });
	});
		
	//체크박스 설정 
	$(function() {
		$(".all_check_input").change(function() {
			var is_checked = $(".all_check_input").is(":checked"); //is : 체크 되어있으면 ture 안되면 false
			//전체 선택시 비체크 상품까지 일괄체크
			$(".checkBox").prop("checked", is_checked);
			setTotalInfo($(".cart_info_td"));
		});
	});
	
	
	/*장바구니 금액 구하기*/
	//체크박스 변화시 연산
	$(function() {
		$(".checkBox").change(function() {
			setTotalInfo($(".cart_info_td"));
			//금액함수가 실행되어 cart_info_td에 값을 띄움
		});
	});

		
		/* 금액 함수 */
		function setTotalInfo() {
			let totalPrice = 0;			// 총 가격
			let deliveryPrice = 0; 		// 배송비
			let finalTotalPrice = 0; 	// 최종 가격(총 가격 + 배송비) 
	
			//장바구니 목록에서 체크된 값에 한하여 총금액에 값을 더함.
			$(".cart_info_td").each(function(index, element) {
				if ($(element).find(".checkBox").is(":checked") === true) { 
					// 총 가격 ( 각 상품별 수량*금액의 합)
					totalPrice += parseInt($(element).find(".cart_sum").val());
				}
			});
	
			/* 배송비 결정 */
			if (totalPrice >= 150000) {
				deliveryPrice = 0;
			} else if (totalPrice == 0) {
				deliveryPrice = 0;
			} else {
				deliveryPrice = 15000;
			}
	
			/* 최종 가격 */
			finalTotalPrice = totalPrice + deliveryPrice;
	
			$(".totalPrice").val(totalPrice); //상품합계
			$(".deliveryPrice").val(deliveryPrice); //배송비
			$(".finalTotalPrice").val(finalTotalPrice); //총결제금액
		};
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
					<h1 style="font-family: 'Gowun_Batang', serif">Cart</h1>
				</div>
				<!-- 게시판 컨텐츠 시작 -->
				<form name="editForm" action="" method="post"
					enctype="multipart/form-data">

					<table class="table" style="width: 83%; margin-left: 150;">
						<thead>
							<tr>
								<th scope="col"><input type='checkbox' name="checked"
									class="all_check_input" checked="checked">
								<th scope="col">상품번호</th>

								<th scope="col">상품정보</th>

								<th scope="col">수량</th>

								<th scope="col">가격</th>

							</tr>
						</thead>
						<tbody>
							<c:set var="total[]" value="0" />
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr class="cart_info_td">
									<input type="hidden" name="hiddenId" value="0">
									<input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
									<input type="hidden" name="hiddenCartNo" value="${dto.cartNo}">
									<input type="hidden" name="hiddenPdName" value="${dto.pdName}">
									<input type="hidden" name="hiddenPrice" value="${dto.price}">
									<input type="hidden" name="hiddenPdImg" value="${dto.pdImg}">
									<input type="hidden" name="hiddenMoney" value="${dto.money}">

									<!-- 체크박스 선택값 => pdNo전달 -->
									<th scope="row"><input type="checkbox" name="selectCheck"
										class="checkBox" checked="checked" data-num="${dto.pdNo}"
										value="${dto.pdNo}"></th>
									
									<!-- 상품번호  -->	
									<td>${dto.pdNo}</td>
									
									<!-- 상품이미지와 이름 -->
									<td><img src="${dto.pdImg}" width=90px height=90px>&nbsp;${dto.pdName}</td>
										
										<!-- 장바구니 수량, 변경버튼 -->
									<td><input type="number" name="cartCnt" class="cartCnt"
												value="${dto.cartCnt}" min="1" max="99" style="width: 43px; text-align: center"> 
										<input type="button" class="updateButton" value="변경" data-num="${dto.cartNo}"
												style="border: 1px solid; background: transparent;"> 
										
										<!-- 수량*가격 = 장바구니 상품별 금액 -->
										<input type="hidden" class="cart_sum" value="${dto.money}"></td>

										<td><input type="hidden" id="price" value="${dto.price}">
										
										<!-- 수량*가격 = 장바구니 상품별 금액 1000단위 콤마 표시 -->
										<fmt:formatNumber pattern="###,###,###" value="${dto.money}" />
										원
									</td>

								</tr>
								<c:set var="total" value="${total + dto.money}" />
							</c:forEach>

							<tr>

								<td colspan='8' align='center'><br> · 15만원 이상 구매시 무료배송
									<br> <!-- 장바구니 결제 정보 -->
									<h5>결제 정보</h5>
									<div class="orderInfo-price">
										<p>
											상품금액 <input type="text" style="border: 0 solid black;"
												id="totalPrice" class="totalPrice" name="totalPrice"
												value="0">
										</p>
										<p>
											배송비 <input type="text" style="border: 0 solid black;"
												id="deliveryPrice" class="deliveryPrice"
												name="deliveryPrice" value="0">
										</p>
										<p>
											결제예정금액 <input type="text" style="border: 0 solid black;"
												id="totalPrice" class="finalTotalPrice"
												name="finalTotalPrice" value="0">
										</p>
										<button type="button" id="btnList"
											onclick="window.location='${path}/product_flower.st'">상품목록</button>
										<button type="button" id="btnbuy">전체구매</button>
										<button type="button" id="selectBuy">선택구매</button>
										<button type="button" id="selectDel">선택삭제</button>
										<button type="button" id="btnadel">전체삭제</button>
									</div></td>
							</tr>


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