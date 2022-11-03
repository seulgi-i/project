<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 대출 신청</title>
  <script type="text/javascript">
  
  	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		$("#loan_join").click(function() {
  			if(form_chk()) {
  	  			document.loan_apply_form.action="${path}/loan_join_confirm.lo";
  	  			document.loan_apply_form.submit();
  	  			return true;
  			} else {
  				return false;
  			}
  		});
  		
  		// 금리 정보 넘겨주기
  		$("#loan_rate").change(function() {
  			var rate = $(this).val();
  			var selRate = $("#" + rate).attr("label");
  			document.loan_apply_form.rate_info.value = selRate;
  		});
  		
  		$("#postcodify_search_button").postcodifyPopUp();
  		return false;
  	});
  	
  	function form_chk() {
  		var name = document.loan_apply_form.name;
  		var social_num = document.loan_apply_form.social_num;
  		var social_etc = document.loan_apply_form.social_etc;
  		var phone = document.loan_apply_form.phone;
  		var emergency_phone = document.loan_apply_form.emergency_phone;
  		var l_principal = document.loan_apply_form.l_principal;
  		var l_period = document.loan_apply_form.l_period;
  		var l_repay = document.loan_apply_form.l_repay;
  		var loan_rate = document.loan_apply_form.loan_rate;

  		if(name.value == null || name.value == "") {
			alert("신청자를 입력해주세요");
  	  		return false;
  	  		
  		} else if((social_num.value == null || social_num.value == "") && $("#social_etc").is(":checked") != true) {
			alert("주민등록번호를 입력해주세요");
  	  		return false;
  	  		
  		} else if(phone.value == null || phone.value == "") {
  			alert("신청자 연락처를 입력해주세요");
  	  		return false;
  	  		
  		} else if(emergency_phone.value == null || emergency_phone.value == "") {
  			alert("대체 연락처를 입력해주세요");
  	  		return false;
  			
  		} else if(l_principal.value == null || l_principal.value == "") {
			alert("대출 신청 금액을 입력해주세요");
  	  		return false;
  			
  		} else if(l_period.value == "") {
			alert("대출 만기를 입력해주세요");
  	  		return false;
  	  		
  		} else if($("#amortization").is(":checked") != true && $("#even_repayment").is(":checked") != true && $("#repayment").is(":checked") != true) {
			alert("상환 방식을 입력해주세요");
  	  		return false;
  		} else if(loan_rate.value == "") {
  			alert("금리를 선택해주세요");
  	  		return false;
  		}
  		return true;
  	}
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
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
		      <h3 class="title bottom-1">${dto.loan_name} 신청</h3><!-- Title Post -->
		      <form class="form-elements" name="loan_apply_form" method="post">
		      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		      <input type="hidden" name="loan_num" value="${dto.loan_num}">
		      <input type="hidden" name="loan_name" value="${dto.loan_name}">
		      	<!-- 회원 정보 -->
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		      	<h5 class="title bottom-1">인적 사항</h5>
		      	<fieldset>
		      		<span>신청자 : <strong style="color:#e00f00;">*</strong> </span>
         			<input type="text" name="name" value="${cDto.name}" style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>주민등록번호 : <strong style="color:#e00f00;">*</strong> </span>
         			<input type="text" name="social_num" placeholder="- 없이 숫자만 입력하세요" style="width:790px;" maxlength="13" />
         			<input type="checkbox" name="social_etc" id="social_etc" value="재외동포">
         				<label for="social_etc" style="margin:0 0 0 105px;">재외동포(재외국인 및 외국국적동포)인 경우 체크</label>
		      	</fieldset>
		      	<!-- https://www.poesis.org/postcodify/ 사용 -->
		      	<fieldset>
		      		<span>현 거주지 주소 : </span>
         			<input type="text" name="postcode" placeholder="우편번호" class="postcodify_postcode" value="${cDto.post_num}"/>
         			<a id="postcodify_search_button" class="button1 small color">검색</a><br>
         			<input type="text" name="address" placeholder="도로명 주소" class="postcodify_address" value="${cDto.address}" style="width:890px; margin:1px;"/>
         			<input type="text" name="address_detail" placeholder="상세 주소" class="postcodify_details" value="${cDto.address_detail}" style="width:890px; margin:1px;"/>
		      	</fieldset>
				<fieldset>
		      		<span>본인 휴대전화 : <strong style="color:#e00f00;">*</strong> </span>
         			<input type="text" name="phone" value="${cDto.phone}" placeholder="-를 포함해 공백 없이 작성해주세요" style="width:785px;" />
		      	</fieldset>	
				<fieldset>
		      		<span>대체 연락처 : <strong style="color:#e00f00;">*</strong> </span>
         			<input type="text" name="emergency_phone" placeholder="-를 포함해 공백 없이 작성해주세요" style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>입출금 계좌 : <strong style="color:#e00f00;">*</strong> </span>
         			<select name="account" style="width:800px;">
         				<c:forEach var="accDto" items="${accList}">
         					<option value="${accDto.ACCOUNT}">${accDto.ACCOUNT} ${accDto.PRODUCT_NAME}</option>
         				</c:forEach>
         			</select>
         			<input type="hidden" name="account_name" value="${accDto.PRODUCT_NAME}" />
		      	</fieldset>	
			    
		      	<hr class="line bottom-3" style="width:900px;"></hr>
			    
			    <!-- 대출 정보 -->
		      	<h5 class="title bottom-1">대출 조건</h5>
		      	<fieldset>
		      		<span>대출 신청 금액 : <strong style="color:#e00f00;">*</strong> </span>
         			<input type="text" name="l_principal" placeholder="특수기호 및 공백 없이 숫자만 입력하세요" />원	<span style="padding: 0 30px; color:#a8a8a8;"><fmt:formatNumber value="${dto.loan_limit}" pattern="##,###,###" /> 원(최대신청가능금액)</span><br>
         			<span style="padding:10px 120px;">
         				<ul>
         					<li style="list-style-type:circle">백만원 단위로 입력하세요</li>
         				</ul>
         			</span>
		      	</fieldset>
		      	<fieldset>
		      		<span>대출 만기 : <strong style="color:#e00f00;">*</strong> </span>
         			<c:if test="${dto.loan_period <= 36}">
         				<input type="radio" name="l_period" id="l_period_0.5" value="0.5" /><label for="l_period_0.5">6개월</label>
         			</c:if>
         			<input type="radio" name="l_period" id="l_period_1" value="1" /><label for="l_period_1">1년</label>
         			<c:if test="${dto.loan_period >= 24 && dto.loan_period < 60}">
         				<input type="radio" name="l_period" id="l_period_2" value="2" /><label for="l_period_2">2년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 36}">
         				<input type="radio" name="l_period" id="l_period_3" value="3" /><label for="l_period_3">3년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 48 && dto.loan_period < 60}">
         				<input type="radio" name="l_period" id="l_period_4" value="4" /><label for="l_period_4">4년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 60}">
         				<input type="radio" name="l_period" id="l_period_5" value="5" /><label for="l_period_5">5년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 84 && dto.loan_period < 240}">
         				<input type="radio" name="l_period" id="l_period_7" value="7" /><label for="l_period_7">7년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 120}">
         				<input type="radio" name="l_period" id="l_period_10" value="10" /><label for="l_period_10">10년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 240}">
         				<input type="radio" name="l_period" id="l_period_20" value="20" /><label for="l_period_20">20년</label>
         			</c:if>
         			<c:if test="${dto.loan_period >= 360}">
         				<input type="radio" name="l_period" id="l_period_30" value="30" /><label for="l_period_30">30년</label>
         			</c:if>
		      	</fieldset>
	          	<fieldset>
		          <span>상환 방식 : <strong style="color:#e00f00;">*</strong> </span>
		          <c:set var="repay" value="${fn:split(dto.loan_repay, ' ,')}" />
		          <c:forEach var="i" items="${repay}">
		          	<c:if test="${i == '원리금균등분할상환'}">
		          		<input type="radio" name="l_repay" id="amortization" value="amortization" /><label for="amortization">원리금균등분할상환</label><br>
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 상환하는 원금의 이자와 합계가 동일한 금액으로 상환</strong></span><br>
		          	</c:if>
		          	<c:if test="${i == '원금균등분할상환'}">
		          		<input type="radio" name="l_repay" id="even_repayment" value="even_repayment" /><label for="even_repayment">원금균등분할상환</label><br>
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 동일한 원금이 상환되고 이자는 대출 잔액에 따라 계산되어 매월 상환하는 원금과 이자의 합계가 감소</strong></span><br>
		          	</c:if>
		          	<c:if test="${i == '원금만기일시상환'}">
		          		<input type="radio" name="l_repay" id="repayment" value="repayment" /><label for="repayment">원금만기일시상환</label><br>
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 동일한 이자가 상환되고 만기일시 원금과 해당 월의 이자를 동시 상환</strong></span><br>
		          	</c:if>
		          </c:forEach>
	          	</fieldset>
		      	<fieldset>
	          		<span>금리 기준 : </span>
		          	<select name="loan_rate" id="loan_rate" style="width:800px;" >
		          		<option value="">금리를 선택하세요</option>
		          		<c:forEach var="rate" items="${dto.rate}">
		          			<option value="${rate.loan_rate}" id="${rate.loan_rate}" label="${rate.rate_name} (변동 주기 : ${rate.rate_change}) (기준 금리 : ${rate.rate_basemoney}) (가산 금리 : ${rate.rate_spread}) (우대 금리 : ${rate.rate_prime})">${rate.rate_name} (변동 주기 : ${rate.rate_change}) (기준 금리 : ${rate.rate_basemoney}) (가산 금리 : ${rate.rate_spread}) (우대 금리 : ${rate.rate_prime})</option>
		 		  		</c:forEach>
		          	</select>
		          	<input type="hidden" name="rate_info" id="rate_info" value="">
		        </fieldset>
		      	<fieldset>
	          		<span>대출금 수령 희망 일자 : </span>
		          	<input type="date" name="l_start_date" id="l_start_date" min="<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />">
		        </fieldset>
		        
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		        
		      	<fieldset style="text-align:right; width: 900px;">
		      		<button name="join_reset" type="reset" class="button1 large normal">취소</button>
		      		<button name="join_add" type="submit" id="loan_join" class="button1 large color">등록</button>
		      	</fieldset>
		      </form>
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