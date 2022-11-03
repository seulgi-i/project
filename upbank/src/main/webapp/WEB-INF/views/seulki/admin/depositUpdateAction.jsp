<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 처리 페이지</title>
</head>
<body>
<!-- update 성공 -->
	<c:if test="${updateCnt ==  1}">
		<script type="text/javascript">
			alert("상품이 정상적으로 수정되었습니다")
			window.location="${path}/depositEdit.do"
		</script>
	</c:if>
<!-- update 실패 -->
	<c:if test="${updateCnt ==  0}">
		<script type="text/javascript">
			alert("상품수정 실패!")
		</script>
	</c:if>
</body>
</html>