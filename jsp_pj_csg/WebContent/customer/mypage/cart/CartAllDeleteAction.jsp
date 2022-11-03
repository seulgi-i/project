<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--  장바구니 비우기  -->
	<c:if test="${AdeleteCnt ==  0}">
		<script type="text/javascript">
			alert("장바구니 비우기 실패!");
			window.location="${path}/cartList.cr"
		</script>
	</c:if>
	
	<c:if test="${AdeleteCnt != 0}">
		<script type="text/javascript">
			alert("장바구니를 비웠습니다~");
			window.location="${path}/cartList.cr"
		</script>
	</c:if>
<body>

</body>
</html>