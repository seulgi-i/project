<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>UpBank | Account Canceld</title>

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
           	  
           	  	<h5> 거래중지 계좌목록</h5>
           	  	<hr style="border:solid 2px #378AC4">
		       		<table class="style color">
			          <tbody valign="middle">
			            <tr>
			              <th width="14%">계좌번호</th>
			              <th width="12%">계좌종류</th>
			              <th width="12%">계좌상태</th>
			              <th width="14%">신규일</th>
			              <th width="14%">해지일</th>
			              <th width="14%">통장잔고</th>
			              
			            </tr>
			            
			            <c:forEach var="dto" items="${list}">
			            <tr>
			              <td>${dto.account }</td>
			              <td>${dto.account_type}</td>
			              <td>${dto.account_state }</td>
			              <td>${dto.new_date }</td>
			              <td>${dto.last_date }</td>
			              <td>${dto.balance }</td>
			            </tr>
			            </c:forEach>
			            
			          </tbody>
			        </table>
           	  	<hr style="border:solid 2px #378AC4"><br><br>
           	  	
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