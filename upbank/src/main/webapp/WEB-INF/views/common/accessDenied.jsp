<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

  <!-- Basic Page Needs -->
  <title> accessDenied </title>
  
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
         <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
   
  
   <!-- 컨텐츠 시작 -->
	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 align="center"> 인증 실패. 접근이 거부되었습니다 </h1>
				<br>
				
				<p style="font-size: 18px">${errMSG }</p><br>
				
				<c:if test="${sessionScope.customerID != null }">
					<button value="로그아웃" class="button" style="width:200px; font-size:24px; text-align: center;" onclick="window.location='logout.do'">로그아웃</button>
				</c:if>
				
				<c:if test="${sessionScope.customerID == null }">
					<button value="로그인" class="button" style="width:200px; font-size:24px; text-align: center;" onclick="window.location='login.do'">로그인</button>
				</c:if>
			</div> 
		</div>
	</div>  
   
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
   <!-- 컨텐츠 종료 -->
  
  
  
  
  
  
  
   <footer>
   		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
  
  <!-- Start Style Switcher -->
  <div class="switcher"></div><!-- Div Contain Options -->
  <!-- End Style Switcher -->
    
</body>
</html>