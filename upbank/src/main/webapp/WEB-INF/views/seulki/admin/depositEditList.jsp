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
					<h1>예금</h1>
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
					<h3 class="title bottom-1">상품/가입</h3>
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

					<h3 class="title bottom-1">예금 상품&가입</h3>
					<hr class="line bottom-3"></hr>
					<!-- Title Post -->
					<form name="depositForm" method="post" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
						<c:forEach var="dto" items="${list}">
							<div class="eight columns bottom-3" STYLE="MARGIN-LEFT: 34px;">
								<h3 class="title bottom-2">${dto.y_name}</h3>
								<div class="eight columns bottom-3" style="margin: 0;width: 800;">
									<p>${dto.y_summary}</p>
									<br>최고 연 <strong><span style="font-size: 30px; color:#1E82FF;">${dto.rate}%</span></strong><span style="font-size: 15px; color:grey;">&nbsp (${dto.y_max_date}개월)</span>
									</pre>
									</span>
								</div>
							</div>
							<input type="button" style="margin-top: 100;" class="button1 small color"value="수정하기"onclick="window.location='${path}/depositDetail.do?y_name=${dto.y_name}'">
							<input type="button" class="button1 small color"value="삭제하기"onclick="window.location='${path}/depositDeleteAction.do?y_name=${dto.y_name}'">

							<br>
							<br>
							<hr class="line bottom-3"></hr>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>


	<div class="clearfix"></div>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<!-- <<< End Footer >>> -->

</body>
</html>