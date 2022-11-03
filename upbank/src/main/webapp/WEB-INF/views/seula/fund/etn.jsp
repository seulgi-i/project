<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>
 
  <title>펀드</title>
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
<script type="text/javascript">
   
	//상세조회
	 $(function() {		 
		 $(".etfItem").click(function(){
			 var key = $(this).data("num");
			 console.log(key);
			 /* location.href ="${path}/etfDetail.do?key="+key; */		
			 document.editForm.action="${path}/fundDetail.do?key="+key;	
			 document.editForm.submit();
		});
	 });			 		  
	
</script>
  
  
  
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>펀드</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     
     <!-- Categories Widget -->
<%@ include file="leftBar.jsp"%>
     <!-- End -->
     
     <!-- Text Widget -->
     <div class="widget" style="margin-top:100px">
     <li style="text-indent: 1px;"><i class="icon-comments-alt s-20 color"></i>고객센터</li>
       <!-- Title Widget -->
       <p style="text-indent: 5px;">1588-1234</p>
       <p style="text-indent: 5px;">1599-1234</p>
     </div>
     <!-- End -->
     
     
   
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
		<div class="post single style-1">
	      <h3 class="title bottom-1"> ETN  </h3><!-- Title Post -->
	      <hr class="line bottom-3"></hr>
	      <div class="post-content">
	      <form name="editForm"  method="post" action="">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	   	 	<table class="table table-hover" id="fundTable" style="font-size:12px">
	   	 	<thead style="background:#378ac4; color:#fff; font-weight:bold;">
	   	 		<tr>
	   	 			<th>종목코드</th>
	   	 			<th>종목명</th>
	   	 			<th>현재가</th>
	   	 			<th>전일비</th>
	   	 			<th>등락률</th>
	   	 			<th>거래량</th>
	   	 			<th>거래대금(백만)</th>
	   	 			<th>시가총액(억)</th>
	   	 		</tr>
	   	 		</thead>
	   	 		<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
					
					<tr class="etfItem" data-num="${status.index}">					
	   	 				<input type="hidden" name ="itemcode${status.index}" class="itemcode" value="${dto.itemcode}">
	   	 				<input type="hidden" name ="itemname${status.index}" class="itemname" value="${dto.itemname}">
	   	 				<input type="hidden" name ="nowVal${status.index}" class="nowVal" value="${dto.nowVal}">
	   	 				<input type="hidden" name ="nav${status.index}" class="changeVal" value="0">
	   	 				<input type="hidden" name ="threeMonthEarnRate${status.index}" class="changeVal" value="0">
	   	 				<input type="hidden" name ="changeVal${status.index}" class="changeVal" value="${dto.changeVal}">
	   	 				<input type="hidden" name ="changeRate${status.index}" class="changeRate" value="${dto.changeRate}">
	   	 				<input type="hidden" name ="quant${status.index}" class="quant" value="${dto.quant}">
	   	 				<input type="hidden" name ="amonut${status.index}" class="amonut" value="${dto.amonut}">
	   	 				<input type="hidden" name ="marketSum${status.index}" class="marketSum" value="${dto.marketSum}">
	   	 				<td>${dto.itemcode}</td>
	   	 				<td>${dto.itemname}</td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.nowVal}" /></td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="△#,##0; ▼#,##0" value="${dto.changeVal}" /></td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="△0.00; ▼0.00" value="${dto.changeRate}" /></td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.quant}" /></td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.amonut}" /></td>
	   	 				<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.marketSum}" /></td>
	   	 			</tr>
	   	 			</c:forEach>
	   	 			</tbody>
	   	 	</table>
	   	 	</form>
	      </div><!-- End post-content -->
	     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>