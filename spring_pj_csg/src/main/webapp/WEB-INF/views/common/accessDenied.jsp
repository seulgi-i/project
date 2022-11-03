<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>

<!-- 외부 스타일 파일을 적용하겠다. -->
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/main.css">

<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/44bbd7835d.js" crossorigin="anonymous"></script>

<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>


</head>
<body>

<div class ="wrap">
   <!-- header 시작 -->
	<%@ include file="header.jsp" %>
   <!-- header 끝 -->

   <!-- 컨텐츠 시작 -->
		
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center"> 관리자 페이지 </h1>
					<br>
					
					<p style="font-size:18px">${errMsg}</p><br>
					
					<c:if test="${sessionScope.customerID != null}">
						<button value="이동하기" class="button" style="width:200px; font-size:24px; text-align: center;" onclick="window.location='logout.do'">로그아웃</button>
					</c:if>
					
					<c:if test="${sessionScope.customerID == null}">
						<button value="이동하기" class="button"style="width:200px; font-size:24px; text-align: center;" onclick="window.location='login.do'">이동하기</button>
					</c:if>
					
			</div>
				
   
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <!-- 컨텐츠 종료 -->

   
   <!-- footer시작 -->
	<%@ include file="footer.jsp" %>
   <!-- footer 끝 -->   
</div>
</body>
</html>