<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>Page left sidebar - Invention | Creative Responsive Theme</title>
<meta name="description"
	content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">


<link rel="shortcut icon" href="images/favicon.ico">


<script type="text/javascript">
	
</script>
<style>
.button.small {
	margin-top: 117px;
}

</style>
</head>
<body>

	<div id="wrap" class="boxed">

		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
		<!-- <<< End Header >>> -->
		<!-- <<< End Header >>> -->

		<div class="page-title">
			<div class="container clearfix">

				<div class="sixteen columns">
					<h1>적금</h1>
				</div>

			</div>
			<!-- End Container -->
		</div>
		<!-- End Page title -->

		<!-- Start main content -->
		<div class="container main-content clearfix">
			<!-- Start Sidebar Widgets -->
			<div class="five columns sidebar bottom-3">

				<!-- Search Widget -->
				<div class="widget search">
					<h3 class="title bottom-1">Search</h3>
					<!-- Title Widget -->
					<form action="#">
						<input type="text" class="text-search" value="Search in blog"
							onBlur="if(this.value == '') { this.value = 'Search in blog'; }"
							onfocus="if(this.value == 'Search in blog') { this.value = ''; }" />
						<input type="submit" value="" class="submit-search" />
					</form>
				</div>
				<!-- End -->

				<!-- Categories Widget -->
				<div class="widget categories">
					<h3 class="title bottom-1">admin</h3>
					<!-- Title Widget -->
					<ul class="arrow-list">
			         <li><a href="${path}/depositAdd.do">예금상품추가</a></li>
			         <li><a href="${path}/depositEdit.do">예금상품관리</a></li>
			         <li><a href="${path}/inssvnAdd.do">적금상품추가</a></li>
			         <li><a href="${path}/inssvnEdit.do">적금상품관리</a></li>
			         <li><a href="${path}/depositList.do">메인</a></li>
					</ul>
					<!-- End arrow-list -->
				</div>
				<!-- End -->

				<!-- Text Widget -->
				<div class="widget">
					<h3 class="title bottom-1">고객센터</h3>
					<!-- Title Widget -->
					<p></p>
				</div>
				<!-- End -->
			</div>
			<!-- End Sidebar Widgets -->
			<!-- Start Posts -->
			<div class="sixteen columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">

					<h3 class="title bottom-1">적금 상품&가입</h3>
					<hr class="line bottom-3"></hr>
					<!-- Title Post -->
					<form name="inssvnForm" method="post" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
						<c:forEach var="dto" items="${list}">
							<div class="eight columns bottom-3" STYLE="MARGIN-LEFT: 34px;">
								<h3 class="title bottom-2">${dto.i_name}</h3>
								<div class="eight columns bottom-3" style="margin: 0;width: 800;">
									<p>${dto.i_summary}</p>
									<br>최고 연 <strong><span style="font-size: 30px; color:#1E82FF;">${dto.rate}%</span></strong><span style="font-size: 15px; color:grey;">&nbsp (${dto.i_max_date}개월)</span>
									</pre>
									</span>
								</div>
							</div>
							<input type="button" style="margin-top: 100;" class="button1 small color"value="수정하기"onclick="window.location='${path}/inssvnEditDetail.do?i_name=${dto.i_name}'">
							<input type="button" class="button1 small color"value="삭제하기"onclick="window.location='${path}/inssvnDeleteAction.do?i_name=${dto.i_name}'">

							<br>
							<br>
							<hr class="line bottom-3"></hr>
						</c:forEach>
						<%-- <div class="eight columns bottom-3" style="width:700px">
        
        <div id="horizontal-tabs" class="two style2">
        
          <ul class="tabs" style="margin-left: 180px;">
            <li id="tab_two1" class="current">상품안내</li>
            <li id="tab_two2">금리 및 이율</li>
            <li id="tab_two3">유의사항</li>
          </ul>
          <div class="contents">
          
          <div id="content_two1" class="tabscontent" style="display: block;">
          <p>
          <strong> </strong>
          <img src="${path}/resources/images/img/portfolio/info.png" alt=""class="pic" />
          
          </p>
          </div> 
          
          <div id="content_two2" class="tabscontent">
          <p>
          <strong>2 - </strong>
          Lorem Ipsum is simply dummy text of the printing and Lorem typesetting industry. Lorem Ipsum has been the industry's dummy standard  
          text ever since the 1500s, when an unknown printer took a galley of type.
          <br><br>
          Lorem Ipsum is simply dummy text of the printing and Lorem typesetting industry. Lorem Ipsum has been the industry's dummy standard  
          text ever since the 1500s, when
          </p>
          </div> 
          
          <div id="content_two3" class="tabscontent">
          <p>
          <strong>3 - </strong>
          Lorem Ipsum is simply dummy text of the printing and Lorem typesetting industry. Lorem Ipsum has been the industry's dummy standard  
          text ever since the 1500s, when an unknown printer took a galley of type.
          <br><br>
          Lorem Ipsum is simply dummy text of the printing and Lorem typesetting industry. Lorem Ipsum has been the industry's dummy standard  
          text ever since the 1500s, when
          </p>
          </div>  
 
          
         </div>
          </div>           
          
          </div><!-- End contents --> --%>
				</div>
				<!-- End horizontal-tabs -->

			</div>
		</div>








		</form>
	</div>
	<!-- ==================== End Single Post  ==================== -->



	</div>
	<!-- End Posts -->

	<div class="clearfix"></div>

	</div>
	<!-- <<< End Container >>> -->

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<!-- <<< End Footer >>> -->
	<!-- <<< End Footer >>> -->

	</div>
	<!-- End wrap -->
</body>
</html>