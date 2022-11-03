<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title></title>
<meta name="description"
	content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="images/favicon.ico">

<script type="text/javascript">
$(function(){
	$('#loginalert').click(function(){
			alert("로그인 하세요.");
		});		
});		

	
</script>
<style>
table.style {
    width: 1000px;
    margin-bottom: 10px;
    text-align: left;
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
					<!--  로그인 한 경우  -->
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
			<div class="eleven columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">

					<h3 class="title bottom-1">예금해지/조회 및 이체</h3>
					<hr class="line bottom-3"></hr>
					<!-- Title Post -->
					<form name="depositForm" action="${path}/terminateAction.do" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
					<table class="style color">
				          <tbody>
				         
				            <tr>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">계좌번호</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품이름</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가입일</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">만기일</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">잔액</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">출금계좌</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">출금통장</font></font></th>
				              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">해지</font></font></th>
				            </tr>
				             	   <c:forEach var="dto" items="${list}"><!-- searchDTO -->
				            <tr>
				            
				             <c:if test="${dto.ACCOUNT_TYPE == '예금' || dto.ACCOUNT_TYPE == '적금'}"> <!-- 적금 -->
				              <input type="hidden" name="ACCOUNT_TYPE" value="${dto.ACCOUNT_TYPE}">
				              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.account}</font></font></td>
				              <input type="hidden" name="account" value="${dto.account}"> 
				              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.PRODUCT_NAME}</font></font></td>
				              <input type="hidden" name="PRODUCT_NAME" value="${dto.PRODUCT_NAME}"> 
				              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.NEW_DATE}</font></font></td>
				              <c:if test="${dto.y_end_date != null}">
				              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.y_end_date}</font></font></td>
				              </c:if>
				              
				               <c:if test="${dto.i_end_date != null}">
				              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.i_end_date}</font></font></td>
				              </c:if>
					          <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
					                 <fmt:formatNumber pattern="###,###,###" value="${dto.balance}" />원
					                 </font></font></td>
					           <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.tf_account}</font></font></td>
					           <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.tf_product_name}</font></font></td>
					           <td><input type="submit" id="sumit"  class="button1 small color" value="해지하기"></td>
				        		 </c:if>
				            </tr>
				            </c:forEach>
				           
				             
				          </tbody>
				        </table>
				       
						<br>
						<br>

						<!-- End contents -->
						</form>
				</div>
				<!-- End horizontal-tabs -->

			</div>
		</div>
			</div>
			<!-- ==================== End Single Post  ==================== -->




		<div class="clearfix"></div>

	<!-- <<< End Container >>> -->

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<!-- <<< End Footer >>> -->
	<!-- <<< End Footer >>> -->

	<!-- End wrap -->
</body>
</html>