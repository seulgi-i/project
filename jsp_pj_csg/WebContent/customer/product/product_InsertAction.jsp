<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 처리 페이지</title>
</head>
<body>
<!-- update 성공 -->
	<c:if test="${insertCnt ==  1}">
		<script type="text/javascript">
			alert("상품이 정상적으로 수정되었습니당~")
			window.location="${path}/product_flower.st?pageNum=${pageNum}"
		</script>
	</c:if>
<!-- update 실패 -->
	<c:if test="${insertCnt ==  0}">
		<script type="text/javascript">
			alert("상품수정 실패!")
		</script>
	</c:if>
</body>
</html>