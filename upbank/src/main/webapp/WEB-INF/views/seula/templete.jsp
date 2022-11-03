<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>


		<!-- JSP 사이즈 맞춘 템플릿이에요. 사이즈랑 위치 맞춰주세요. -->

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> 페이지 이름 </title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">

  <!-- Mobile Specific Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>

	<div id="wrap" class="boxed">
	  
	  <!-- 헤더 -->
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
		</header><!-- <<< End Header >>> -->
	   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>파란색 바</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
		<!-- Start Sidebar Widgets -->
		<div class="five columns sidebar bottom-3">
			<%@ include file="/WEB-INF/views/aram/customer/loan_sidebar.jsp" %>
		</div><!-- End Sidebar Widgets -->
		
	   <!-- Start Posts -->
	     <div class="sixteen columns bottom-3">
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1"> 본문 제목 </h3><!-- Title Post -->
	      <div class="post-content">
	   	 	
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== End Single Post  ==================== -->
	   </div><!-- End Posts -->  
	   
   <div class="clearfix"></div>
   </div><!-- <<< End Container >>> -->
   
   	<!-- 풋터 -->
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
	</div><!-- End wrap -->
  
</body>
</html>