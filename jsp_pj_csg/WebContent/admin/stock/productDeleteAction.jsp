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
<script>
$(function(){
$("#btnDelete").click(function(){
    	if(confirm("삭제하시겠습니까?")){
    	       document.editForm.action="${path}/board_deleteAction.bo";
    	       document.editForm.submit();
    	}
    });
</script>    
<!-- update 성공 -->
	<c:if test="${deleteCnt ==  1}">
		<script type="text/javascript">
			alert("상품이 정상적으로 삭제됐습니당")
			window.location="${path}/productList.st"
		</script>
	</c:if>
<!-- update 실패 -->
	<c:if test="${deleteCnt ==  0}">
		<script type="text/javascript">
			alert("상품삭제 실패!")
		</script>
	</c:if>
</body>
</html>