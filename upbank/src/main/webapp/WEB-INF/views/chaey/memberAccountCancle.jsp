<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>UpBank | Cancle Account</title>
<script type="text/javascript">
 $(function(){
	 	$("input[name^='cancleBtn']").click(function(){
			var param = {
					"account": $(this).next().val(),
				}
					 
			$.ajax({
				url: '${path}/memberAccountCancleAction.do?${_csrf.parameterName}=${_csrf.token}',
				type: 'post',
				data: param,
				success: function(data){	//콜백함수 호출
					$('#result').html(data);	
				},
				error: function(){
					alert('일치하는 정보가 없습니다. 다시 확인해주세요');
				}
			})
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
         <h1>조회</h1>
       </div>
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">계좌조회</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path }/SearchMain.do">보유계좌조회</a></li>
         <li><a href="${path}/SearchRangeSelect.do">거래내역기간조회</a></li>
         <li><a href="${path }/SleepDisableAcc.do">거래중지/휴면/해지</a>
         	<dl style="margin-top:5px;">
         		<dt style="font-size:12px"><a href="${path}/memberAccountList_stopped.do">-거래중지계좌</a></dt>
	         	<dt style="font-size:12px"><a href="${path}/memberAccountCancle.do">-휴면계좌</a></dt>
	         	<dt style="font-size:12px"><a href="${path}/memberAccountList_cancled.do">-해지계좌</a></dt>
         	</dl>
         </li>
         <li><a href="${path }/SoonEndLoanSearch.do">기일도래계좌조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	     	 <h3 class="title bottom-1">계좌해지처리</h3><!-- Title Post -->
           	  
           	  	<h5>STEP.01 휴면계좌 정보</h5>
           	  	<hr style="border:solid 2px #378AC4">
		       		<table class="style color">
			          <tbody valign="middle">
			            <tr>
			              <th width="14%">계좌번호</th>
			              <th width="12%">계좌종류</th>
			              <th width="14%">신규일</th>
			              <th width="14%">최근거래일<br>/만기일</th>
			              <th width="14%">통장잔고</th>
			              <th width="12%">계좌상태</th>
			              <th width="12%">선택</th>
			              
			            </tr>
			            
			            <c:forEach var="dto" items="${list}">
			            <tr>
			              <td>${dto.account }</td>
			              <td>${dto.account_type}</td>
			              <td>${dto.new_date }</td>
			              <td>${dto.last_date }<br>/ ${dto.i_end_date}</td>
			              <td>${dto.balance }</td>
			              <td>${dto.account_state }</td>
			              <td>
			              	<input type="button" id="cancleBtn" name="cancleBtn_${dto.account}" value="잔고정리">
			              	<input type="hidden" name="account" value="${dto.account}">
			              </td>
			            </tr>
			            </c:forEach>
			            
			          </tbody>
			        </table>
           	  	<hr style="border:solid 2px #378AC4"><br><br>
           	  	
           	  	<div id="result"></div>
           	  <%-- Ajax로 페이지분리
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
		       		
		       		<c:forEach var="dto" items="${list}">
		       		<tr>
		       			<td width="16%">
		       				<input type="text" name=acctype value="${dto.account}" readonly style="width:110px">
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
		       		</c:forEach>
	      	 </table>
		     <i class="icon-caret-right s-20"></i>최근 전화금융사기(보이스피싱)피해가 급증하고 있습니다. 한번 더 확인 후 이체해 주시기 바랍니다.
		     
		       <br>
		       <div align="center">
		          <input type="submit" id="button"  value="잔액이체 및 계좌해지" class="button1 small color">
		       </div>
			--%>

          </div><!-- End contents -->
          
        </div><!-- End horizontal-tabs -->
        
        
      </div><!-- End post-content -->
      
    <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>