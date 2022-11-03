<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 대출 신청 결과 조회</title>
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
	      <h3 class="title bottom-1">대출 신청 결과 조회</h3><!-- Title Post -->
		      <form class="form-elements" name="loan_apply_result_form" method="post">
			      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<table class="style color">
		          <tbody>
		            <tr>
		              <th>대출 상품명</th>
		              <th>신청 금액</th>
		              <th>금리</th>
		              <th>기간</th>
		              <th>상환 방식</th>
		              <th>수령 희망 일자</th>
		              <th>신청일</th>
		              <th>승인 여부</th>
		            </tr>
		            <c:forEach var="dto" items="${list}">
			            <tr>
			              <td>${dto.loan_name}</td>
			              <td><fmt:formatNumber value="${dto.l_principal}" pattern="##,###,###" />원</td>
			              <td>${dto.rate_basemoney}%</td>
			              <td>${dto.l_period}년</td>
			              <td>${dto.l_repay}</td>
			              <td>${dto.l_start_date}</td>
			              <td>${dto.l_apply_date}</td>
			              <td>
			              	<c:if test="${dto.l_confirm == 0}"> 승인대기 </c:if>
			              	<c:if test="${dto.l_confirm == 1}"> 승인완료 </c:if>
			              	<c:if test="${dto.l_confirm == -1}"> 승인불가 </c:if>
			              </td>
			            </tr>
		            </c:forEach>
		          </tbody>
		        </table>
		      </form>
		      
		      
	     	<!-- 게시판 번호 시작 -->
	     	<div class="pagination" style="justify-content:center;">
	     		<!-- 페이징 처리 -->
				<!-- 이전 버튼 활성화 여부 -->
	     		<c:if test="${paging.startPage > 10}">
					<a href="${path}/loan_join_result.lo?pageNum=${paging.prev}" class="prev-button"><i class="icon-angle-left"></i></a>
				</c:if>
				<c:if test="${paging.startPage <= 10}">
					<a href="#"><i class="icon-angle-left"></i></a>
				</c:if>
				
	          <!-- 페이지 번호 처리 -->
				<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					<c:if test="${num == paging.pageNum}">
						<a href="${path}/loan_join_result.lo?pageNum=${num}" class="current">${num}</a>
					</c:if>
					<c:if test="${num != paging.pageNum}">
						<a href="${path}/loan_join_result.lo?pageNum=${num}">${num}</a>
					</c:if>
				</c:forEach>
	          
	          <!-- 다음 버튼 활성화 여부 -->
				<c:if test="${paging.endPage < paging.pageCount}">
					<a href="${path}/loan_join_result.lo?pageNum=${paging.next}" class="next-button"><i class="icon-angle-right"></i></a>
				</c:if>
				<c:if test="${paging.endPage >= paging.pageCount}">
					<a href="#"><i class="icon-angle-right"></i></a>
				</c:if>
	        </div><!-- End pagination -->
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