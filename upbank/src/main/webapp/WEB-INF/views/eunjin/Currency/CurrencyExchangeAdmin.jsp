<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Page left sidebar - Invention | Creative Responsive Theme</title>
</head>
<body>
<div id="wrap" class="boxed">
<header>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</header>     
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>외환</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">환율</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/CurrencyExchangeAdmin.ad">환전수령여부변경</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
 <!-- Start Posts -->
	     <div class="sixteen columns bottom-3">
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1"> 환율 조회 </h3><!-- Title Post -->
	      <div class="post-content">
	     	 <form name="curExcSelectForm" action="${path}/CurrencyExchangeAdmin2.ad" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	   	 	
	   	 		<table class="style color" >
	   	 			<tr>
	   	 				<td colspan="2" align="center">휴대폰번호</td>
	   	 				<td colspan="7"><input type="text" class="input" name="usercp" size="11" placeholder="숫자만 입력해 주세요">
	   	 				</td>
	   	 				<td colspan="2" align="center">
	   	 				<input type="submit" id="cur_input" value="조회" class="button1 samll normal">
	   	 				</td>
	   	 			<tr>
		   	 			<th>환전신청인</th>
		   	 			<th>출금계좌번호</th>
		   	 			<th>연락처</th>
		   	 			<th>환전목적</th>
		   	 			<th>수령예정일</th>
		   	 			<th>수령공항</th>
		   	 			<th>수령터미널</th>
		   	 			<th>수령방법</th>
		   	 			<th>신청일자</th>
		   	 			<th>환전액</th>
		   	 			<th>수령여부</th>
		   	 		</tr>
		   	 		<tr>
		   	 			<td colspan="11">휴대폰번호를 입력하시면 환전신청내역 조회가 가능합니다.</td>
		   	 		</tr>
	   	 		</table>
	   	 	</form>
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== End Single Post  ==================== -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>
  
</body>
</html>