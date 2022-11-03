<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<title>상담센터</title>

<script type="text/javascript">
	    window.onload = function() {
		alert("SELECT * FROM consult_tbl WHERE user_id = 'hong')");
	};
</script>
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
					<h1>고객센터</h1>
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
				<div class="widget categories">
					<h3 class="title bottom-1">고객센터</h3>
					<!-- Title Widget -->
					<ul class="arrow-list">
						<li><a href="notice.do">공지사항</a></li>
						<li><a href="faq.do">자주하는질문</a></li>
						<li><a href="consult.do">상담신청</a></li>
						<li><a href="cnsltList.do">상담내역</a></li>
					</ul>
					<!-- End arrow-list -->
				</div>
				<!-- End -->

				<!-- Text Widget -->
				<div class="widget" style="margin-top: 100px">
					<li style="text-indent: 1px;"><i
						class="icon-comments-alt s-20 color"></i>고객센터</li>
					<!-- Title Widget -->
					<p style="text-indent: 5px;">1588-1234</p>
					<p style="text-indent: 5px;">1599-1234</p>
				</div>
				<!-- End -->



			</div>
			<!-- End Sidebar Widgets -->


			<!-- Start Posts -->
			<div class="eleven columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">

						<h3 class="title bottom-1">상담내역</h3>

						<hr class="line bottom-3"></hr>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">First</th>
									<th scope="col">Last</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td colspan="2">Larry the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
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

	</div>
	<!-- End wrap -->


</body>
</html>