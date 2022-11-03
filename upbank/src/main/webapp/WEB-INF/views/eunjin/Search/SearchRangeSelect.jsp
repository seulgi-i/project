<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.*" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Upbank | CurrencyInfo</title>

</head>
<body>
<div id="wrap" class="boxed">
<header>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</header>     
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>조회</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
    <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">계좌조회</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path }/SearchMain.do">보유계좌조회</a></li>
         <li><a href="${path }/SearchRangeSelect.do">거래내역기간조회</a></li>
         <li><a href="${path }/SleepDisableAcc.do">휴면/해지계좌조회</a></li>
         <li><a href="${path }/SoonEndLoanSearch.do">기일도래계좌조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
	   <!-- Start Posts -->
	     <div class="sixteen columns bottom-3">
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1"> 거래내역기간조회 </h3><!-- Title Post -->
	      <div class="post-content">
	      <form name="SearchRangeSelectForm" action="${path}/SearchRangeSelectAction.do" method="get">
	   	 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	   	 	
	   	 	<table class="style color" >
	   	 		<tr align="center">
	   	 			<td>
	   	 			조회 시작일
	   	 			</td>
	   	 			<td colspan="3">
	   	 			<input type="date" class="input" name="start_date" size="10" placeholder="YYYY/MM/DD">
	   	 			</td>
	   	 			<td>
	   	 			조회 종료일
	   	 			</td>
	   	 			<td colspan="3">
	   	 			<input type="date" class="input" name="end_date" size="10" placeholder="YYYY/MM/DD">
	   	 			</td>
	   	 			<td>
	   	 			<input type="submit" id="searchRange" name="searchRange" value="조회" >
	   	 			</td>
	   	 		</tr>
	   	 		<tr>
	   	 			<th>계좌번호</th>
	   	 			<th>이체계좌</th>
	   	 			<th>이체은행</th>
	   	 			<th>이체금액</th>
	   	 			<th>이체날짜</th>
	   	 			<th>보낸사람 <br>표시 내용</th>
	   	 			<th>받는사람 <br>표시 내용</th>
	   	 			<th>예금주</th>
	   	 			<th>수수료</th>
	   	 			
	   	 		</tr>
		   	 	</table>
	   	 	</form>
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