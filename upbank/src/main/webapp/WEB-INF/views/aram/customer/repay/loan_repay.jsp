<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> UpBank 대출 - 대출 상환</title>
<script type="text/javascript">
	$(document).ready(function() {
	
		//입출금계좌별 잔액 조회
		$('#acctype').change(function(){
			var acc = $(this).val();
			var bal = $("#" + acc).attr('title');
			var result = null;
			if(bal != null) {
				result = "잔액:&nbsp;&nbsp; " + bal + "원";
			} else {
				result = "잔액:&nbsp;&nbsp;0원";
			}
			$("#balance").html(result);
		});
		
		//대출계좌별 잔액 조회
		$('#loan_acc').change(function(){
			var acc = $(this).val();
			var bal = $("#" + acc).attr('title');
			var result = null;
			if(bal != null) {
				result = "잔여 상환액:&nbsp;&nbsp; " + bal + "원";
			} else {
				result = "잔여 상환액:&nbsp;&nbsp;0원";
			}
			$("#loan_balance").html(result);
			
			if(acc != "") {
				repay_info(acc);
			} else {
				$("#info").html(acc);
			}
		});
	}); 
	
	function repay_info(account) {
		var param = {
				'account' : account,
		}
		
		$.ajax({
			url: '${path}/loan_accDetail.lo?${_csrf.parameterName}=${_csrf.token}',
			type: "POST",
			data: param,
			success: function(result) {
				if(result != null) {
					$("#info").html(result);
				}
			},
			error: function() {
				alert("오류");
			}
		})
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
		     <h3 class="title bottom-1">대출 상환</h3><!-- Title Post -->
		     
		     	<h5>출금정보</h5>
		      	<br>
		      	<hr style="border:solid 2px #378AC4">
		      	<br>
			   <form name="loan_repay_form" action="${path}/loan_terminate.lo" method="post" class="form-elements">
			   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			   	
			       <table class="style color" width="600px">
			       		<tr>
			       			<th>출금계좌정보</th>
							<td> 
			          			<select name="acc" id="acctype" required style="width:500px;">
			           			 <option value="">입출금계좌</option>
				                  <c:forEach var="dto" items="${sList}" varStatus="status">
					                  <option value="${dto.ACCOUNT}" id="${dto.ACCOUNT}" title="<fmt:formatNumber value="${dto.BALANCE}" pattern="#,###" />">
					                  	${dto.PRODUCT_NAME}&nbsp;:&nbsp;${dto.ACCOUNT}</option>
				                  </c:forEach>
			          			</select>
		 					</td>
							<td style="width:250px;"> 
								<span id="balance">잔액:&nbsp;&nbsp; 원</span>
							</td>
			       		</tr>
			       		<tr>
			       			<th>계좌비밀번호</th>
			       			<td colspan="2">
			       				<input type="password" id="ACCOUNT_PW" name="ACCOUNT_PW" maxlength="4" placeholder="숫자 4자리를 입력하세요" required>
			       			</td>
			       		</tr>
			       </table>
			       <br><br><br>
			       <h5>상환 정보</h5>
			      	<br>
			      	<hr style="border:solid 2px #378AC4">
			      	<br>
			       <table class="style color" width="600px">
			       		<tr>
			       			<th>대출계좌정보</th>
							<td> 
			          			<select name="loan_acc" id="loan_acc" required style="width:500px;">
			           			 	<option value="">대출계좌</option>
					                <c:forEach var="dto" items="${list}" varStatus="status">
						            	<option value="${dto.accInfo.ACCOUNT}" id="${dto.accInfo.ACCOUNT}" title="<fmt:formatNumber value="${-dto.accInfo.BALANCE}" pattern="#,###" />">
						            		${dto.accInfo.PRODUCT_NAME}&nbsp;:&nbsp;${dto.accInfo.ACCOUNT}</option>
					                </c:forEach>
			          			</select>
		 					</td>
							<td style="width:250px;"> 
								<span id="loan_balance">잔여 상환액:&nbsp;&nbsp; 원</span>
							</td>
			       		</tr>
			       		<tr>
			       			<th>이번 회차 상환 정보</th>
			       			<td colspan="2" id="info"></td>
			       		</tr>
			       		<tr>
			       			<td colspan="3" style="text-align:center">
			       				<button id="repay" class="button1 midium color"
			       				onsubmit="if(document.loan_repay_form.fee.value == null) {return false}">중도 상환 하기</button>
			       			</td>
			       		</tr>
			       </table>
			   </form>
		       
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== End Single Post  ==================== -->
	   </div><!-- End container -->  
	   
   <div class="clearfix"></div>
   <footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
   </div><!-- End wrap -->
  
</body>
</html>