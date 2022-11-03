<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 대출 신청</title>
  	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		$("#loan_join").click(function() {
  			document.loan_apply_form.action="${path}/loan_join_action.lo";
  			document.loan_apply_form.submit();
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
		      <h3 class="title bottom-1">${param.loan_name} 신청 확인</h3><!-- Title Post -->
		      <form class="form-elements" name="loan_apply_form" method="post">
		      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		      <input type="hidden" name="loan_num" value="${param.loan_num}">
		      	<!-- 회원 정보 -->
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		      	<h5 class="title bottom-1">인적 사항</h5>
		      	<fieldset>
		      		<span>신청자 : </span>
		      		<input type="text" name="name" value="${param.name}" readonly style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>주민등록번호 : </span>
		      		<c:if test="${param.social_num != ''}">
		      			<input type="text" name="social_num" value="${param.social_num}" readonly style="width:800px;" />
		      		</c:if>
         			<c:if test="${param.social_etc != null}">
         				<input type="hidden" name="social_etc" id="social_etc" value="재외동포">
         				<input type="text" name="social_etc_show" value="재외동포" readonly style="width:800px;" />
		      		</c:if>
		      	</fieldset>
		      	<!-- https://www.poesis.org/postcodify/ 사용 -->
		      	<c:if test="${param.postcode != '' && param.address != '' && param.address_detail != ''}">
			      	<fieldset>
			      		<span>현 거주지 주소 : </span>
		      			<input type="hidden" name="postcode" value="${param.postcode}"/>
			      		<input type="text" name="postcode_show" value="우편번호 : ${param.postcode}" readonly /><br>
			      		<input type="text" name="address" value="${param.address}" readonly style="width:890px; margin:1px;"/>
			      		<input type="text" name="address_detail" value="${param.address_detail}" readonly style="width:890px; margin:1px;"/>
			      	</fieldset>
		      	</c:if>
				<fieldset>
		      		<span>본인 휴대전화 : </span>
         			<input type="text" name="phone" value="${param.phone}" readonly style="width:795px;" />
		      	</fieldset>	
				<fieldset>
		      		<span>대체 연락처 : </span>
         			<input type="text" name="emergency_phone" value="${param.emergency_phone}" readonly style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>입출금 계좌 : </span>
		      		<input type="hidden" name="account_show" value="${param.account} ${param.account_name}" readonly style="width:800px;" />
		      		<input type="hidden" name="account" value="${param.account}"/>
		      	</fieldset>	
			    
		      	<hr class="line bottom-3" style="width:900px;"></hr>
			    
			    <!-- 대출 정보 -->
		      	<h5 class="title bottom-1">대출 조건</h5>
		      	<fieldset>
		      		<span>대출 신청 금액 : </span>
         			<input type="text" name="l_principal_show" value="<fmt:formatNumber value="${param.l_principal}" pattern="##,###,###" />백만원" readonly style="width:793px;"/>
         			<input type="hidden" name="l_principal" value="${param.l_principal}"/>
		      	</fieldset>
		      	<fieldset>
		      		<span>대출 만기 : </span>
		      		<c:if test="${param.l_period == 0.5}">
		      			<input type="text" name="l_period_show" value="6개월" readonly style="width:800px;" />
		      		</c:if>
		      		<c:if test="${param.l_period != 0.5}">
		      			<input type="text" name="l_period_show" value="${param.l_period}년" readonly style="width:800px;" />
		      		</c:if>
		      		<input type="hidden" name="l_period" value="${param.l_period}" />
		      	</fieldset>
	          	<fieldset>
		          <span>상환 방식 : </span>
		          	<c:if test="${param.l_repay == 'amortization'}">
		          		<input type="text" name="l_repay" id="amortization" value="원리금균등분할상환" readonly style="width:800px;" />
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 상환하는 원금의 이자와 합계가 동일한 금액으로 상환</strong></span>
		          	</c:if>
		          	<c:if test="${param.l_repay == 'even_repayment'}">
		          		<input type="text" name="l_repay" id="even_repayment" value="원금균등분할상환" readonly style="width:800px;" />
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 동일한 원금이 상환되고 이자는 대출 잔액에 따라 계산되어 매월 상환하는 원금과 이자의 합계가 감소</strong></span>
		          	</c:if>
		          	<c:if test="${param.l_repay == 'repayment'}">
		          		<input type="text" name="l_repay" id="repayment" value="원금만기일시상환" readonly style="width:800px;" />
		          		<span style="padding:10px 100px;">대출일부터 만기일까지 <strong style="color:#378ac4">매월 동일한 이자가 상환되고 만기일시 원금과 해당 월의 이자를 동시 상환</strong></span>
		          	</c:if>
	          	</fieldset>
		      	<fieldset>
	          		<span>금리 기준 : </span>
	          		<input type="text" name="rate_info" value="${param.rate_info}" readonly style="width:800px;" />
	          		<input type="hidden" name="loan_rate" value="${param.loan_rate}"/>
		        </fieldset>
		      	<fieldset>
	          		<span>대출금 수령 희망 일자 : </span>
		          	<input type="date" name="l_start_date" id="l_start_date" value="${param.l_start_date}" readonly />
		        </fieldset>
		        
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		        
		      	<fieldset style="text-align:right; width: 900px;">
		      		<button name="join_reset" type="reset" class="button1 large normal">취소</button>
		      		<button name="join_add" type="submit" id="loan_join" class="button1 large color">대출 신청</button>
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