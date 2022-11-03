<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>UpBank | Cancle Account</title>


<script type="text/javascript">
$(function(){
	$("#accCancleBtn").click(function(){
		 
		alert("눌렀다");
		var account = $(this).next().val();
		var balance = $(this).next().next().val();
		
		if(confirm("계좌 : "+account+"\n잔고 : "+balance)){
			if(balance<=0){
				alert("해지성공");
				location.href = "${path}/memberAccountCancleAction2.do?account="+account;
			}else{
				alert("통장에 금액이 남아있습니다.")
			}
		}
	})
})
</script>


</head>
<body>
<div id="wrap" class="boxed">
<header>
</header>     
   
           	  
<form name="memAccCancle_form" action="memAccCancleTrsf.do" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        	  	<h5>STEP.02 잔액이체</h5>
      	<br>
      	<hr style="border:solid 2px #378AC4">
      	<br>
      <table class="style color">
      		<tr>
      			<th width="14%">계좌번호</th>
      			<th width="9%">비밀번호</th>
      			<th width="12%"> 입금은행</th>
      			<th width="17%"> 입금계좌번호</th>
      			<th width="14%">이체금액(전액)</th>
      			<th width="15%">받는통장 메모</th>
      			<th width="15%">내통장 메모</th>
      		</tr>
      		
      		<tr>
      			<td width="16%">
      				<input type="text" name="acctype" value="${dto.account}" readonly style="width:110px">
      			</td>
      			<td>
      				<input type="password" name="ACCOUNT_PW" placeholder="****" required style="width:60px">
      			</td>
      			<td>
       			<select name="tf_bank" required style="width:100px">
                     <option value="">은행명 선택</option>
                     <option value="UpBank">UpBank</option>
                     <option value="경남은행">경남은행</option>
                     <option value="광주은행">광주은행</option>
                     <option value="국민은행">국민은행</option>
                     <option value="기업은행">기업은행</option>
                     <option value="농협중앙회">농협중앙회</option>
                     <option value="농협회원조합">농협회원조합</option>
                     <option value="대구은행">대구은행</option>
                     <option value="도이치은행">도이치은행</option>
                     <option value="부산은행">부산은행</option>
                     <option value="산업은행">산업은행</option>
                     <option value="상호저축은행">상호저축은행</option>
                     <option value="새마을금고">새마을금고</option>
                     <option value="수협중앙회">수협중앙회</option>
                     <option value="신한금융투자">신한금융투자</option>
                     <option value="신한은행">신한은행</option>
                     <option value="신협중앙회">신협중앙회</option>
                     <option value="외환은행">외환은행</option>
                     <option value="우리은행">우리은행</option>
                     <option value="우체국">우체국</option>
                     <option value="전북은행">전북은행</option>
                     <option value="제주은행">제주은행</option>
                     <option value="카카오뱅크">카카오뱅크</option>
                     <option value="케이뱅크">케이뱅크</option>
                     <option value="하나은행">하나은행</option>
                     <option value="한국씨티은행">한국씨티은행</option>
                     <option value="HSBC">HSBC은행</option>
                     <option value="제일은행">SC제일은행</option>
			  </select>
      			<td>
      				<input type="text" name="tf_sender_acc" placeholder="'-'없이 숫자만입력" maxlength="12" required style="width:120px"/>
      			</td>
      			
      			<td style="width:14%">
      				<input type="number" name="tf_amount" value="${dto.balance}" readonly style="width:80%"/>원
      			</td>
      			
      			<td>
      				<input type="text" name="tf_deposit_comment" value="휴면잔고이체" placeholder="(선택)7자 이내 입력" maxlength="7" style="width:110px"/>
      			</td>
      			
      			<td>
      				<input type="text" name="tf_sender_comment" value="휴면잔고이체" placeholder="(선택)7자 이내 입력" maxlength="7" style="width:110px"/>
      			</td>
      		</tr>
    	 </table>
    <i class="icon-caret-right s-20"></i>계좌 해지전 해당 계좌의 잔액을 모두 고객님의 다른 계좌로 이체해주시기 바랍니다.
    
      <br>
      <div align="center">
         <input type="submit" id="button" value="잔액이체" class="button1 small color">
         <input type="button" id="accCancleBtn" value="계좌해지" class="button1 small color">
         <input type="hidden" value="${dto.account}">
         <input type="hidden" value="${dto.balance}">
      </div>
</form>



          </div><!-- End contents -->
   
   <div class="clearfix"></div>
    
</body>
</html>