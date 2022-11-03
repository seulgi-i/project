<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.*" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
<title>Upbank | CurrencyInfo</title>

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
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
	      <h3 class="title bottom-1"> 환율 조회 </h3><!-- Title Post -->
	      <div class="post-content">
	      <form name="currencyDateForm" action="${path}/CurrencyInfoDate.cr" method="get">
	   	 	<table class="style color" >
	   	 		<tr>
	   	 			<td colspan="1" align="center">
	   	 			기준일
	   	 			</td>
	   	 			<td colspan="4">
	   	 			<input type="date" class="input" name="cur_date" size="10" placeholder="YYYY/MM/DD">
	   	 			</td>
	   	 			<td colspan="1">
	   	 			<input type="submit" id="cur_input" value="조회" >
	   	 			</td>
	   	 		</tr>
	   	 		<tr>
	   	 			<th>통화명</th>
	   	 			<th>통화코드</th>
	   	 			<th>송금받을때</th>
	   	 			<th>송금보낼때</th>
	   	 			<th>매매기준율</th>
	   	 			<th>장부가격</th>
	   	 		</tr>
	   	 			<c:forEach var="dto" items="${hList }">
		   	 			<c:set var="today" value="${false}" />
	   	 				<c:if test="${dto.locdate == CUR_DATE}">
		   	 				<c:set var="today" value="${true}" />
		   	 			</c:if>
					</c:forEach>
						<c:if test="${today == true}">
							<tr>
		   	 				<td colspan="6" align="center">
		   	 				주말 및 공휴일에는 환율 정보가 제공되지 않습니다.
		   	 				</td>
		   	 			</tr>
						</c:if>
						
						<c:if test="${weekend == 'S'}">
							<tr>
		   	 				<td colspan="6" align="center">
		   	 				주말 및 공휴일에는 환율 정보가 제공되지 않습니다.
		   	 				</td>
		   	 			</tr>
						</c:if>
						
						<c:if test="${today == false}">
							<c:forEach var="dto" items="${list }">
								<tr>
				   	 				<td>${dto.cur_nm }</td>
				   	 				<td>${dto.cur_unit}</td>
				   	 				<td>${dto.ttb}</td>
				   	 				<td>${dto.tts}</td>
				   	 				<td>${dto.deal_bas_r} </td>
				   	 				<td>${dto.bkpr}</td>
				   	 			</tr>
							</c:forEach>
						</c:if>
	   	 	</table>
	   	 	</form>
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== End Single Post  ==================== -->
	   </div><!-- End Posts -->  
	   
   <div class="clearfix"></div>
   </div><!-- <<< End Container >>> -->
   
   	<!-- 풋터 -->
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
	</div><!-- End wrap --> 

</body>
</html>