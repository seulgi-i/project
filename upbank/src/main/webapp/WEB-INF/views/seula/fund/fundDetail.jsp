<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>
 
  <title>펀드</title>
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
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
     
     
     
   
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      <h3 class="title bottom-1">펀드</h3>
       <form name="editForm"  method="post" action="">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
       <hr class="line bottom-3"></hr>
<%--        <input type="hidden" name ="itemcode" class="itemcode" value="${dto.itemcode}">
		<input type="hidden" name ="itemname" class="itemname" value="${dto.itemname}">
		<input type="hidden" name ="nowVal" class="nowVal" value="${dto.nowVal}">
		<input type="hidden" name ="changeVal" class="changeVal" value="${dto.changeVal}">
		<input type="hidden" name ="changeRate" class="changeRate" value="${dto.changeRate}">
		<input type="hidden" name ="nav" class="nav" value="${dto.nav}">
		<input type="hidden" name ="threeMonthEarnRate" class="threeMonthEarnRate" value="${dto.threeMonthEarnRate}">
		<input type="hidden" name ="quant" class="quant" value="${dto.quant}">
		<input type="hidden" name ="amonut" class="amonut" value="${dto.amonut}">
		<input type="hidden" name ="marketSum" class="marketSum" value="${dto.marketSum}">
       	
		<input type="hidden" name ="date" value="${dtoC.date}">
		<input type="hidden" name ="volume" value="${dtoC.volume}">
		<input type="hidden" name ="yesterday" value="${dtoC.yesterday}">
		<input type="hidden" name ="open" value="${dtoC.open}">
		<input type="hidden" name ="low" value="${dtoC.low}">
		<input type="hidden" name ="high" value="${dtoC.high}">
		<input type="hidden" name ="close" value="${dtoC.close}"> --%>
       
       <div class="qoute" style="margin:0; height:200px;">
          <div class="eleven columns omega" style="width:100%">
            <div style="width:100%; display: flex; justify-content: space-between;">
            <div>
            ${dto.itemname} 
            <span style="font-size:10px">&ensp;&ensp;&ensp; ${dto.itemcode}
            &ensp;&ensp;&ensp;<i class="icon-calendar-empty s-20"></i>
            ${dtoC.date}기준
            </span>
            </div>
            <div  >
            <input type="button" value="구매" class="button1 small color" onclick="window.location='${path}/fundBuy.do?itemcode=${dto.itemcode}&itemname=${dto.itemname}'">
            </div>
            
            </div>
            <hr style="color:#4b4c4d; background:#4b4c4d; height:1px; border:0; width:870px; margin-bottom:15px">
            
            <div style="width:100%; display: flex; flex-direction: row; ">
            	<div style=" width:200px; padding:4px; padding-right:40px; border-right:1px solid #757575; display: flex; flex-direction: column; flex-wrap: wrap; align-content: center; align-items: flex-end;  margin-top:10px;">
	            	<div id="nowVal"style="font-size:40px;">
	            	<fmt:formatNumber pattern="###,###,###" value="${dto.nowVal}" />
	            	</div>
	            	<div style="display:flex; margin-top:10px;">
		            	 <div style="font-size:15px; color:#4b4c4d; padding-bottom:5px; ">전일대비</div>
		                 <div id="changeVal" style="font-size:15px;"><fmt:formatNumber pattern="▲#,##0; ▼#,##0" value="${dto.changeVal}" /></div>
	            	</div>
	                <div style="display:flex; margin-top:0px;">
		            	 <div style="font-size:15px; color:#4b4c4d; padding-bottom:10px; ">등락율</div>
		                 <div id="changeRate" style="font-size:15px;"><fmt:formatNumber pattern="▲0.00; ▼0.00" value="${dto.changeRate}" /></div>
	            	</div>
            	</div>
            	
            	<div style="width:100%; font-size:20px; margin-top: 10px; margin-left:30px">
	            	<div style="display: flex;">
	            		<div>전일&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dtoC.yesterday}" /></span></div>
	            		<div style="margin-left:30px;">고가&ensp;&ensp;&ensp;<span id ="high"><fmt:formatNumber pattern="###,###,###" value="${dtoC.high}" /></span></div>
	            		<div style="margin-left:110px;">거래량&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.quant}" /></span></div>
	            	</div>
	            	
	            	 <div style="display: flex;  margin-top:10px; ">
	            		<div >시가&ensp;&ensp;&ensp;<span id ="open"><fmt:formatNumber pattern="###,###,###" value="${dtoC.open}" /></span></div>
	            		<div style="margin-left:30px;">저가&ensp;&ensp;&ensp;<span id ="low"><fmt:formatNumber pattern="###,###,###" value="${dtoC.low}" /></span></div>
	            		<div style="margin-left:110px;">거래대금&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.amonut}" /></span><span style="font-size:15px;">(백만)</span></div>
	            	</div>
	            	
	            	<div style="display: flex;  margin-top:10px; ">
	            		<div >NAV&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.nav}" /></span></div>
	            		<div style="margin-left:30px;">3개월 수익율&ensp;&ensp;&ensp;<span id ="threeMonthEarnRate"><fmt:formatNumber pattern="▲#,##0.00; ▼#,##0.00" value="${dto.threeMonthEarnRate}"/></span></div>
	            		<div style="margin-left:30px;">시가총액&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.marketSum}"/></span><span style="font-size:15px;">(억)</span></div>
	            	</div>
            	</div>
            	</div>
            </div>
      </div>
      
      <div style="width:100% display: flex;">
	      <div style="width:700px;">
	       <div id="chart_div" style="width:940px; height:500px"></div>
	       <div id="chartVolume_div" style=" margin-left:85px; width:800px; height:200px"></div>
	      </div>
	      <div>
	      
	      </div>
      </div>
      </form>
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <script type="text/javascript">
   $(document).ready(function() {
	   var v_basePrice = ${dtoC.yesterday};
	   var v_nowVal = ${dto.nowVal};
	   var v_high = ${dtoC.high};
	   var v_low = ${dtoC.low};
	   var v_open = ${dtoC.open};
	   var v_three = ${dto.threeMonthEarnRate};
	   var changeRate = ${dto.changeRate};
	   
	   if(changeRate > 0){
		   $(function(){
			$('#changeRate').css('color', 'red');
		   }); 
	   }else{
		   $(function(){
				$('#changeRate').css('color', 'blue');
		    }); 
	   }
	   
	   if(v_basePrice < v_nowVal){
		   $(function(){
			$('#nowVal').css('color', 'red');
			$('#changeVal').css('color', 'red');
		   }); 
	   }else{
		   $(function(){
				$('#nowVal').css('color', 'blue');
				$('#changeVal').css('color', 'blue');
		    }); 
	   }
	   if(v_basePrice < v_high){
		   $(function(){
				$('#high').css('color', 'red');
			   }); 
		   }else{
			   $(function(){
					$('#high').css('color', 'blue');
			    }); 
		   }
	   if(v_basePrice < v_low){
		   $(function(){
				$('#low').css('color', 'red');
			   }); 
		   }else{
			   $(function(){
					$('#low').css('color', 'blue');
			    }); 
		   }

	   if(v_basePrice < v_open){
		   $(function(){
				$('#open').css('color', 'red');
			   }); 
		   }else{
			   $(function(){
					$('#open').css('color', 'blue');
			    }); 
		   }
	   if(v_three > 0){
		   $(function(){
				$('#threeMonthEarnRate').css('color', 'red');
			   }); 
		   }else{
			   $(function(){
					$('#threeMonthEarnRate').css('color', 'blue');
			    }); 
		   }
	   
	   
   });
   </script>
   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);

  function drawChart1() {
    var data1 = google.visualization.arrayToDataTable([
		${chart}
    ], true);

    var options1 = {
      legend:'none'
    };

    var chart1 = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart1.draw(data1, options1);
  }
    </script>  
    
      <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart2);

  function drawChart2() {
    var data2 = google.visualization.arrayToDataTable([
		${chartVolume}
    ], true);

    var options2 = {
      legend:'none'
    };

    var chart2 = new google.visualization.ColumnChart(document.getElementById('chartVolume_div'));

    chart2.draw(data2, options2);
  }
    </script> 
       
   <footer>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>