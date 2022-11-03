<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중복확인 페이지</title>
<%-- <script src="${path}/resources/js/customerJS/errorMsg.js"></script> --%>

</head>
<body>

 	<!-- insert 실패 -->   
	<c:if test="${insertCnt==0}">
		<script type="text/javascript">
		   	alert("회원가입 실패");
		   	window.location="${path}/main.do";
		</script> 
	</c:if>

	<!-- insert 성공 -->	
	<c:if test="${insertCnt==1}">
		<script type="text/javascript">
		   	alert("인증메일 전송완료! 메일함을 확인해주세요");
		   	window.location="${path}/login.do";
		</script> 
	</c:if>

</body>
</html>
