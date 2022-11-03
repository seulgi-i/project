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
	      <h3 class="title bottom-1"> 기일도래계좌조회 </h3><!-- Title Post -->
	      <div class="post-content">
	      <form name="SoonEndLoanForm" method="get">
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	   	 	
	   	 	<table class="style color" >
	   	 		<tr align="center">
	   	 		 	<th>계좌번호</th>
	   	 			<th>대출 상품명</th>
	   	 			<th>대출 상태</th>
	   	 			<th>대출 실행일</th>
	   	 			<th>대출 만기일</th>
	   	 			<th>상환 방법</th>
	   	 			<th>대출 금리</th>
	   	 			<th>대출 원금</th>
	   	 			<th>대출 잔액</th>
	   	 			<th>중도상환수수료율</th>
	   	 			
	   	 		</tr>
	 	 		<c:forEach var="dto" items="${list }">
					<tr>
	   	 				<td><a href="${path}/SearchDetailTransfer.do?ACCOUNT=${dto.account }" >${dto.account }</a></td>
	   	 				<td>${dto.accInfo.PRODUCT_NAME}</td>
	   	 				<td>${dto.l_status}</td>
	   	 				<td>${dto.l_start_date}</td>
	   	 				<td>${dto.l_end_date} </td>
	   	 				<td>${dto.l_repay}</td>
	   	 				<td>${dto.l_rate}</td>
	   	 				<td><fmt:formatNumber value="${dto.l_principal}" pattern="#,###원"/></td>
	   	 				<td><fmt:formatNumber value="${dto.l_balance_principal}" pattern="#,###원"/></td>
	   	 				<td>${dto.l_termination_fee_rate}</td>
	   	 			</tr>
				</c:forEach>
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