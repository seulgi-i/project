<%@ page session="false"%>
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

<title>공지사항</title>


<meta name="description"
   content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">


<link rel="shortcut icon" href="images/favicon.ico">


<script type="text/javascript">
	   // window.onload = function() {
		//alert("SELECT * FROM notice_tbl	WHERE n_show = 'y'");
	//};
	  
</script>

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">

</head>
<body>

	<div id="wrap" class="boxed">
		<header >
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
						<li><a href="cnsltInsert.do">상담신청</a></li>
						<li><a href="cnslt.do">상담내역</a></li>
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
			<div class="sixteen columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">
				<form method="post" class="form-elements" id="insertForm" name="insertForm" action="${path}/noticeInsertAction.do">
       			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div>
						<h3 class="title bottom-1">공지사항</h3>

						<hr class="line bottom-3"></hr>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col" width="10%;">no</th>
									<th scope="col" width="70%;">제목</th>
									<th scope="col" width="10%;">조회수</th>
									<th scope="col" width="10%;">작성일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<th scope="row">${dto.n_No}</th>
									<td>
									<a href="${path}/noticeDetail.do?n_No=${dto.n_No}">
									${dto.n_title}
									</a>
									</td>
									<td>${dto.n_readCnt}</td>
									<td>${dto.n_regDate}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div  style=" display: flex; justify-content: center; margin-top:20px; margin-bottom:20px;">
						  <input type="button" style="color:#ffffff;" value="글쓰기" class="button small color"  onclick="window.location='${path}/noticeInsert.do'">
						</div>
					</div>
					
					<!-- 페이징 -->
					<div class="pagination"  style="justify-content:center;">
					<!-- 이전 버튼 활성화 여부 -->
					 <c:if test="${paging.startPage > 10 }">
			          <a href="${path}/notice.do?pageNum=${paging.prev}" class="prev-button"><i class="icon-angle-left"></i></a>
			         </c:if>
			         
			          <!-- 페이지 번호 처리 -->
			          <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			          	 <a href="${path}/notice.do?pageNum=${num}" class="current">${num}</a>
			          </c:forEach>
			          
			          <!-- 다음 버튼 활성화 여부 -->
			          <c:if test="${paging.endPage < paging.pageCount}">
			          <a href="${path}/notice.do?pageNum=${paging.next}" class="next-button"><i class="icon-angle-right"></i></a>
			          </c:if>  
			        </div>
								
					<!-- 페이징 -->
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

	</div>
	<!-- End wrap -->


</body>
</html>