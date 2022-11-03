<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 상품&가입</title>
  <script type="text/javascript">
  	var i = 0;
  
  	$(function() {  		
  		$(".rate_add").click(function() {
  			add_box();
  			i++;
  			return false;
  		});
  		
  		$("#product_add").click(function() {
  			if(checkInput() == true) {
  	  			document.loan_add_form.action="product_addAction.lo?rate_num=" + i;
  	  			document.loan_add_form.submit();
  			} else {
  				return false;
  			}
  		});
  	})
  	
  	function add_box() {
  		var divBox = document.getElementById("rate_input");
  		var newBox = document.createElement('div');
  		
  		if(document.loan_add_form.rate_status.value == '변동금리')
  			newBox.innerHTML = '<input type="hidden" name="rate_status_' + i + '" value="변동금리">' + 
  								'<hr class="line bottom-3" style="width:900px;"></hr><h4 class="title bottom-1">변동금리 입력</h4>' +
  								'<fieldset><span>금리 구분 : </span><input type="text" name="rate_name_' + i +'" placeholder="금리 구분명을 입력하세요" style="width:800px;" /></fieldset>' + 
  								'<fieldset><span>금리 변동 주기 : </span><input type="number" name="rate_change_' + i + '" placeholder="금리 변동 주기를 입력하세요" style="width:790px;" /></fieldset>' + 
  								'<fieldset><span>기준 금리 : </span><input type="number" name="rate_basemoney_' + i + '" placeholder="기준 금리를 입력하세요" style="width:800px;" /></fieldset>' + 
  								'<fieldset><span>가산 금리 : </span><input type="number" name="rate_spread_' + i + '" placeholder="가산 금리를 입력하세요" style="width:800px;" /></fieldset>' + 
  								'<fieldset><span>우대 금리 : </span><input type="number" name="rate_prime_' + i + '" placeholder="우대 금리를 입력하세요" style="width:800px;" /></fieldset>'; 
  			
  		if(document.loan_add_form.rate_status.value == '고정금리')
  			newBox.innerHTML = '<input type="hidden" name="rate_status_' + i + '" value="고정금리">' + 
								'<hr class="line bottom-3" style="width:900px;"></hr><h4 class="title bottom-1">고정 금리 입력</h4>' +
								'<fieldset><span>금리 구분 : </span><input type="text" name="rate_name_' + i +'" placeholder="금리 구분명을 입력하세요" style="width:800px;" /></fieldset>' + 
								'<fieldset><span>금리 변동 주기 : </span><input type="number" name="rate_change_' + i + '" placeholder="금리 변동 주기를 입력하세요" style="width:790px;" /></fieldset>' + 
								'<fieldset><span>기준 금리 : </span><input type="number" name="rate_basemoney_' + i + '" placeholder="기준 금리를 입력하세요" style="width:800px;" /></fieldset>' + 
								'<fieldset><span>가산 금리 : </span><input type="number" name="rate_spread_' + i + '" placeholder="가산 금리를 입력하세요" style="width:800px;" /></fieldset>' + 
								'<fieldset><span>우대 금리 : </span><input type="number" name="rate_prime_' + i + '" placeholder="우대 금리를 입력하세요" style="width:800px;" /></fieldset>';
  		divBox.appendChild(newBox);
  	}
  	
  	function checkInput() {
  		var loan_name = document.loan_add_form.loan_name;

  		var loan_rate_summary = document.loan_add_form.loan_rate_summary;
  		var rate_name_0 = document.loan_add_form.rate_name_0;
  		var rate_basemoney_0 = document.loan_add_form.rate_basemoney_0;

  		var loan_limit = document.loan_add_form.loan_limit;
  		var loan_limit_summary = document.loan_add_form.loan_limit_summary;
  		var loan_period = document.loan_add_form.loan_period;
  		var loan_period_summary = document.loan_add_form.loan_period_summary;

  		var loan_repay_summary = document.loan_add_form.loan_repay_summary;
  		var loan_termination_fee = document.loan_add_form.loan_termination_fee;
  		
  		if(loan_name.value == null || loan_name.value == "") {
  			alert('대출 상품명을 입력해주세요');
  			return false;
  			
  		} else if(rate_name_0 == undefined && rate_basemoney_0 == undefined) {
  			alert('금리를 입력해주세요');
  			return false;
  			
  		} else if(rate_name_0.value == null || rate_name_0.value == "") {
  			alert('금리 구분명을 입력해주세요');
  			return false;
  			
  		} else if(rate_basemoney_0.value == null || rate_basemoney_0.value == "") {
  			alert('기준 금리를 입력해주세요');
  			return false;
  			
  		} else if(loan_rate_summary.value == null || loan_rate_summary.value == "") {
  			alert('금리 설명을 입력해주세요');
  			return false;
  			
  		} else if(loan_limit.value == null || loan_limit.value == "") {
  			alert('대출 한도를 입력해주세요');
  			return false;
  			
  		} else if(loan_period.value == null || loan_period.value == "") {
  			alert('대출 기간을 입력해주세요');
  			return false;
  			
  		} else if($("#amortization").is(":checked") != true && $("#even_repayment").is(":checked") != true && $("#repayment").is(":checked") != true) {
  			alert('대출 상환 방식을 하나 이상 선택해주세요');
  			return false;
  			
  		} else if(loan_repay_summary.value == null || loan_repay_summary.value == "") {
  			alert('대출 상환 방식 설명을 입력해주세요');
  			return false;
  			
  		} else if(loan_termination_fee.value == null || loan_termination_fee.value == "") {
  			alert('중도 상환 해약금율을 입력해주세요');
  			return false;
  		}
  		
  		return true;
  	}
  </script>
</head>
<body>

	<div id="wrap" class="boxed">
	  
		<header>
			<%@ include file="/WEB-INF/views/common/adminheader.jsp" %>
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
			<%@ include file="/WEB-INF/views/aram/admin/loan_sidebar.jsp" %>
		</div><!-- End Sidebar Widgets -->
		
	   <!-- Start Posts -->
	     <div class="sixteen columns bottom-3">
	     
	      <!-- ==================== 대출 상품 입력 폼 - 시작 ==================== -->
	      <div class="post single style-1">
		      <h3 class="title bottom-1">대출 상품 입력</h3><!-- Title Post -->
		      <form class="form-elements" name="loan_add_form" method="post">
		      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		      	<fieldset>
		      		<span>상품명 : </span>
         			<input type="text" name="loan_name" placeholder="대출 상품명을 입력하세요" style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>상품요약 : </span>
         			<input type="text" name="loan_summary" placeholder="대출 상품 요약을 입력하세요" style="width:800px;" />
		      	</fieldset>
	          	<fieldset>
		          <span>판매 상태 : </span>
		          <select name="loan_status" style="width:800px;">
		            <option value="판매중" selected>판매 중</option>
		            <option value="판매중단">판매 중단</option>
		          </select>
	          	</fieldset>
	          	<hr class="line bottom-3" style="width:900px;"></hr>
		      	<fieldset>
	          		<span>금리 : </span>
		          	<select name="rate_status" style="width:720px;">
		            	<option value="변동금리" selected>변동 금리</option>
		            	<option value="고정금리">고정 금리</option>
		          	</select>
		          	<button name="rate_add" id="rate_add" class="rate_add button1 small color">추가</button>
		          	 
			      	<br><br>
		        </fieldset>
	          	<fieldset>
	          		<span>금리 설명 : </span>
	          		<textarea name="loan_rate_summary"></textarea>
	          	</fieldset>
		        <div id="rate_input">
		        
		      	</div>
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		      	
	          	<fieldset>
		      		<span>대출 한도 : </span>
         			<input type="number" name="loan_limit" placeholder="대출 한도를 숫자로 입력하세요" style="width:800px;" />
		      	</fieldset>
	          	<fieldset>
		      		<span>대출 기간 : </span>
         			<input type="number" name="loan_period" placeholder="개월 수를 입력하세요" style="width:800px;" />
		      	</fieldset>
	          	<fieldset>
		          <span>상환 방식 : </span>
		          <input type="checkbox" id="amortization" name="loan_repay" value="원리금균등분할상환" /><label for="amortization">원리금 균등 분할 상환</label>
		          <input type="checkbox" id="even_repayment" name="loan_repay" value="원금균등분할상환" /><label for="even_repayment">원금 균등 분할 상환</label>
		          <input type="checkbox" id="repayment" name="loan_repay" value="원금만기일시상환" /><label for="repayment">원금 만기일시 상환</label>
		          <textarea name="loan_repay_summary"></textarea>
	          	</fieldset>
	          	<fieldset>
		      		<span>중도 상환 해약금율 : </span>
         			<input type="number" name="loan_termination_fee" placeholder="퍼센티지를 입력하세요" style="width:765px;" />
		      	</fieldset>
	          	<fieldset>
		      		<span>유의사항 : </span>
         			<textarea name="loan_note"></textarea>
		      	</fieldset>
		      	<fieldset style="text-align:right; width: 900px;">
		      		<button name="product_reset" type="reset" class="button1 large normal">취소</button>
		      		<button name="product_add" type="submit" id="product_add" class="button1 large color">등록</button>
		      	</fieldset>
		      </form>
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== 대출 상품 입력 폼 - 끝  ==================== -->
	   </div><!-- End container -->  
	   
   <div class="clearfix"></div>
   <footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
   </div><!-- End wrap -->
  
</body>
</html>