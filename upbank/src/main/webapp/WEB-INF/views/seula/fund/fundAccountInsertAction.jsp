<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>UPBANK | 펀드 계좌 개설</title>

<script>
   
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
         <h1>조회</h1>
       </div>
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
     <!-- Categories Widget -->
	<%@ include file="leftBar.jsp"%>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1">신규 펀드계좌 개설</h3><!-- Title Post -->
       <hr class="line bottom-3"></hr>
        <form name="accDefForm" action="${path}/SearchMain.do" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	      		
      		<!-- 가입 실패 -->
			<c:if test="${insertCnt == 0}">
				<script type="text/javascript">
					alert("비밀번호가 맞지 않습니다.");
					window.location="${path}/AccDefaultInsert.do"
				</script>
			</c:if>
			
			<!-- 이미 계좌 있음 -->
			<c:if test="${insertCnt == -1}">
				<script type="text/javascript">
					alert("이미 개설된 상품입니다.");
					window.location="${path}/SearchMain.do"
				</script>
			</c:if>
				
			<!-- 가입 성공 -->
			<c:if test="${insertCnt == 1}">
				<script type="text/javascript">
					alert("[upBank 종합 펀드 통장]가입을 축하드립니다!");
				</script>
				
	      		<h1>upBank 종합 펀드 통장</h1>
	      		<table class="style color">
		          <tbody valign="middle">
		            <tr>
		              <th>계좌명</th>
		              <th>계좌번호</th>
		              <th>신규일</th>
		              <th>최근거래일<br>/만기일</th>
		              <th>잔액</th>
		              <th>업무</th>
		            </tr>
		            <tr>
		              <td>${dto.PRODUCT_NAME }</td>
		              <td>${dto.ACCOUNT }</td>
		              <td>${dto.NEW_DATE }</td>
		              <td>${dto.LAST_DATE }</td>
		              <td>${dto.BALANCE }</td>
		              <td>
		              <a href="${path}/SearchMain.do" class="button1 small normal">전체 계좌 조회</a>
		              <a href="${path}/transfer.do" class="button1 small color">이체</a>
		              </td>
		            </tr>
		          </tbody>
		        </table>
			</c:if>
      	</form>
        
        
      </div><!-- End post-content -->
      
    <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>