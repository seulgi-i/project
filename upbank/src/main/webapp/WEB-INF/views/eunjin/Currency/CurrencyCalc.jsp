<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>

<title>Upbank | CurrencyCalc</title>

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
	<form name='currencyCalcForm' method='get' action='${path}/CurrencyCalcResult.cr'>
     <table class="style color" width="600px">
   	 <tr>
	 	<td colspan="1" align="center">
	 	원화 : <input type='text' id='won' name='won' size=10 />
	 	</td>
	 	<td colspan="1">
	 	
			<select name='operator' >
			<option value='AED'>아랍에미리트 디르함</option>
			<option value='AUD'>호주 달러</option>
			<option value='BHD'>바레인 디나르</option>
			<option value='BND'>브루나이 달러</option>
			<option value='CAD'>캐나다 달러</option>
			<option value='CHF'>스위스 프랑</option>
			<option value='CNH'>위안화</option>
			<option value='DKK'>덴마아크 크로네</option>
			<option value='EUR'>유로</option>
			<option value='GBP'>영국 파운드</option>
			<option value='HKD'>홍콩 달러</option>
			<option value='IDR'>인도네시아 루피아</option>
			<option value='JPY'>일본 옌</option>
			<option value='KRW'>한국 원</option>
			<option value='KWD'>쿠웨이트 디나르</option>
			<option value='MYR'>말레이지아 링기트</option>
			<option value='NOK'>노르웨이 크로네</option>
			<option value='NZD'>뉴질랜드 달러</option>
			<option value='SAR'>사우디 리얄</option>
			<option value='SEK'>스웨덴 크로나</option>
			<option value='SGD'>싱가포르 달러</option>
			<option value='THB'>태국 바트</option>
			<option value='USD'>미국 달러</option>
			</select>
				</td>
				<td colspan="1">
				<input type='submit' id="cur_input" class="button1 samll color" value='환율 계산' />
				</td>
				</tr>
    	 </table>
    	 </form>
	 </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>