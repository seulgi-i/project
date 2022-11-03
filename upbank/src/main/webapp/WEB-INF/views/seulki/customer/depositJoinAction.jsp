<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>Page left sidebar - Invention | Creative Responsive Theme</title>
<meta name="description"
	content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Main Style -->

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">

</head>
<body>

	<div id="wrap" class="boxed">

		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
		<!-- <<< End Header >>> -->
 		<!-- insert 실패 -->
 		<c:if test="${insertCnt2 == 0}">
 			<script type="text/javascript">
 				alert("가입을 실패했습니다.");
 				
 			</script>
 		</c:if>
 		
 		<!-- insert 성공 -->
 		<c:if test="${insertCnt2 == 1}">
 			<script type="text/javascript">
 				alert("가입&이체 성공!");
 				window.location ="${path}/terminateList.do";
 			</script>
 		</c:if>


		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<!-- <<< End Footer >>> -->
		<!-- <<< End Footer >>> -->

	</div>
	<!-- End wrap -->
</body>
</html>