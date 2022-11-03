<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title>UpBank | Transfer</title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">

  <!-- Mobile Specific Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <!-- Main Style -->

  
  <!--[if lt IE 9]>
      <script src="js/html5.js"></script>
  <![endif]-->
  
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
 
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
        <h1>이체</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   <!-- <!-- 
     Search Widget
     <div class="widget search">
       <h3 class="title bottom-1">검색</h3>Title Widget
       <form action="#">
         <input type="text" class="text-search" value="Search in blog" onBlur="if(this.value == '') { this.value = 'Search in blog'; }" 
         onfocus="if(this.value == '') { this.value = ''; }" />
         <input type="submit" value="" class="submit-search" />
       </form>
     </div> -->
     <!-- End -->
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">이체</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/transfer.do">이체</a></li>
         <li><a href="${path}/transferList.do">이체결과조회</a></li>
         
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <!-- End -->
     
     
     <!-- Latest Tweets Widget -->
     <div class="widget">
       <h3 class="title bottom-1">
       <i class="icon-headphones s-30"></i>
       고객센터</h3><!-- Title Widget -->
       <p>
          <br>1232-2132<br>
       </p>
     </div>
     <!-- End -->
     
     
     <!-- Video Widget -->
     <div class="widget">
       <h3 class="title bottom-1"></h3><!-- Title Widget -->
       <!-- Youtube Video -->
        <div class="video-wrap widescreen">
        </div><!-- End video wrap -->
        <!-- End Youtube -->
     </div>
     <!-- End -->
   
   </div><!-- End Sidebar Widgets -->
   <!-- Start Posts -->
     <div class="eleven columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1" >당행/다른기관이체</h3><!-- Title Post -->
       <hr>
       <div style="border:1px solid black; padding: 10px; font-size:20px; font-style: ">
       <i class="icon-ok-circle s-25" ></i>안내 및 유의사항<br>
       <br>
       <hr>
       <div style="font-size:12px">
       <i class="icon-caret-right s-20"></i>타행이체시 건별 수수료 500원이 부과됩니다.(당행이체시 면제)<br>
       <i class="icon-caret-right s-20"></i>전일 입금한 타행 자기앞수표의 경우 전산장애 등으로 현금화 시간(12:20)이 지연되는 경우가 있으니, 이체 시 현금화 지연에 따른 불편사항에 대해 양해하여 주시기 바랍니다.
       </div>
       </div>
       <hr>
       <br><br><br>
       	<h5>출금정보</h5>
       	<br>
       	<hr style="border:solid 2px #378AC4">
       	<br>
   <form name="transferForm" action="${path}/transfer2.do" method="post" class="form-elements">
   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   	
       <table class="style color" width="600px">
       		<tr>
       			<th>출금계좌정보</th>
					<td> 
          			<select name="acctype" id="acctype" required>
           			 <option value="">입출금계좌</option>
	                  <c:forEach var="sdto" items="${sList}" varStatus="status">
		                  <option value="${sdto.ACCOUNT}" id="${sdto.ACCOUNT}" title="${sdto.BALANCE}">${sdto.PRODUCT_NAME}<span>&nbsp;:&nbsp;</span>${sdto.ACCOUNT}</option>
	                  </c:forEach>
          			</select>
 					</td>
					<td> 
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
       
       <hr>
       <br><br><br>
       	<h5>입금정보</h5>
       	<br>
       	<hr style="border:solid 2px #378AC4">
       	<br>
       <table class="style color" width="600px">
       		
       		<tr>
       			<th> 입금은행</th>
       			<td >
        			<select name="tf_bank" required>
                      <option value="">은행명을 선택하세요</option>
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
       		</tr>
       		<tr>
       			<th> 입금계좌번호</th>
       			<td>
       				<input type="text" name="tf_sender_acc" placeholder="'-'없이 숫자만 입력" maxlength="20" required/>
       			</td>
       			
       		</tr>
       		<tr>
       			<th>이체금액</th>
       			<td>
       				<input type="number" name="tf_amount" required/>원
       			</td>
       		</tr>
       		<tr>
       			<th>받는통장 메모</th>
       			<td>
       				<input type="text" name="tf_deposit_comment" placeholder="(선택)7자 이내 입력" maxlength="7"/>
       			</td>
       		</tr>
       		<tr>
       			<th>내통장 메모</th>
       			<td>
       				<input type="text" name="tf_sender_comment" placeholder="(선택)7자 이내 입력" maxlength="7"/>
       			</td>
       		</tr>
       </table>
     <i class="icon-caret-right s-20"></i>최근 전화금융사기(보이스피싱)피해가 급증하고 있습니다. 한번 더 확인 후 이체해 주시기 바랍니다.
     
       <br>
       <div align="center">
          <input type="submit" id="button"  value="이체" class="button1 small color">
          <input type="reset" value="초기화"  class="button1 small black">
       </div>
 </form>
       
      <!-- Start main content -->
   <div class="container main-content clearfix">
    <div class="portfolio bottom-3">
    
    <div class="sixteen columns">  
      <div class="title clearfix" id="options">
        <ul id="filters" class="option-set clearfix" data-option-key="filter">

        </ul>
      </div>
    </div> <!-- End options -->
    
    <div class="clearfix"></div>
    
    <div id="contain"> 
    
    <!-- =================================================== -->
    
    </div><!-- End contain-->
    
    </div><!-- End portfolio -->
    
   </div><!-- <<< End Container >>> -->

      
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
  
  </div><!-- End wrap -->
  

    
</body>
</html>