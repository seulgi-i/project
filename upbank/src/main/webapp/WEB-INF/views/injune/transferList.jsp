<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title>Page left sidebar - Invention | Creative Responsive Theme</title>
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
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1"></h3><!-- Title Post -->
       
      <!-- Start main content -->
    <h3 class="title bottom-1">이체결과조회</h3><!-- Title Post -->
          		<table class="style color" >
		          <tbody valign="middle">
		            <tr>
		              <th width:10%>계좌번호</th>
		              <th>받는사람 계좌</th>
		              <th>받는사람 은행</th>
		              <th>금액</th>
		              <th>입출금날짜</th>
		              <th>보낸사람</th>
		              <th>받는사람</th>
		              <th>수수료</th>
		            </tr>
		            <c:forEach var="dto" items="${list }">
		            <tr>
		              <td>${dto.ACCOUNT}</td>
		              <td>${dto.tf_sender_acc}</td>
		              <td>${dto.tf_bank }</td>
		              <td><fmt:formatNumber value="${dto.tf_amount}" type="number"/>원</td>
		              <td>${dto.tf_date }</td>
		              <td>${dto.tf_sender_comment }</td>
		              <td>${dto.tf_deposit_comment }</td>
		              <td>${dto.tf_charges }</td>
		            </tr>
		            </c:forEach>
		          </tbody>
		        </table>
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