									<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
$('#loginalert').click(function(){
		alert("로그인 하세요.");
	});	
$('#loginalert2').click(function(){
	alert("로그인 하세요.");
});	
});	

</script>
<body>
<!-- 네비바 -->
<nav class="navbar navbar-light bg-light fixed-top" style="width: 100%">
		<div class="container-fluid">
			<i class="fa-brands fa-pagelines"><a class="navbar-brand"
				href="${path}/productAdd.do" style="font-size: 13px">&nbsp;Flower;</a></i>

			<ul class="navbar_menu">
				<li><a href="${path}/main.do">main</a></li>
				<li><a href="${path}/product_flower.st">flower</a></li>
				<li><a href="${path}/Customerboard.bo">Notice</a></li>
			</ul>
			<ul class="navbar_icons" style="font-size: 13px">
			 <!--  로그인 안 한 경우-->
				<c:if test="${sessionScope.customerID == null }">
				<li><a href="${path}/login.do">LOGIN</a></li>
				<li><a href="${path}/join.do">JOIN</a></li>
				<li><a href=""id="loginalert"><i class="fa fa-cart-plus"></i></a></li>
				<li><a href=""id="loginalert2"><i class="fa fa-user"></i></a></li>
				</c:if>
				<!--  로그인 한 경우-->
		      <c:if test="${sessionScope.customerID != null }">
		      <li><span style="color:pink">${sessionScope.customerID}</span>님 환영합니다.</li>
				<li><a href="${path}/logout.do">LOGOUT</a></li>
				<li><a href="${path}/cartList.cr"><i class="fa fa-cart-plus"></i></a></li>
				<li><a href="${path}/Mypage.do"><i class="fa fa-user"></i></a></li>
				</c:if>
			</ul>
		</div>
	</nav>
</body>
</html>