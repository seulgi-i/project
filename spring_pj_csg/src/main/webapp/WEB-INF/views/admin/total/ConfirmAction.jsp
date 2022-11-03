<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용  -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 상품등록처리</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->

</head>
<body style="background:linen;">

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- header 끝 -->
		<c:if test="${updateCnt != 0}">
 			<script type="text/javascript">
 				alert("승인되었습니다~~~");
 				window.location ="${path}/ConfirmList.or";
 				
 			</script>
 		</c:if>
      		
 		<!-- insert 성공 -->
 		<c:if test="${updateCnt == 0}">
 			<script type="text/javascript">
 				alert("승인 실패");
 				window.location ="${path}/ConfirmList.cr";
 			</script>
 		</c:if>



      <!-- footer 시작 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>