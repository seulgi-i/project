<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Upbank | CurrencyExchanceMain</title>

<style>
  input[type=submit] { 
    background-color: #62529c;
    border: none;
    color: #fff;
    padding: 15px 30px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
  }
</style>

<script type="text/javascript">

$(document).ready(function(){
   	$("#currencyExchange").keyup(function() {
   		if($("#currencyExchange").val().length > 0){
   			var currencyExchange = $("#currencyExchange").val();
   	   		CalcExchangeWon(currencyExchange);
   		} else {
   			var currencyExchange = 0;
   	   		CalcExchangeWon(currencyExchange);
   		}
   	});
});
	
function CalcExchangeWon(currencyExchange) {
	var param = {"currencyExchange" : currencyExchange};
	
   $.ajax({
        url: "${path}/CurrencyExchangeMain2.cr?${_csrf.parameterName}=${_csrf.token}",
        type: "POST",
        data: param,
        success: function(result){
        	$("#exchangeWon").html(result);
        },
        error: function (request, status, error){
        	alert("ajax 오류");
        } 
  	   });
}
</script>
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
         <li><a href="${path}/CurrencyInfo.cr">환율조회</a></li>
         <li><a href="${path}/CurrencyCalc.cr">환율계산기</a></li>
         <li><a href="${path}/CurrencyExchangeMain.cr">환전신청</a></li>
         <li><a href="${path}/CurrencyExchangeSearch.cr">환전신청내역조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     <h3 class="title bottom-1">환전 신청 - 1</h3>
     <form name="currencyExchangeForm" method="post" action="${path}/CurrencyExchangeMain3.cr">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  		<table class="style color" >
   	 		<tr>
   	 			<th>통화종류</th>
   	 			<th>환전금액(외화)</th>
   	 			<th>현재고시환율</th>
   	 			<th>우대적용환율</th>
   	 			<th>우대율</th>
   	 			<th>환전금액(원)</th>
   	 		</tr>
   	 		
   	 		<c:if test="${todayCurrency ==0}">
   	 		<tr>
   	 			<td colspan="6">주말 및 공휴일 환율정보 미제공으로 환전 신청이 불가합니다.</td>		
   	 		</tr>
   	 		</c:if>
	   	 	<c:if test="${todayCurrency !=0}">
			<tr>
				<td>USD</td>
				<td><input type="number" maxlength="4" id="currencyExchange" name="currencyExchange"></td>
				<td id="noticeCurrency">${dto.noticeCurrency}</td>
				<td id="goodCurrency">${dto.goodCurrency}</td>
				<td>50%</td>
				<td id="exchangeWon">${dto.exchangeWon}</td>
  	 		</tr>
  	 		<tr>
				<td colspan="6">
				<input type="submit" name ="currencyExchangeBtn" id ="currencyExchangeBtn" value="환전신청">
				<input type="hidden" name="exchangeWon" value="${dto.exchangeWon}" />
  	 		</tr>
  	 		</c:if>
  	 		
		 </table>
		</form> 
	 </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>