<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

  <title>공지사항</title>
 
   <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->

  <script type="text/javascript">
  </script>
  
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>고객센터</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">고객센터</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="notice.do">공지사항</a></li>
         <li><a href="faq.do">자주하는질문</a></li>
		<li><a href="cnsltInsert.do">상담신청</a></li>
		<li><a href="cnslt.do">상담내역</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <div class="widget" style="margin-top:100px">
     <li style="text-indent: 1px;"><i class="icon-comments-alt s-20 color"></i>고객센터</li>
       <!-- Title Widget -->
       <p style="text-indent: 5px;">1588-1234</p>
       <p style="text-indent: 5px;">1599-1234</p>
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
       <div class="post single style-1">
		<form method="post" class="form-elements" id="insertForm" name="insertForm" action="">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      
      <h3 class="title bottom-1" style="background:#f8f9fb;padding: 10px 20px 5px 20px; border-bottom: 1px solid #e1e1e1; border-top:1px solid #555;
      display: flex; justify-content: space-between;">
      	제목 ${dto.n_title}<br>
      	<span style="font-size:13px;">조회수 ${dto.n_readCnt}&nbsp;&nbsp;&nbsp;&nbsp;작성일 ${dto.n_regDate}</span>
      	</h3><!-- Title Post -->
       <hr >
      <div class="post-content" style="padding: 10px 5px 40px 5px;">
        <p>
        ${dto.n_content}
        </p>
        
      </div><!-- End post-content -->
		  <div  style=" display: flex; justify-content: center; margin-top:20px;">
		  
		  <input type="button" style="color:#ffffff;" value="수정" class="button small color" onclick="window.location='${path}/noticeUpdatePage.do?n_No='+${dto.n_No}">
		  <input type="button" style="color:#ffffff;" value="삭제" class="button small color" onclick="window.location='${path}/noticeDeleteAction.do?n_No='+${dto.n_No}">
          <input type="button" style="color:#ffffff;" value="목록" class="button small color" onclick="window.location='${path}/notice.do'">
		  </div>
      </form>
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   

   
   <footer>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>