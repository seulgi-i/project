<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입 폼</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/join.css">

<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/44bbd7835d.js" crossorigin="anonymous"></script>


<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->

</head>
<body>

<div class ="wrap">
   <!-- header 시작 -->
   <%@ include file="/common/nav.jsp" %>
   <!-- header 끝 -->

   <!-- 컨텐츠 시작 -->
   
   <!-- insert 실패 -->
   <c:if test="${insertCnt == 0}">
      <script type="text/javascript">
         setTimeout(function(){
         alert("회원가입에 실패하였습니다.");
         window.location="${path}/main.do"
         },1000);
      </script>
   </c:if>
   
   <!-- insert 성공 -->
   <c:if test="${insertCnt == 1}">
      <!-- response.sendRedirect("/jsp_pj_117/mainSuccess.do?insertCnt=" + insertCnt); // CustomerController.java의 80행과 변수 일치  -->
      <%-- <c:redirect url="mainSuccess.do?insertCnt=${insertCnt}" /> --%>
         <script type="text/javascript">
         setTimeout(function(){
         alert("회원가입 성공!!");
         window.location="${path}/login.do"
         },1000);
      </script>
   </c:if>   
   
     <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     
   <!-- 컨텐츠 종료 -->

   
   <!-- footer시작 -->
   <%@ include file="/common/footer.jsp" %>
   <!-- footer 끝 -->   
</div>
</body>
</html>