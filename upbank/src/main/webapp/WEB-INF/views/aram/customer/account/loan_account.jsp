<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title> UpBank 대출 - 대출 계좌 조회</title>
  <script type="text/javascript">

  </script>
</head>
<body>

<c:if test="${param.msg != null}">
	<c:if test="${param.msg != 'null'}">
		<script type="text/javascript">
			var msg = null;
			if("${param.msg}" == "incorrect password") msg = "비밀번호가 일치하지 않습니다."
			else if("${param.msg}" == "not enough balance") msg = "잔고가 충분하지 않습니다."
			alert(msg);
			location.href="${path}/loan_repay.lo";
		</script>
	</c:if>
</c:if>

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
	      <h3 class="title bottom-1">대출 계좌 조회</h3><!-- Title Post -->
	      <div class="post-content">
	   	 	
	   	 	<!-- 계좌 목록 테이블 -->
	   	 	<form class="form-elements" name="loan_apply_result_form" method="post">
			      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<table class="style color">
		          <tbody>
		            <tr>
		              <th>계좌명</th>
		              <th>계좌번호</th>
		              <th>적용 금리</th>
		              <th>잔여 원금</th>
		              <th>잔여 이자</th>
		              <th>대출 실행일</th>
		              <th>만기일</th>
		              <th>상환 현황</th>
		              <th>업무</th>
		            </tr>
		            <c:forEach var="dto" items="${list}">
			            <tr>
			              <td>${dto.accInfo.PRODUCT_NAME}</td>
			              <td>${dto.account}</td>
			              <td>${dto.l_rate}%</td>
			              <td>
					        <fmt:formatNumber value="${dto.l_balance_principal}" pattern="#,###" />원
			              </td>
			              <td>
			              	<fmt:formatNumber value="${-(dto.accInfo.BALANCE)-dto.l_balance_principal}" 
			              		pattern="#,###" />원
			              </td>
			              <td>${dto.l_start_date}</td>
			              <td>${dto.l_end_date}</td>
			              <td>${dto.l_status}</td>
			              <td>
			              	<a href="${path}/SearchDetailTransfer.do?ACCOUNT=${dto.account}" class="button1 small normal" style="font-size:13px; padding:9px">내역조회</a>
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
					<a href="${path}/loan_account.lo?pageNum=${paging.prev}" class="prev-button"><i class="icon-angle-left"></i></a>
				</c:if>
				<c:if test="${paging.startPage <= 10}">
					<a href="#"><i class="icon-angle-left"></i></a>
				</c:if>
				
	          <!-- 페이지 번호 처리 -->
				<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					<c:if test="${num == paging.pageNum}">
						<a href="${path}/loan_account.lo?pageNum=${num}" class="current">${num}</a>
					</c:if>
					<c:if test="${num != paging.pageNum}">
						<a href="${path}/loan_account.lo?pageNum=${num}">${num}</a>
					</c:if>
				</c:forEach>
	          
	          <!-- 다음 버튼 활성화 여부 -->
				<c:if test="${paging.endPage < paging.pageCount}">
					<a href="${path}/loan_account.lo?pageNum=${paging.next}" class="next-button"><i class="icon-angle-right"></i></a>
				</c:if>
				<c:if test="${paging.endPage >= paging.pageCount}">
					<a href="#"><i class="icon-angle-right"></i></a>
				</c:if>
	        </div><!-- End pagination -->
	   	 	
	      </div><!-- End post-content -->
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