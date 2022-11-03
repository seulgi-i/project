<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Upbank | CurrencyExchanceMain4</title>

<script type="text/javascript">

$(document).ready(function() {

	//입출금계좌별 잔액 조회
	$('#acctype').change(function(){
		var e = $(this).val();
		var result = "잔액:&nbsp;&nbsp;" + e + "원";
		$("#balance").html(result);
	});
});

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
     <h3 class="title bottom-1">환전 신청 - 3</h3>
      <c:if test="${insertCnt == 1 }">
      	<form name="currencyExchangeForm3" action="${path}/CurrencyExchangeSearch2.cr" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      		<input type="hidden" name="usercp" value="${dto.usercp}">	
      			<div align="center">
      				<br>	
					<br>
	      			<h2>환전 신청이 성공했습니다.</h2>
					<br>	
					<br>
					<input type="submit" class="button1 medium color" value="환전신청내역조회" />
				</div>
		</form>
     </c:if>
     <c:if test="${insertCnt == -1 }">
     	<table class="style" width="600px">
	      			<tr>
						<th>Oops!</th>
						<td>계좌에 잔액이 부족합니다. 환전액을 확인해 주세요.</td>
					</tr>
					<tr>
						<td>
						<a href="${path }/CurrencyExchangeMain.cr" class="button medium black">환전신청으로 돌아가기</a>
						</td>
					</tr>
		</table>			
     </c:if>
     <c:if test="${insertCnt == -2 }">
    <fieldset>
     <form name="currencyExchangeForm2" action="${path}/CurrencyExchangeMain4.cr" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      		<h3>환전신청인정보</h3>
	      		<table class="style" width="600px">
	      			<tr>
						<th>이름</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
				    	<th>연락처</th>
				    	<td><input type="text" name="usercp" value="${dto.usercp}" /></td>
				  	</tr>
					<tr>
					    <th>이메일</th>
					    <td><input type="text" name="usercp" value="${dto.email}" /></td>
			  		</tr>
			  		<tr>
			  			<th>환전목적</th>
			  			<td>
				          <input type="radio" name="option" id="travel" value="여행비용" checked readonly/><label for="radio_1">여행비용</label>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          <input type="radio" name="option" id="foreignmoney" value="외화보유"/><label for="radio_2">외화보유</label>
			  			</td>
			  		</tr>
	    		</table>
	    		<br><br>
	    		<h3>외화수령정보</h3>
	      		<table class="style" width="600px">
	      			<tr>
						<th>외화수령일</th>
						<td colspan="2"> 
							<input type="date" class="input" id ="exc_date" name="exc_date" max="${plusMonth }" min="${todayDate }" />
						</td>
						<td colspan="4"> 
							지정일로부터 30일 이내에만 수령 가능합니다.
						</td>
					</tr>
					<tr>
						<th>외화수령지점</th>
						<td> 
			              <label for="type" >공항 선택</label>
			            </td>
			            <td>   
			                <select name="type" id="type">
			                  <option>수령 공항</option>
			                  <option value="gimpo">김포국제공항</option>
			                  <option value="incheon">인천국제공항</option>
			                </select>
			            </td>
			            <td>    
			              <label for="subtype">터미널 선택</label>  
			            </td>
			            <td>       
			                <select name="subtype" id="subtype" >
			                    <option>수령 터미널</option>
			                    <option value="1terminal">제1터미널</option>
			                 	<option value="2terminal">제2터미널</option>
			                </select>
				        </td> 
				        <td>
				        	<label for="sub-subtype" >수령 장소</label>
				        </td>
				        <td>
				        	<select name="sub-subtype" id="sub-subtype" >
			                    <option>수령 방법</option>
			                    <option value="teller">창구</option>
			                 	<option value="atm">ATM</option>
			                </select>
				        </td>       
					</tr>
	    		</table>
	    		<br><br>
	    		<h3>출금정보</h3>
	      		<table class="style" width="600px">
	      			<tr>
						<th>출금계좌정보</th>
						<td colspan="2"> 
							<select name="acctype" id="acctype">
			                  <option value="">입출금계좌</option>
			                  <c:forEach var="dto" items="${list }" varStatus="status">
				                  <option value="${dto.BALANCE}">${dto.PRODUCT_NAME}<span>&nbsp;:&nbsp;</span>${dto.ACCOUNT}</option>
			                  </c:forEach>
			                </select>
						</td>
						<td colspan="2"> 
							<span id="balance">잔액:&nbsp;&nbsp;${dto.BALANCE }원</span>
						</td>
					</tr>
					<tr>
						<th>계좌비밀번호</th>
						<td colspan="6">
						<span style="color:red; size:5" >비밀번호가 틀렸습니다. 올바른 비밀번호를 입력해 주세요.</span><br>
						<input type="password" id="ACCOUNT_PW" name="ACCOUNT_PW" maxlength="4" placeholder="숫자 4자리를 입력하세요" required>
						</td>
					</tr>
					<tr>
						<th>수령인 정보(예금주와 동일)</th>
						<td colspan="6"> 
							${name}
						</td>
					</tr>
					<tr>
						<td colspan="7">
							<input type="submit" name ="currencyExchangeBtn2" id ="currencyExchangeBtn2" value="환전정보입력" class="button1 small color">
						</td>
					</tr>
				</table>
      		</form>
      	</fieldset>
      	</c:if>	
	 </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>