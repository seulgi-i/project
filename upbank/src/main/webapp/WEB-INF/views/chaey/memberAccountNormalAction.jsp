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
     
	<div class="sixteen columns bottom-3">
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
				
				<c:if test="${insertCnt == 0 }">
					<table class="style" width="800px">
					<tr>
						<td>
							<!-- ========================= Big Info Box ========================= -->
						       <div class="sixteen columns bottom-3">
						        <h3 class="title bottom-2">오류</h3>
						        
						        <div class="qoute">
						          <div class="eleven columns omega">
						            <h4>계좌 정상화에 실패했습니다.</h4>
						            <p>계좌번호를 다시 확인해 주세요.</p>
						          </div>
						          <div class="four columns alpha"><a href="${path}/memberAccountList_stopped.do" class="button1 medium black">이전 화면</a></div>
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

				<c:if test="${insertCnt == 1 }">
				  <table class="style" width="800px">
					<tr>
						<td>
							<!-- ========================= Big Info Box ========================= -->
						       <div class="sixteen columns bottom-3">
						        <h3 class="title bottom-2">계좌정상화 성공</h3>
						        
						        <div class="qoute">
						          <div class="eleven columns omega">
						            <h4>계좌 정상화에 성공하였습니다.</h4>
						          </div>
						         <div class="four columns alpha"><a href="${path}/memberAccountList_stopped.do" class="button1 medium color">이전 화면</a></div>
						        </div>
						        
						       </div><!-- End column -->
       						<!-- ============================ End ============================ -->
						</td>
					</tr>
					</table>
				</c:if>
   
   <div class="clearfix"></div>
    </div>
    </div>
   </div><!-- <<< End Container >>> -->
   
   <footer>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
  
  </div><!-- End wrap -->
  

    
</body>
</html>