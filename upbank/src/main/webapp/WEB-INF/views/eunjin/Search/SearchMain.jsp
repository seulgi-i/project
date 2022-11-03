<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Page left sidebar - Invention | Creative Responsive Theme</title>
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
         <li><a href="${path }/SearchRangeSelect.do">거래내역기간조회</a></li>
         <li><a href="${path }/SleepDisableAcc.do">휴면/해지계좌조회</a></li>
         <li><a href="${path }/SoonEndLoanSearch.do">기일도래계좌조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1">계좌조회</h3><!-- Title Post -->
          		<table class="style color">
		          <tbody valign="middle">
		            <tr>
		              <th>계좌명</th>
		              <th>계좌번호</th>
		              <th>신규일</th>
		              <th>최근거래일<br>/만기일</th>
		              <th>잔액</th>
		              <th>유형</th>
		              <th>업무</th>
		            </tr>
		            <c:forEach var="dto" items="${list }">
		            <tr>
		              <td>${dto.PRODUCT_NAME}</td>
		              <td>${dto.ACCOUNT }</td>
		              <td>${dto.NEW_DATE }</td>
		              <td>${dto.LAST_DATE }</td>
		              <td><fmt:formatNumber value="${dto.BALANCE}" pattern="#,###원"/></td>
		              <td>${dto.ACCOUNT_TYPE}</td>
		              <td>
		              <a href="${path}/SearchDetailTransfer.do?ACCOUNT=${dto.ACCOUNT}" class="button1 small normal">
		              	조회</a>
		              <c:if test="${dto.ACCOUNT_TYPE == '입출금'}">
		              <a href="${path}/transfer.do" class="button1 small color">이체</a>
		              </c:if>
		              </td>
		            </tr>
		            </c:forEach>
		          </tbody>
		        </table>
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