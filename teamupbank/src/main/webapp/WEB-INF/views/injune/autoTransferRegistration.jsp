<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <h1>자동이체</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     <!-- Search Widget -->
     <div class="widget search">
       <h3 class="title bottom-1">Search</h3><!-- Title Widget -->
       <form action="#">
         <input type="text" class="text-search" value="Search in blog" onBlur="if(this.value == '') { this.value = 'Search in blog'; }" 
         onfocus="if(this.value == 'Search in blog') { this.value = ''; }" />
         <input type="submit" value="" class="submit-search" />
       </form>
     </div>
     <!-- End -->
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">자동이체</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/autoTransfer.do">자동이체</a></li>
         <li><a href="${path}/autoTransferRegistration.do">자동이체등록</a></li>
         <li><a href="${path}/autoTransferList.do">자동이체결과조회</a></li>
         
         
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
      
      <h3 class="title bottom-1"></h3><!-- Title Post -->
       
      <!-- Start main content -->
   <div class="container main-content clearfix">
    
    <div class="portfolio bottom-3">
    
    <div class="sixteen columns">  
      <div class="title clearfix" id="options">
        <ul id="filters" class="option-set clearfix" data-option-key="filter">
  <img src="${path}/resources/images/img/portfolio/자동이체 등록 신청.PNG">
        </ul>
      </div>
    </div> <!-- End options -->
    
    <div class="clearfix"></div>
    
    <div id="contain"> 
    
    <!-- =================================================== -->
     

      <!-- item 3 -->
      <div class="four columns item element-4 Web Animation" data-categories="Web Animation">
         <a href="${path}/depositList.do">
          <div class="img-caption">
          <div class="desc"><h3>예금 더 알아보기</h3><p>upBank와 함께하세요</p><span><i class="icon-search"></i></span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
      
      <!-- item 4 -->
      <div class="four columns item element-4 Logo Photography" data-categories="Logo Photography"style="margin-top: 0;">
         <a href="${path}/installmentList.do">
          <img src="${path}/resources/images/img/portfolio/doubleup_20220811.png" alt="" class="pic" />
          <div class="img-caption">
          <div class="desc"><h3>적금 더 알아보기</h3><p>upBank와 함께하세요</p><span><i class="icon-search"></i></span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
    
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