<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Upbank | CurrencyExchanceMain3</title>

<script type="text/javascript">

$(document).ready(function() {

	//입출금계좌별 잔액 조회
	$('#acctype').change(function(){
		var acc = $(this).val();
		var bal = $("#" + acc).attr('title');
		var result = null;
		if(bal != null) {
			result = "잔액:&nbsp;&nbsp;" + bal + "원";
		} else {
			result = "잔액:&nbsp;&nbsp;0원";
		}
		$("#balance").html(result);
	});
});

 function selectEmailChk(){//옵션 값을 선택하면 그 값이 useremail2로 들어가도록 한다.
	 if (document.currencyExchangeForm2.useremail3.value == "naver.com"){
		 document.currencyExchangeForm2.useremail2.value = document.currencyExchangeForm2.useremail3.value;
		 return false;
	 } else  if (document.currencyExchangeForm2.useremail3.value == "gmail.com"){
		 document.currencyExchangeForm2.useremail2.value = document.currencyExchangeForm2.useremail3.value;
		 return false;
	} else  if (document.currencyExchangeForm2.useremail3.value == "daum.net"){
	 document.currencyExchangeForm2.useremail2.value = document.currencyExchangeForm2.useremail3.value;
	 return false;
 	}  else if (document.currencyExchangeForm2.useremail3.value == "empal.com"){
	 document.currencyExchangeForm2.useremail2.value = document.currencyExchangeForm2.useremail3.value;
	 return false;
	 }  else if (document.currencyExchangeForm2.useremail3.value == "nate.com"){
		 document.currencyExchangeForm2.useremail2.value = document.currencyExchangeForm2.useremail3.value;
		 return false;
		 } else if (document.currencyExchangeForm2.useremail3.value == "0"){
			 document.currencyExchangeForm2.useremail2.focus();
		 }
 
 }
 
 
 //캐스케이딩 옵션 코드 
 var Select2Cascade = ( function(window, $) {

	    function Select2Cascade(parent, child, url, select2Options) {
	        var afterActions = [];
	        var options = select2Options || {};

	        // Register functions to be called after cascading data loading done
	        this.then = function(callback) {
	            afterActions.push(callback);
	            return this;
	        };

	        parent.select2(select2Options).on("change", function (e) {

	            child.prop("disabled", true);

	            var _this = this;
	            $.getJSON(url.replace(':parentId:', $(this).val()), function(items) {
	                var newOptions = '<option value="">-- Select --</option>';
	                for(var id in items) {
	                    newOptions += '<option value="'+ id +'">'+ items[id] +'</option>';
	                }

	                child.select2('destroy').html(newOptions).prop("disabled", false)
	                    .select2(options);
	                
	                afterActions.forEach(function (callback) {
	                    callback(parent, child, items);
	                });
	            });
	        });
	    }

	    return Select2Cascade;

	})( window, $);
 

 function submit_check(){

	 //이름: 입력시작부터 입력끝까지, 한글, 2~5글자만 들어가는 정규표현 객체를 생성 (공백x)
	 //휴대폰: 010, 080, 070중 하나 / 3~4자리, 4자리 일치하는 패턴으로 정규표현객체 생성
	 var reg2 = /^(010|070|080)\d{3,4}\d{4}$/; //핸드폰 d:decimal(정수), 
	 
	 var cp = document.currencyExchangeForm2.usercp.value;
	 var email = document.currencyExchangeForm2.useremail.value + "@" + document.currencyExchangeForm2.useremail2.value;
	 
	 var reg_pass = /^[A-Za-z0-9]{6,12}$/;
	 //이메일 정규식 입력방법
	 /* 
      1. ^ : 문장의 처음부터 시작한다.
      2. [0-9a-zA-Z_-]+ : 숫자 또는 알파벳 소문자 대문자 또는 밑줄(_), 하이픈(-)이 1개이상(+)이상 와야한다.
      3. ([0-9a-zA-Z_-]+) :  2에서의 형식을 한 묶음으로 한다. 시작과 끝으로 한다.
      4. @ : 골뱅이가 들어가고
      5. \.: . 이 들어간다.
      6. {1,2} : 앞의 식이 1개 또는 2개가 연속으로 올 수 있다.
      7. $ : 문장끝
      8. i : 대소문자 구별하지 않겠다.
      9. * : 0또는 그이상의 문자가 연속될 수 있다.
      */
      var reg_email = /^[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/i; //마지막 i는 대소문자 구분x
	
	 
	 //test():정규식 표현시 제공하는 메서드
	 var result2 = reg2.test(cp);
	 var resultEmail = reg_email.test(email);
	 
	 if(!result1){
		 document.currencyExchangeForm2.username.value = "";
		 document.currencyExchangeForm2.username.focus();
		 alert("이름 입력이 잘못되었습니다");
		 return false;
	 }
	 
	 if (!result2){
		 document.currencyExchangeForm2.usercp.value = " ";
		 document.currencyExchangeForm2.usercp.focus();
		 alert("휴대폰 번호가 잘못되었습니다");
		 return false;
	 }
	
	 
	if(!document.currencyExchangeForm2.useremail.value){
	 alert("이메일을 입력하세요!");
	 document.currencyExchangeForm2.useremail.focus();
	 alert("이메일 형식이 잘못되었습니다");
		 return false;
	 }
	 
	 else if(!resultEmail){
		 document.currencyExchangeForm2.useremail.value = " ";
		 document.currencyExchangeForm2.useremail.focus();
		 alert("이메일 형식이 잘못되었습니다");
		 return false;
	 }
	 
	function test(e) {
		alert(e);
	}
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
     <h3 class="title bottom-1">환전 신청 - 2</h3>
    <fieldset>
     <form name="currencyExchangeForm2" action="${path}/CurrencyExchangeMain4.cr" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      			<c:if test="${selectCnt ==0 }">
					<table class="style" width="600px">
					<tr>
						<td>
							<!-- ========================= Big Info Box ========================= -->
						       <div class="sixteen columns bottom-3">
						        <h3 class="title bottom-2">계좌 개설 안내</h3>
						        
						        <div class="qoute">
						          <div class="eleven columns omega">
						            <h4>환전신청을 위해 입출금 계좌가 필요합니다. </h4>
						            <p>먼저 신규 입출금 계좌를 개설해 주세요.</p>
						          </div>
						          <div class="four columns alpha"><a href="${path}/AccDefaultInsert.do" class="button1 medium color">계좌 개설</a></div>
						        </div>
						        
						       </div><!-- End column -->
       
       						<!-- ============================ End ============================ -->
       
						</td>
					</tr>
					<tr>
						<td>
						</td>
					</tr>
					</table>
				</c:if>
      		
      		
      		<c:if test="${selectCnt !=0 }">
      		<h3>환전신청인정보</h3>
	      		<table class="style" width="600px">
	      			<tr>
						<th>이름</th>
						<td> 
							${name}
							<input type="hidden" name="name" value="${name }" />
						</td>
					</tr>
					<tr>
				    	<th>연락처</th>
				    <td>
				    <span style="color:red; size:xx-small" >숫자만 입력해 주세요.</span>
				    <input type="text" id="cpChk" name="usercp" maxlength="11">
				     </td>
				  	</tr>
					<tr>
					    <th>이메일</th>
					    <td><input type="text" id="emailChk" name="useremail" maxlength="20" style="width:100px"> 
					    @ <input type="text"  name="useremail2" maxlength="20" style="width:100px"> 
					   <select name="useremail3" style="width:100px" onchange="selectEmailChk();">
					   	<option value="0">직접입력</option>
					   	<option value="naver.com">naver.com</option>
					   	<option value="gmail.com">gmail.com</option>
					   	<option value="daum.net">daum.net</option>
					   	<option value="empal.com">empal.com</option>
					   	<option value="nate.com">nate.com</option>
					   </select>
					    </td>
			  		</tr>
			  		<tr>
			  			<th>환전목적</th>
			  			<td>
				          <input type="radio" name="option" id="travel" value="여행비용"/><label for="travel">여행비용</label>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          <input type="radio" name="option" id="foreignmoney" value="외화보유"/><label for="foreignmoney">외화보유</label>
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
			                  <option value="김포국제공항">김포국제공항</option>
			                  <option value="인천국제공항">인천국제공항</option>
			                </select>
			            </td>
			            <td>    
			              <label for="subtype">터미널 선택</label>  
			            </td>
			            <td>       
			                <select name="subtype" id="subtype" >
			                    <option>수령 터미널</option>
			                    <option value="제1터미널">제1터미널</option>
			                 	<option value="제2터미널">제2터미널</option>
			                </select>
				        </td> 
				        <td>
				        	<label for="sub-subtype" >수령 장소</label>
				        </td>
				        <td>
				        	<select name="subsubtype" id="subsubtype" >
			                    <option>수령 방법</option>
			                    <option value="창구">창구</option>
			                 	<option value="ATM">ATM</option>
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
			                  <c:forEach var="dto1" items="${list}" varStatus="status">
				                  <option value="${dto1.ACCOUNT}" id="${dto1.ACCOUNT}" title="${dto1.BALANCE}">${dto1.PRODUCT_NAME}<span>&nbsp;:&nbsp;</span>${dto1.ACCOUNT}</option>
			                  </c:forEach>
			                </select>
						</td>
						<td colspan="2"> 
							<span id="balance">잔액:&nbsp;&nbsp; 원</span>
							<span id=exchangeWon>환전요청액:&nbsp;&nbsp;<fmt:formatNumber value="${dto.exchangeWon }" pattern="#,###원"/></span>
							<input type="hidden" name="exchangeWon" value="${dto.exchangeWon }" />
						</td>
					</tr>
					<tr>
						<th>계좌비밀번호</th>
						<td colspan="6">
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
							<input type="submit" name ="currencyExchangeBtn3" id ="currencyExchangeBtn3" value="환전정보입력" class="button1 small color">
						</td>
					</tr>
				</table>
				</c:if>
      		</form>
      	</fieldset>	
	 </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>