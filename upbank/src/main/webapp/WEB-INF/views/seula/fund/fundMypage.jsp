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
    	<c:if test="${sessionScope.customerID == null}">
		   <script type="text/javascript">
		    	alert("로그인이 필요합니다.");
		   		window.location="${path}/login.do";
		   		</script>
		   </c:if> 
		   

   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>마이페이지</h1>
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
	      <h3 class="title bottom-1"> 펀드 보유 내역  </h3><!-- Title Post -->
	       <hr class="line bottom-3"></hr>
	      <div class="post-content">
	      <form name="editForm"  method="post" action="">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

		<!-- 계좌 요약 -->
		    <div style="width:100%; height:200px; background:#f9f9f9; margin-bottom:100px; display: flex; flex-direction: column; justify-content: space-around;">
	             <div style="margin-left:15px;">
	             <h5 style="font-weight:bold;"><계좌 정보></h5>
	             </div>
	             
	             <div style="width:100%;  font-size:20px; margin-top: 5px; margin-left:30px;">
	             		출금계좌 &ensp;&ensp;&ensp;<span>${total.PRODUCT_NAME} : ${total.f_account}</span>
	             </div>
	             <div style="width:100%;  font-size:20px; margin-top: 10px; margin-left:30px;">
	             		계좌잔액 &ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${total.BALANCE}" /></span>
	             
	             </div>
	            
	            <div style="width:100%;  font-size:20px; margin-top: 10px; margin-left:30px; display: flex;">
            		<div>매수금액&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${total.f_finalTotalPrice}" /></span></div>
            	
            		<div style="margin-left:50px">평가금액&ensp;&ensp;&ensp;<span id ="f_totalEvaluationPrice"><fmt:formatNumber pattern="###,###,###" value="${total.f_totalEvaluationPrice}" /></span></div>
            	
            		<div style="margin-left:50px">손익&ensp;&ensp;&ensp;<span id="f_totalProfitLoss"><fmt:formatNumber pattern="###,###,###" value="${total.f_totalProfitLoss}" /></span></div>
            		<div style="margin-left:50px">손익율&ensp;&ensp;&ensp;<span id="f_totalReturn"><fmt:formatNumber pattern="▲0.00; ▼0.00" value="${total.f_totalReturn}" /></span></div>
	            </div>
	      </div>
		<!-- 계좌 요약 -->


		
	   	 	<table class="table table-hover" id="fundTable" style="font-size:12px">
	   	 	<thead style="background:#378ac4; color:#fff; font-weight:bold;">
	   	 		<tr>
	   	 			<th>종목코드</th>
	   	 			<th>종목명</th>
	   	 			<th style="text-align:right;">평가손익</th>
	   	 			<th style="text-align:right;">수익율</th>
	   	 			<th style="text-align:right;">수량</th>
	   	 			<th style="text-align:right;">평가금액</th>
	   	 			<th style="text-align:right;">매수금액</th>
	   	 			<th style="text-align:right;">매수가</th>
	   	 			<th style="text-align:right;">현재가</th>
	   	 			<th style="text-align:center;">매도신청</th>
	   	 		</tr>
	   	 		</thead>
	   	 		<tbody>
	   	 			<c:forEach var="dto" items="${list}" varStatus="status">
		   	 			<tr>
							<input type="hidden" name ="itemcode" class="itemcode" value="${dto.itemcode}">
							<input type="hidden" name ="itemname" class="itemname" value="${dto.itemname}">
							<input type="hidden" name ="f_profitLoss" class="f_profitLoss" value="${dto.f_profitLoss}">
							<input type="hidden" name ="f_return" class="f_return" value="${dto.f_return}">
							<input type="hidden" name ="f_cnt" class="f_cnt" value="${dto.f_cnt}">
							<input type="hidden" name ="f_evaluationPrice" class="f_evaluationPrice" value="${dto.f_evaluationPrice}">
							<input type="hidden" name ="f_totalPrice" class="f_totalPrice" value="${dto.f_totalPrice}">
							<input type="hidden" name ="f_val" class="f_val" value="${dto.f_val}">
							<input type="hidden" name ="nowVal" class="nowVal" value="${dto.nowVal}">
       	
							<td>${dto.itemcode}</td>	   	 			
							<td>${dto.itemname}</td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.f_profitLoss}" /></td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="▲#,##0.00; ▼#,##0.00" value="${dto.f_return}" /></td>	   	 			
							<td style="text-align:right;">${dto.f_cnt}</td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.f_evaluationPrice}" /></td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.f_totalPrice}" /></td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.f_val}" /></td>	   	 			
							<td style="text-align:right;"><fmt:formatNumber pattern="###,###,###" value="${dto.nowVal}" /></td>	
							<td style="text-align:center;"> 
							<input style="margin-left:30px;" type="button" id="fundBtn" class="button1 small color" value="매도" onclick="window.location='${path}/fundSell.do?itemcode=${dto.itemcode}&itemname=${dto.itemname}'">
							</td>   	 			
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
   <script type="text/javascript">
   $(document).ready(function() {
	   var v_totalReturn = ${total.f_totalReturn};
	   
	   if(v_totalReturn > 0){
		   $(function(){
			$('#f_totalReturn').css('color', 'red');
			$('#f_totalProfitLoss').css('color', 'red');
			$('#f_totalEvaluationPrice').css('color', 'red');
		   }); 
	   }else{
		   $(function(){
				$('#f_totalReturn').css('color', 'blue');
				$('#f_totalProfitLoss').css('color', 'blue');
				$('#f_totalEvaluationPrice').css('color', 'blue');
		    }); 
	   }
	   
   });
   </script> 
   		   <c:if test="${total.f_account == null}">
		   <script type="text/javascript">
		    	alert("펀드 거래내역이 없습니다.");
		   		window.location="${path}/etf.do";
		   	</script>
		   </c:if> 
   
   <footer>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>