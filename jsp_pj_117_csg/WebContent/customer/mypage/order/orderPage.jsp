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

	/* 총 주문 정보 세팅 */
	function setTotalInfo() {
		/* 종합 정보 섹션 정보 삽입 */
		let totalPrice = 0; // 총 가격
		let deliveryPrice = 0; // 배송비
		let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비) 

		//장바구니 상품들 중 각각 합계의 값을 찾아 totalPrice에 더해준다.
		$(".cart_info_td").each(function(index, element) {
				// 총 가격
				totalPrice += parseInt($(element).find(".cart_sum").val());

			
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
<title> orderpage </title>

</head>

<body>

	<div class="wrap">
		<%@ include file="/common/header.jsp"%>
		<!-- header 끝 -->
		
		<div id="container">
			<div id="contents">
			
				<div id="section1">
					<h1 style="font-family: 'Gowun_Batang', serif">order page</h1>
				</div>
				
				
				
				<!-- 주문서 시작 -->
				<form name="buyForm" action="OrderAddAction.or" method="post">

					<table class="table" style="width: 83%; margin-left: 150;">
						<thead>
							<tr>
								<th scope="col">상품번호</th>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">가격</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}" >
								<tr class="cart_info_td">
									<input type="hidden" name="pdNo" value="${dto.pdNo}">
									<input type="hidden" name="cartNo" value="${dto.cartNo}">
									<input type="hidden" name="cartCnt" value="${dto.cartCnt}">
									
									<td>${dto.pdNo}</td>
									<td><img src="${dto.pdImg}" width=90px height=90px>&nbsp;${dto.pdName}</td>
									<td><input type="text" name="cartCnt"  min="1" max="99" style="width: 43px; text-align: center" value="${dto.cartCnt}" > 
											<input type="hidden" class="cart_sum" id="chk_sum" name='sum' value="${dto.money}"readonly>
									</td>
									<td><input type="hidden" id="price" value="${dto.price}">
										<fmt:formatNumber pattern="###,###,###" value="${dto.money}" />원
									</td>

								</tr>
						</c:forEach>

					<!-- 장바구니 정보 끝 -->
					
					<!-- 결제 정보 확인 -->
							<tr>
								<td colspan='8' align='center'><br> · 15만원 이상 구매시 무료배송
									<br> 
									<h5>결제 정보</h5>
									<div class="orderInfo-price">
										<p>
											상품금액 <input type="text" style="border: 0 solid black;" id="totalPrice" class="totalPrice" 
																		name="totalPrice" value="0"	readonly>
										</p>
										<p>
											배송비 <input type="text" style="border: 0 solid black;" id="deliveryPrice" class="deliveryPrice"
																	    name="deliveryPrice" value="0"	readonly>
										</p>
										<p>
											결제예정금액 
											<input type="text" style="border: 0 solid black;" id="totalPrice" class="finalTotalPrice"
																		name="finalTotalPrice" value="0"	readonly>
										</p>
											    <button type="submit" id="buy" style="aling:center;">구매하기</button>
												<button type="button" onclick="window.location='${path}/cartList.cr'"style="aling:center;">구매취소</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 결제 정보 끝  -->
					
					
					<!-- 고객 정보&수령인 변경 -->
					<table  style="margin-left: 480px;">
						<tr>
						<th> customer info </th>
						<tr>
                              <th>* 이름</th>
                              <td colspan="2">																															<!--값 고정[0] -->
                                 <input type="text" class="input" id="name" name="name" size="20" value="${list[0].name}">
                              </td>
                           </tr>
                        <tr>	
                              <th>* 핸드폰</th>
                              <td colspan="2">
                             	 <input type="text" class="input" name="hp"  style="width: 100%" value="${list[0].hp}">
                              </td>
                           </tr>   
                       <tr>
                              <th>* 주소</th>
                              <td colspan="2">
                                 <input type="text" class="input" name="address" size="60" value="${list[0].address}">
                              </td>
                           </tr>    
					</table>
					
					
					<table  style="margin-left: 480px;">
					<tr >
					<th colspan="10"> receiver info : 받으시는분 정보가 다를 때 입력해주세요~</th>
					</tr>
						<tr>
                              <th>* 수령인</th>
                              <td colspan="2">
                                 <input type="text" class="input" id="orderName" name="orderName" size="20" >
                                 
                              </td>
                           </tr>
                        <tr>
                              <th>* 수령인 핸드폰</th>
                              <td colspan="2">
			                     <input type="text" class="input" name="hp1" maxlength="3" style="width: 50px"> - 
			                     <input type="text" class="input" name="hp2" maxlength="4" style="width: 50px"> -
			                     <input type="text" class="input" name="hp3" maxlength="4" style="width: 50px">
			                    
                              </td>
                           </tr>   
                       <tr>
                              <th>* 수령인 주소</th>
                              <td colspan="2">
                                 <input type="text" class="input" name="orderaddress" size="60">
                              </td>
                           </tr>    

                       </table>

				</form>
			</div>
		</div>
	</div>


	<!-- footer 시작 -->
	<%@ include file="/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>