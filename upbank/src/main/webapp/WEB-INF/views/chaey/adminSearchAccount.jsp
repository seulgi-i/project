<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
 <meta charset="utf-8">
<title> 관리자 - 계좌조회 페이지 </title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
 $(function(){
	 	$("input[name^='account_btn']").click(function(){
			
			var param = {
					"searchType": $(this).next().val(),
					"searchValue": $(this).prev().val(),
				}
					 
			$.ajax({
				url: '${path}/adminSearchAction.ad?${_csrf.parameterName}=${_csrf.token}',
				type: 'post',
				data: param,
				success: function(data){
					$('#content1').html(data);	
				},
				error: function(){
					alert('일치하는 정보가 없습니다. 다시 확인해주세요');
				}
			})
		});
	});
 
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() { 
	var data = google.visualization.arrayToDataTable([
			['year', '정상', '거래중지', '휴면', '해지'],
			${r}
		]);
	var options = {
			title : '계좌생성연도별 계좌 상태',
			vAxis: {title: 'Accounts'},
			hAxis: {title: 'Year'}, 
			seriesType: 'bars',
			series: {5: {type: 'line'}}
		};
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
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
       <h3 class="title bottom-1">계좌 관리</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/adminSearchAccount.ad">계좌정보조회</a></li>
         <li><a href="${path}/adminChangeAccount.ad">계좌상태 변경</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="eleven columns bottom-3" style="width:70%" >
     
     <form name="adminSearchAccount_form" method="post" action="${path}/adminSearchAction.ad}">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1">계좌조회</h3><!-- Title Post -->
       <div class="container main-content clearfix" style="width:95%">
       
        <div id="horizontal-tabs" class="top-3">
          <ul class="tabs">
        	<li id="tab1">종합정보</li>
            <li id="tab2">예금주명</li>
            <li id="tab3">계좌번호</li>
            <li id="tab4">회원ID</li>
            <li id="tab5">계좌종류</li>
            <li id="tab6">기일도래계좌</li>
        	<li id="tab7">계좌상태</li>
          </ul>
          
          
          <div class="contents">
          
           <!-- 종합정보 조회 -->
          <div id="content1" class="tabscontent">
       		<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="10%">총고객수</th>
	              <th width="10%">가입ID</th>
	              <th width="13%">총개설계좌</th>
	              <th width="13%">휴면계좌</th>
	              <th width="11%">당일신규</th>
	              <th width="13%">당일이용객</th>
	              <!-- <th width="15%">당일증감액</th> 이체내역테이블 나오면 추가-->
	              <th width="15%">총잔액(단위:만원)</th>
	            </tr>
	            
	            <!-- 종합 탭일때 종합정보 받아오기 -->
	            <tr>
	              <td>${idto.cnt_account_name}</td>
	              <td>${idto.cnt_id }</td>
	              <td>${idto.cnt_account }</td>
	              <td>${idto.cnt_account_sleep }</td>
	              <td>${idto.cnt_account_new }</td>
	              <td>${idto.cnt_account_name_today }</td>
	              <%-- <td>${idto.sum_balance_change }</td> --%>
	              <td>${idto.sum_balance }</td>
	            </tr>
	            
	        </table><br>
          </div> 
          
          
          <!-- 예금주명 조회 -->
          <div id="content2" class="tabscontent">
       		<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	          </tbody>
	        </table>
	            <!-- ajax출력위치 -->
	        <br>
	      <!-- 버튼의 prev()값 : 검색어(searchValue) -->
          <input type="text" style="margin-auto" id="account_name" name="account_name">
          <input type="button" id="account_btn_name" name="account_btn_name" value="조회">
          <input type="hidden" id="SearchType" value="account_name">
          <!-- 버튼의 next()값 : 검색타입(searchType):이름,계좌 등등.. -->
          </div> 
         
          
          <!-- 계좌번호 조회 -->
          <div id="content3" class="tabscontent">
         	 <table class="style color">
	           <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	            <!-- ajax출력위치 -->
	          </tbody>
	        </table>
	        <br>
	          <input type="text" style="margin-auto" id="account" name="account">
	          <input type="button" id="account_btn_account" name="account_btn_account" value="조회">
	          <input type="hidden" id="SearchType" value="a.account">
          </div>
          
          
          <!-- 회원ID조회  -->
          <div id="content4" class="tabscontent">
          	<table class="style color">
	           <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
				<!-- ajax출력위치 -->
	            <div id="result_id">
	            </div>

	          </tbody>
	        </table>
	        <br>
	        <input type="text" style="margin-auto" id="id" name="id">
	        <input type="button" id="account_btn_id" name="account_btn_id" value="조회">
	        <input type="hidden" id="SearchType" value="a.id">
	        
          </div>  
          
          <!-- 계좌종류 조회 -->
          <div id="content5" class="tabscontent">
       	   	<table class="style color">
	           <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
				<!-- ajax출력위치 -->
	          </tbody>
	        </table>
	        <br>
	        <input type="text" style="margin-auto" id="account_type" name="account_type">
	          <input type="button" id="account_btn_type" name="account_btn_type" value="조회">
	          <input type="hidden" id="SearchType" value="account_type">
          </div>  
          
          
          <!-- 기일도래/만기 -->
          <div id="content6" class="tabscontent">
          	<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	            <!-- ajax출력위치 -->
	            <div id="result_mature">
	            </div>
	            
	          </tbody>
	        </table>
          	<br>
          	<input type="text" style="margin-auto" id="account_mature" name="account_mature">
	          <input type="button" id="account_btn_mature" name="account_btn_mature" value="조회">
	          <input type="hidden" id="SearchType" value="account_mature">
          </div>  
          
          
          <!-- 계좌상태 조회 -->
          <div id="content7" class="tabscontent">
          	<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="13%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="12%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	            <!-- ajax출력위치 -->
	            <div id="result_state">
	            </div>
	            
	          </tbody>
	        </table>
          	<br>
          	<input type="text" style="margin-auto" id="account_state" name="account_state">
	          <input type="button" id="account_btn_state" name="account_btn_state" value="조회">
	          <input type="hidden" id="SearchType" value="account_state">
          </div> 
          
          </div><!-- End contents -->
          
        </div><!-- End horizontal-tabs -->
        
        
      </div><!-- End post-content -->
      
    <!-- ==================== End Single Post  ==================== -->
    
    <div id="chart_div" style="width:900px; height: 500px;"></div>
     
   </div><!-- End Posts -->  
   </form>
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   </div>
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>