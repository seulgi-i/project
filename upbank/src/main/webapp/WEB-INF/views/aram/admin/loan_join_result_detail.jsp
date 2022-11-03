<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 대출 신청 결과 조회</title>
  <script type="text/javascript">
  	$(function() {
  	  	$("#accept").click(function() {
  	  		document.loan_apply_form.action= "${path}/admin_loan_accept.lo";
  	  		document.loan_apply_form.submit();
  	  	});
  	  	
  	  	$("#denied").click(function() {
  	  		document.loan_apply_form.action= "${path}/admin_loan_denied.lo";
  	  		document.loan_apply_form.submit();
  	  	});
  	})
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
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1">대출 신청 결과 조회</h3><!-- Title Post -->
	      <form class="form-elements" name="loan_apply_form" method="post">
		      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		      <input type="hidden" name="l_join_num" value="${dto.l_join_num}">
		      	<!-- 회원 정보 -->
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		      	<h5 class="title bottom-1">인적 사항</h5>
		      	<fieldset>
		      		<span>신청자 : </span>
		      		<input type="text" name="name" value="${dto.name}" readonly style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>주민등록번호 : </span>
		      		<c:if test="${dto.social_num != ''}">
		      			<c:set var="sn" value="${dto.social_num}" />
		      			<input type="text" name="social_num" value="${fn:substring(sn, 0, 6)}-${fn:substring(sn, 6, 14)}" readonly style="width:800px;" />
		      		</c:if>
         			<c:if test="${dto.social_etc != null}">
         				<input type="hidden" name="social_etc" id="social_etc" value="재외동포">
         				<input type="text" name="social_etc_show" value="재외동포" readonly style="width:800px;" />
		      		</c:if>
		      	</fieldset>
		      	<!-- https://www.poesis.org/postcodify/ 사용 -->
		      	<c:if test="${dto.postcode != '' && dto.address != '' && dto.address_detail != ''}">
			      	<fieldset>
			      		<span>현 거주지 주소 : </span>
		      			<input type="hidden" name="postcode" value="${dto.postcode}"/>
			      		<input type="text" name="postcode_show" value="우편번호 : ${dto.postcode}" readonly /><br>
			      		<input type="text" name="address" value="${dto.address}" readonly style="width:890px; margin:1px;"/>
			      		<input type="text" name="address_detail" value="${dto.address_detail}" readonly style="width:890px; margin:1px;"/>
			      	</fieldset>
		      	</c:if>
				<fieldset>
		      		<span>본인 휴대전화 : </span>
         			<input type="text" name="phone" value="${dto.phone}" readonly style="width:795px;" />
		      	</fieldset>	
				<fieldset>
		      		<span>대체 연락처 : </span>
         			<input type="text" name="emergency_phone" value="${dto.emergency_phone}" readonly style="width:800px;" />
		      	</fieldset>
		      	<fieldset>
		      		<span>입출금 계좌 : </span>
		      		<input type="hidden" name="account_show" value="${accDto.account} ${accDto.account_name}" readonly style="width:800px;" />
		      		<input type="hidden" name="account" value="${accDto.account}"/>
		      	</fieldset>	
			    
		      	<hr class="line bottom-3" style="width:900px;"></hr>
			    
			    <!-- 대출 정보 -->
		      	<h5 class="title bottom-1">대출 조건</h5>
		      	<fieldset>
		      		<span>대출 신청 금액 : </span>
         			<input type="text" name="l_principal_show" value="<fmt:formatNumber value="${dto.l_principal}" pattern="##,###,###" />원" readonly style="width:793px;"/>
         			<input type="hidden" name="l_principal" value="${dto.l_principal}"/>
		      	</fieldset>
		      	<fieldset>
		      		<span>대출 만기 : </span>
		      		<c:if test="${dto.l_period == 0.5}">
		      			<input type="text" name="l_period_show" value="6개월" readonly style="width:800px;" />
		      		</c:if>
		      		<c:if test="${dto.l_period != 0.5}">
		      			<input type="text" name="l_period_show" value="${dto.l_period}년" readonly style="width:800px;" />
		      		</c:if>
		      		<input type="hidden" name="l_period" value="${dto.l_period}" />
		      	</fieldset>
	          	<fieldset>
		          <span>상환 방식 : </span>
	          		<input type="text" name="l_repay" id="amortization" value="${dto.l_repay}" readonly style="width:800px;" />
	          	</fieldset>
		      	<fieldset>
	          		<span>대출금 수령 희망 일자 : </span>
		          	<input type="date" name="l_start_date" id="l_start_date" value="${dto.l_start_date}" readonly />
		        </fieldset>
		        
		      	<hr class="line bottom-3" style="width:900px;"></hr>
		        
		        <c:if test="${dto.l_confirm == 0}">
			      	<fieldset style="text-align:right; width: 900px;">
			      		<button name="denied" type="reset" id="denied" class="button1 large normal">대출 불가</button>
			      		<button name="accept" type="submit" id="accept" class="button1 large color">대출 승인</button>
			      	</fieldset>
		      	</c:if>
		      	<c:if test="${dto.l_confirm != 0}">
			      	<fieldset style="text-align:right; width: 900px;">
			      		<c:if test="${dto.l_confirm == 1}"><div class="button1 large color">대출 승인 완료</div></c:if>
			      		<c:if test="${dto.l_confirm == -1}"><div class="button1 large normal">대출 불가</div></c:if>
			      	</fieldset>
		      	</c:if>
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