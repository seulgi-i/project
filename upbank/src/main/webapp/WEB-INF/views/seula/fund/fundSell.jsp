<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<title>펀드</title>

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">

</head>
<body>

	<div id="wrap" class="boxed">

		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
		<!-- <<< End Header >>> -->
		 <c:if test="${sessionScope.customerID == null}">
		   <script type="text/javascript">
		    	alert("로그인이 필요합니다.");
		   		window.location="${path}/login.do";
		   		</script>
		   </c:if> 
		   

		<div class="page-title">
			<div class="container clearfix">

				<div class="sixteen columns">
					<h1>펀드</h1>
				</div>

			</div>
			<!-- End Container -->
		</div>
		<!-- End Page title -->

		<!-- Start main content -->
		<div class="container main-content clearfix">


			<!-- Start Sidebar Widgets -->
			<div class="five columns sidebar bottom-3">


     <!-- Categories Widget -->
	<%@ include file="leftBar.jsp"%>
     <!-- End -->


			</div>
			<!-- End Sidebar Widgets -->


			<!-- Start Posts -->
			<div class="sixteen columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">
				<h3 class="title bottom-1">펀드</h3>
				<form name="editForm"  method="post" action="${path}/fundSellAction.do">
       			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					 <hr class="line bottom-3"></hr>
					      
					<div class="qoute" style="margin:0; height:200px;">
			          <div class="eleven columns omega" style="width:100%">
			            <div style="width:100%; display: flex; justify-content: space-between; margin-bottom:10px">
				            <div>
				            ${dto.itemname} 
				            <span style="font-size:10px">&ensp;&ensp;&ensp; ${dto.itemcode}
				            &ensp;&ensp;&ensp;<i class="icon-calendar-empty s-20"></i>
				            ${dto.date}기준
				            </span>
				            </div>
			            
			            </div>
			            <hr style="color:#4b4c4d; background:#4b4c4d; height:1px; border:0; width:870px; margin-bottom:15px">
			            
			            <div style="width:100%; display: flex; flex-direction: row; ">
			            	<div style=" width:200px; padding:4px; padding-right:40px; border-right:1px solid #757575; display: flex; flex-direction: column; flex-wrap: wrap; align-content: center; align-items: flex-end;  margin-top:10px;">
				            	<div style="font-size:40px;">
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
			            	<div style="width:100%; font-size:20px; margin-top: 30px; margin-left:30px">
				            	<div style="display: flex;">
				            		<div>전일&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.yesterday}" /></span></div>
				            		<div style="margin-left:30px;">고가&ensp;&ensp;&ensp;<span id ="high"><fmt:formatNumber pattern="###,###,###" value="${dto.high}" /></span></div>
				            		<div style="margin-left:110px;">거래량&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.quant}" /></span></div>
				            	</div>
				            	
				            	 <div style="display: flex;  margin-top:20px; ">
				            		<div >시가&ensp;&ensp;&ensp;<span id ="open"><fmt:formatNumber pattern="###,###,###" value="${dto.open}" /></span></div>
				            		<div style="margin-left:30px;">저가&ensp;&ensp;&ensp;<span id ="low"><fmt:formatNumber pattern="###,###,###" value="${dto.low}" /></span></div>
				            		<div style="margin-left:110px;">거래대금&ensp;&ensp;&ensp;<span><fmt:formatNumber pattern="###,###,###" value="${dto.amonut}" /></span><span style="font-size:15px;">(백만)</span></div>
				            	</div>
			            	</div>
			            	</div>
			            </div>
			      </div>
      
      
      <div class="comment-form top-4" style="display: flex; text-align: center; align-items: flex-start; justify-content: space-around;">
      <hr class="bottom-2">
     
      
      <div style="padding-right:50px; border-right:1px solid #adb5bd; display: flex; flex-direction: column;">
      <h3 class="title bottom-2">주문 정보</h3><!-- Title Post -->
      <hr class="line bottom-3"></hr>
      <div class="form-box last" style="width:300px;">
        <label for="f_cnt" style=" display: block;">매도수량 <small></small></label>
        <div style="display:flex; width:300px;">
		<input type="button" id="minus" class="button1 small color" value="-" style="width:50px;">
        <input type="text" id="f_cnt" name="f_cnt" class="text" value="1" min="1" style="text-align: right;">
        <input type="button" id="plus" class="button1 small color" value="+" style="width:50px;">
        </div>
      </div><!-- End Box -->
      
      <div class="form-box last" style="width:300px;">
        <label for="show_totalPrice">매도금액  <small></small></label>
        <input type="text" id="show_totalPrice" class="text" value="<fmt:formatNumber pattern='###,###,###' value='${dto.nowVal}' />" readonly="readonly" style="text-align: right;">
      </div><!-- End Box -->
      
      <div class="form-box last" style="width:300px;">
        <label for="show_fee">거래수수료  <small></small></label>
        <input type="text" id="show_fee" class="text" value="<fmt:formatNumber pattern='###,###,###' value='' />" readonly="readonly" style="text-align: right;">
      </div><!-- End Box -->
      
      <div class="form-box" style="width:300px;">
        <label for="show_finalTotalPrice"><span style="color:red; font-weight:bold;">총 입금금액 </span></label>
        <input type="text" id="show_finalTotalPrice" class="text" value="<fmt:formatNumber pattern='###,###,###' value='${dto.nowVal*0.05 + dto.nowVal}' />" readonly="readonly" style="text-align: right;">
      </div><!-- End Box -->
      </div>
      
      <div style="display: flex; flex-direction: column;">
      <h3 class="title bottom-2">결제정보</h3><!-- Title Post -->
      <hr class="line bottom-3"></hr>
      <div class="form-box" style="width:310px;">
        <label for="show_ACCOUNT">입금계좌 </label>
        <input  type="text" id="show_ACCOUNT" class="text" readonly="readonly" value="${member[0].PRODUCT_NAME} - ${member[0].ACCOUNT}">
      </div><!-- End Box -->
      
      <div class="form-box last" style="width:310px;">
        <label for="ACCOUNT_PW">계좌 비밀번호 </label>
        <input type="text" id="ACCOUNT_PW" name="ACCOUNT_PW" class="text" placeholder="비밀번호를 입력하세요">
      </div><!-- End Box -->
      
      <input type="hidden" value="${dto.itemcode}" name="itemcode">
      <input type="hidden" value="${dto.itemname}" name="itemname">
      <input type="hidden" id="ACCOUNT" value="${member[0].ACCOUNT}" name="f_account">
      <input type="hidden" value="${dto.nowVal}" name="f_val" id="nowVal">
      <input type="hidden" value="${dto.nowVal}" name="f_totalPrice" id="f_totalPrice" >
      <input type="hidden" value="${dto.nowVal*0.05}" name="f_fee" id="f_fee" >
      <input type="hidden" value="${dto.nowVal*0.05 + dto.nowVal}" name="f_finalTotalPrice" id="f_finalTotalPrice" >
      <input type="button" id="buyButton" value="매도" class="button1 medium color" style="width:271px;">
      </div>
    </div>
			</form>
		      </div><!-- End fields -->
				<!-- ==================== End Single Post  ==================== -->

			</div>
			<!-- End Posts -->

			<div class="clearfix"></div>

		</div>
		<!-- <<< End Container >>> -->
		
		   <script type="text/javascript">
   $(document).ready(function() {
	   var v_basePrice = ${dto.yesterday};
	   var v_nowVal = ${dto.nowVal};
	   var v_high = ${dto.high};
	   var v_low = ${dto.low};
	   var v_open = ${dto.open};
	/*    var v_three = ${dto.threeMonthEarnRate}; */
	   var changeRate = ${dto.changeRate};
	   var f_fee = Math.ceil(${dto.nowVal} * 0.05);
	   $('#f_fee').val(f_fee);
	   $('#show_fee').val(f_fee);
	   
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
/* 	   if(v_three > 0){
		   $(function(){
				$('#threeMonthEarnRate').css('color', 'red');
			   }); 
		   }else{
			   $(function(){
					$('#threeMonthEarnRate').css('color', 'blue');
			    }); 
		   } */
	   
	   
   });
   </script>
   
   <script type="text/javascript">
   $(function() {
	   
	   var f_cnt = parseInt($('#f_cnt').val());	//주문수량
	   var nowVal = parseInt($('#nowVal').val());	//가격
	   var f_totalPrice = nowVal;	//수량*가격
	   var show_totalPrice;
	   var f_fee = f_totalPrice * 0.05;
	   var show_fee;
	   var f_finalTotalPrice = f_totalPrice + f_fee;
	   var show_finalTotalPrice;
	   
	      $("#minus").click(function(){
	    	  if(f_cnt > 1 ){
	    		  // 수량 수정
	    		  f_cnt = f_cnt-1;
	    		  //금액 수정
	    		  f_totalPrice = f_cnt * nowVal;
	    		  show_totalPrice = f_totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    		  //수수료 수정
	    		  f_fee = Math.ceil(f_totalPrice * 0.05);
	    		  show_fee = f_fee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    		  //총결제금액 수정
	    		  f_finalTotalPrice = f_totalPrice - f_fee;
	    		  show_finalTotalPrice = f_finalTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    		  
	    		  $('#f_cnt').val(f_cnt);
	    		  $('#f_totalPrice').val(f_totalPrice);
	    		  $('#show_totalPrice').val(show_totalPrice);
	    		  $('#f_fee').val(f_fee);
	    		  $('#show_fee').val(show_fee);
	    		  $('#f_finalTotalPrice').val(f_finalTotalPrice);
	    		  $('#show_finalTotalPrice').val(show_finalTotalPrice);
	    	  }else{
	    		  alert('수량을 확인해 주세요');
	    	  }
	      });
	      $("#plus").click(function(){
	    	  //수량수정
	    	  f_cnt = f_cnt+1; 
	    	  //금액 수정
    		  f_totalPrice = f_cnt * nowVal;
    		  show_totalPrice = f_totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    		  //수수료 수정
    		  f_fee = Math.ceil(f_totalPrice * 0.05);
    		  show_fee = f_fee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    		  //총결제금액 수정
    		  f_finalTotalPrice = f_totalPrice + f_fee;
    		  show_finalTotalPrice = f_finalTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    		  
    		  $('#f_cnt').val(f_cnt);
    		  $('#f_totalPrice').val(f_totalPrice);
    		  $('#show_totalPrice').val(show_totalPrice);
    		  $('#f_fee').val(f_fee);
    		  $('#show_fee').val(show_fee);
    		  $('#f_finalTotalPrice').val(f_finalTotalPrice);
    		  $('#show_finalTotalPrice').val(show_finalTotalPrice);
	      });
	      
	      var acc;
	      $('#buyButton').click(function(){
	    	  acc = $('#ACCOUNT').val();
	    	  
	    	  if(acc == null || acc == ''){
	    		  alert('펀드 계좌 생성 후 매매 가능합니다.');
	    		  window.location.href='${path}/fundAccountInsert.do';
	    	  }else{
	    		  if($('#ACCOUNT_PW').val() == null || $('#ACCOUNT_PW').val() ==''){
	    		  alert('계좌 비밀번호를 입력해주세요.');
		    	  }else{
		 			 document.editForm.submit();
		    	  }
	    	  }
	      });
	   });
   </script>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<!-- <<< End Footer >>> -->

	</div>
	<!-- End wrap -->


</body>
</html>