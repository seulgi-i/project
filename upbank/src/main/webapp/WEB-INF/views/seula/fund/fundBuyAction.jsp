<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<title>펀드</title>

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">

</head>
<body>

	<div id="wrap" class="boxed">

		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
		<!-- <<< End Header >>> -->

		<div class="page-title">
			<div class="container clearfix">

				<div class="sixteen columns">
					<h1>펀드</h1>
				</div>

			</div>
			<!-- End Container -->
		</div>
		<!-- End Page title -->

		<!-- Start main content -->
		<div class="container main-content clearfix">


			<!-- Start Sidebar Widgets -->
			<div class="five columns sidebar bottom-3">


     <!-- Categories Widget -->
	<%@ include file="leftBar.jsp"%>
     <!-- End -->


			</div>
			<!-- End Sidebar Widgets -->


			<!-- Start Posts -->
			<div class="sixteen columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">
				<h3 class="title bottom-1">펀드</h3>
				<form name="editForm"  method="post" action="${path}/fundBuyAction.do">
       			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					 <hr class="line bottom-3"></hr>
					      

    
      
		      
				</form>
			      </div><!-- End fields -->
			      
		
				<!-- ==================== End Single Post  ==================== -->



			</div>
			<!-- End Posts -->

			<div class="clearfix"></div>

		</div>
		<!-- <<< End Container >>> -->
						<!-- insert 실패 -->
				<c:if test="${insertCnt == 0}">
					<script type="text/javascript">
						setTimeout(function(){
							var msg='${msg}';
							alert(msg);
							window.location="${path}/etf.do";	
						}, 1000);
						</script>
				</c:if>
				
				<!-- insert 성공 -->
				<c:if test="${insertCnt == 1}">
						<script type="text/javascript">
							setTimeout(function(){
								var msg='${msg}';
								alert(msg);
								window.location="${path}/fundMypage.do";
							}, 1000);
						</script>
				</c:if>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<!-- <<< End Footer >>> -->

	</div>
	<!-- End wrap -->


</body>
</html>