<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 메인페이지</title>
  <style type="text/css">
  	.year, .interest {
  		width: 50px;
  	}
  	
  	.cal_submit {
  		box-sizing:content-box;
  		height:80px;
  		width:70%;
  	}
  </style>
  
  <script type="text/javascript">
  	$(function(){
  		$(".cal_submit").click(function(e) {
  			var popUp = "대출 이자 계산기";
  			
  			var button = $(this).val();
  			
  			if(button == 'amortization') {
  				var principal = document.intrest_cal.amortization_principal.value;
  				var year = document.intrest_cal.amortization_year.value;
  				var interest = document.intrest_cal.amortization_interest.value;
  				
  				if(principal != 0 && year != 0 && interest != "") {
  					window.open("", popUp, "toolbar=no, scrollbars=no, resizable=yes, status=no, menubar=no, width=500, height=800, top=30, left=50");
  	  	  			
  					document.intrest_cal.target = popUp;
  		  			document.intrest_cal.action="${path}/intrest_cal.lo?kind=" + button;
  		  			document.intrest_cal.submit();
  				} else {
  					alert("대출 계산기에 값을 입력해주세요.");
  					$("form").each(function() {
  						this.reset();
  					});
  					return false;
  				}
  			} else if(button == 'even_repayment') {
  				var principal = document.intrest_cal.even_repayment_principal.value;
  				var year = document.intrest_cal.even_repayment_year.value;
  				var interest = document.intrest_cal.even_repayment_interest.value;
  				
  				if(principal != "" && year != "" && interest != "") {
  					window.open("", popUp, "toolbar=no, scrollbars=no, resizable=yes, status=no, menubar=no, width=500, height=800, top=30, left=50");
  	  	  			
  					document.intrest_cal.target = popUp;
  		  			document.intrest_cal.action="${path}/intrest_cal.lo?kind=" + button;
  		  			document.intrest_cal.submit();
  				} else {
  					alert("대출 계산기에 값을 입력해주세요.");
  					$("form").each(function() {
  						this.reset();
  					});
  					return false;
  				}
  			} else if(button == 'repayment') {
  				var principal = document.intrest_cal.repayment_principal.value;
  				var year = document.intrest_cal.repayment_year.value;
  				var interest = document.intrest_cal.repayment_interest.value;
  				
  				if(principal != "" && year != "" && interest != "") {
  					window.open("", popUp, "toolbar=no, scrollbars=no, resizable=yes, status=no, menubar=no, width=500, height=800, top=30, left=50");
  	  			
  					document.intrest_cal.target = popUp;
  		  			document.intrest_cal.action="${path}/intrest_cal.lo?kind=" + button;
  		  			document.intrest_cal.submit();
  				} else {
  					alert("대출 계산기에 값을 입력해주세요.");
  					$("form").each(function() {
  						this.reset();
  					});
  					return false;
  				}
  			}
  		})
  	})
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
         <h1>대출</h1>
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
	     
	      <!-- ==================== 본문 ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1">대출 메인</h3><!-- Title Post -->
	      <div class="post-content">
	      
	  <div class="services style-1 process bottom-3" style="display:flex">
       <div class="four columns" style="width:33%">
         <div class="item active bottom-3">
           <div class="circle" style="height:130px"><a href="${path}/loan_product.lo"><i class="icon-search icon-flip-horizontal"></i></a></div>
           <h4 style="text-align:center"><a href="${path}/loan_product.lo">대출 상품 찾기</a></h4>
         </div>
       </div><!-- End item -->
       
       <div class="four columns" style="width:33%">
         <div class="item bottom-3">
           <div class="circle" style="height:130px"><a href="#" onclick="login('${path}/loan_join_result.lo');"><i class="icon-check icon-flip-horizontal"></i></a></div>
           <h4 style="text-align:center"><a href="#" onclick="login('${path}/loan_join_result.lo');">대출 진행 조회</a></h4>
         </div>
       </div><!-- End item -->
       
       <div class="four columns" style="width:33%">
         <div class="item bottom-3">
           <div class="circle" style="height:130px"><a href="${path}/loan_repay.lo"><i class="icon-money"></i></a></div>
           <h4 style="text-align:center"><a href="${path}/loan_repay.lo">대출금 상환</a></h4>
         </div>
       </div><!-- End item -->
      </div>
      
      <br><br><br>
			 <!-- =================== 대출 계산기 ======================== -->
		     <div class="eight columns bottom-3" style="width:100%;">
		        <h4 class="title bottom-2">대출 계산기</h4> 
		        
		        <div id="horizontal-tabs">
			        <form name="intrest_cal" method="post">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          <ul class="tabs">
			            <li id="tab1">원리금 균등 상환</li>
			            <li id="tab2">원금 균등 상환</li>
			            <li id="tab3">원금 만기일시 상환</li>
			          </ul>
			          <div class="contents">
			          
			          <div id="content1" class="tabscontent" style="display:flex; align-items:center; justify-content:center; width:100%; padding: 1em 0;">
				          <p style="padding: 0 0 0 1em; height:100%; width:60%;">
				          	<strong>원리금 균등 상환일 때, </strong>
				          	<br><br>
				          	<input type="number" name="amortization_principal" placeholder="대출 금액" class="principal" id="amortization_principal"> 만원을&nbsp;
				          	<input type="number" name="amortization_year" placeholder="기간" class="year" id="amortization_year">년 동안<br>
				          	<input type="text" name="amortization_interest" placeholder="이자" class="interest" id="amortization_interest" style="margin: 2px 0;"> %로 대출 받으면?
				          </p>
				          <p style="padding:1em; height:100%; width:13%;">
				          	<button name="amortization" class="cal_submit button1 small color" value="amortization">결과보기</button>
				          </p>
			          </div> 
			          <div id="content2" class="tabscontent" style="display:flex; align-items:center; justify-content:center; width:100%; padding: 1em 0;">
			          	  <p style="padding: 0 0 0 1em; height:100%; width:60%;">
				          	<strong>원금 균등 상환일 때, </strong>
				          	<br><br>
				          	<input type="number" name="even_repayment_principal" placeholder="대출 금액" class="principal"> 만원을&nbsp;
				          	<input type="number" name="even_repayment_year" placeholder="기간" class="year">년 동안<br>
				          	<input type="text" name="even_repayment_interest" placeholder="이자" class="interest" style="margin: 2px 0;"> %로 대출 받으면?
				          </p>
				          <p style="padding:1em; height:100%; width:13%;">
				          	<button name="even_repayment" class="cal_submit button1 small color" value="even_repayment">결과보기</button>
				          </p>
			          </div> 
			          <div id="content3" class="tabscontent" style="display:flex; align-items:center; justify-content:center; width:100%; padding: 1em 0;">
			          	  <p style="padding: 0 0 0 1em; height:100%; width:60%;">
				          	<strong>원금 만기일시 상환일 때, </strong>
				          	<br><br>
				          	<input type="number" name="repayment_principal" placeholder="대출 금액" class="principal"> 만원을&nbsp;
				          	<input type="number" name="repayment_year" placeholder="기간" class="year">년 동안<br>
				          	<input type="text" name="repayment_interest" placeholder="이자" class="interest" style="margin: 2px 0;"> %로 대출 받으면?
				          </p>
				          <p style="padding:1em; height:100%; width:13%;">
				          	<button name="repayment" class="cal_submit button1 small color" value="repayment">결과보기</button>
				          </p>
			          </div>  
			          
			          </div><!-- End contents -->
		          	</form>
		        </div><!-- End horizontal-tabs -->
		        
		       </div><!-- End column -->
		    
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