<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 상품&가입</title>
  <script type="text/javascript">
  	function loan_join(loan_num) {
  		if(${sessionScope.customerID != null}){
  			window.location='${path}/loan_join.lo?loan_num=' + loan_num;
		} else {
			window.location='${path}/login.do';
		}
  	}
  </script>
</head>
<body>

	<div id="wrap" class="boxed">
	  
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
		</header><!-- <<< End Header >>> -->
	   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>대출</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
		<!-- Start Sidebar Widgets -->
		<div class="five columns sidebar bottom-3">
			<%@ include file="/WEB-INF/views/aram/customer/loan_sidebar.jsp" %>
		</div><!-- End Sidebar Widgets -->
		
	   <!-- Start Posts -->
	     <div class="sixteen columns bottom-3">
	     
	      <!-- ==================== Single Post ==================== -->
	      <div class="post single style-1">
		      <h3 class="title bottom-1">상품&가입</h3><!-- Title Post -->
		      <hr class="line bottom-3"></hr>
		     
		     <c:forEach var="dto" items="${list}">
		     	<div style="display:flex;">
			     <div class="eight columns bottom-3" STYLE="MARGIN-LEFT: 34px;">
					<h3 class="title bottom-2">${dto.loan_name}</h3>
					<div class="eight columns bottom-3" style="margin: 0; width: 800;">
						<p>${dto.loan_summary}</p>
						<p>
							<br>최고 
							<span style="font-size: 30px; color:#1E82FF;">
								<c:if test="${dto.loan_limit >= 100000000}">	<!-- 일억원 이상 -->
						           	<strong><fmt:formatNumber value="${dto.loan_limit/100000000}" pattern="##,###,###" />억</strong>
	       						</c:if>
								<c:if test="${dto.loan_limit >= 10000000 && dto.loan_limit < 100000000}">	<!-- 천만원 이상 -->
						           	<strong><fmt:formatNumber value="${dto.loan_limit/10000000}" pattern="##,###,###" />천만</strong>
	       						</c:if>
	       						<c:if test="${dto.loan_limit >= 1000000 && dto.loan_limit < 10000000}">	<!-- 백만원 이상 -->
						           	<strong><fmt:formatNumber value="${dto.loan_limit/1000000}" pattern="##,###,###" />백만</strong>
	       						</c:if>
	       						<c:if test="${dto.loan_limit >= 100000 && dto.loan_limit < 1000000}">	<!-- 십만원 이상 -->
						           	<strong><fmt:formatNumber value="${dto.loan_limit/100000}" pattern="##,###,###" />십만</strong>
	       						</c:if>
	       						<c:if test="${dto.loan_limit < 100000}">	<!-- 만원 이상 -->
						           	<strong><fmt:formatNumber value="${dto.loan_limit/10000}" pattern="##,###,###" />만</strong>
	       						</c:if>
       						</span> 원
						</p>
					</div>
				</div>
				<div style="display:flex; align-items:flex-end;">
					<input type="button" class="button1 small color" value="상세보기" onclick="window.location='${path}/loan_product_detail.lo?loan_num=${dto.loan_num}'">
					<input type="button" class="button1 small color" id="loan_join" value="가입하기" onclick="loan_join(${dto.loan_num});">
				</div>
	     	</div>
				<hr class="line bottom-3"></hr>
	     	</c:forEach>
	     	
	     	<!-- 게시판 번호 시작 -->
	     	<div class="pagination" style="justify-content:center;">
	     		<!-- 페이징 처리 -->
				<!-- 이전 버튼 활성화 여부 -->
	     		<c:if test="${paging.startPage > 10}">
					<a href="${path}/loan_product.lo?pageNum=${paging.prev}" class="prev-button"><i class="icon-angle-left"></i></a>
				</c:if>
				<c:if test="${paging.startPage <= 10}">
					<a href="#"><i class="icon-angle-left"></i></a>
				</c:if>
				
	          <!-- 페이지 번호 처리 -->
				<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					<c:if test="${num == paging.pageNum}">
						<a href="${path}/loan_product.lo?pageNum=${num}" class="current">${num}</a>
					</c:if>
					<c:if test="${num != paging.pageNum}">
						<a href="${path}/loan_product.lo?pageNum=${num}">${num}</a>
					</c:if>
				</c:forEach>
	          
	          <!-- 다음 버튼 활성화 여부 -->
				<c:if test="${paging.endPage < paging.pageCount}">
					<a href="${path}/loan_product.lo?pageNum=${paging.next}" class="next-button"><i class="icon-angle-right"></i></a>
				</c:if>
				<c:if test="${paging.endPage >= paging.pageCount}">
					<a href="#"><i class="icon-angle-right"></i></a>
				</c:if>
	        </div><!-- End pagination -->
	      </div><!-- End post-content -->
	     </div> 
	     <!-- ==================== End Single Post  ==================== -->
	   </div><!-- End container -->  
	   
   <div class="clearfix"></div>
   <footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
   </div><!-- End wrap -->
  
</body>
</html>