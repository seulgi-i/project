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
<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">
<%-- <script src="${path}/resources/js/customerJS/errorMsg.js"></script> --%>

</head>
<body>
   <c:if test="${insertCnt == 0}">
      <script type="text/javascript">
         alert("이메일 인증 실패!!");
      </script>
   </c:if>
   
   <c:if test="${insertCnt != 0}">
      <script type="text/javascript">
         alert("이메일 인증 성공!!");
         window.location="login.do";
      </script>
   </c:if>
</body>
</html>
