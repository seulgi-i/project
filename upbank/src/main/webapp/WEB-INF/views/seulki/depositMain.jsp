<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title>Page left sidebar - Invention | Creative Responsive Theme</title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">

  <!-- Mobile Specific Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <link rel="shortcut icon" href="images/favicon.ico">
 <script type="text/javascript">
$(function(){
	$('#loginalert').click(function(){
			alert("로그인 하세요.");
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
        <h1>예금</h1>
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
       <h3 class="title bottom-1">예금/적금</h3><!-- Title Widget -->
       <ul class="arrow-list">
					<c:if test="${sessionScope.customerID != null && sessionScope.customerID != 'admin'}">
		      		 <li><a href="${path}/depositMain.do">메인</a></li>
			         <li><a href="${path}/depositList.do">예금 상품/가입</a></li>
			         <li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
			         <li><a href="${path}/terminateList.do">가입상품조회/해지</a></li>
					</c:if>
			        <!--  로그인 안 한 경우-->
					<c:if test="${sessionScope.customerID == null }">
					 <li><a href="${path}/depositMain.do">메인</a></li>
			         <li><a href="${path}/depositList.do">예금 상품/가입</a></li>
			         <li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
			         <li><a href=""id="loginalert">가입상품조회/해지</a></li>
					</c:if> 
       </ul><!-- End arrow-list -->
     </div>
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
      
      <h3 class="title bottom-1">손님들이 선택하신, 이 상품 어떠세요?</h3><!-- Title Post -->
       
      <!-- Start main content -->
   <div class="container main-content clearfix">
    
    <div class="portfolio bottom-3">
    
    <div class="sixteen columns">  
      <div class="title clearfix" id="options">
        <ul id="filters" class="option-set clearfix" data-option-key="filter">
        <li><a href="#filter" data-option-value="*" class="selected">All</a></li>
        <li><a href="#filter" data-option-value=".Web">예금</a></li>
        <li><a href="#filter" data-option-value=".Photography">적금</a></li>
        </ul>
      </div>
    </div> <!-- End options -->
    
    <div class="clearfix"></div>
    
    <div id="contain"> 
    
    <!-- =================================================== -->
     

      <!-- item 3 -->
      <div class="four columns item element-4 Web Animation" data-categories="Web Animation">
         <a href="${path}/depositList.do">
          <img src="${path}/resources/images/img/portfolio/hana_saving.png" alt="" class="pic" />
          <div class="img-caption">
          <div class="desc"><h3>예금 더 알아보기</h3><p>upBank와 함께하세요</p><span><i class="icon-search"></i></span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
      
      <!-- item 4 -->
      <div class="four columns item element-4 Logo Photography" data-categories="Logo Photography"style="margin-top: 0;">
         <a href="${path}/inssvnList.do">
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