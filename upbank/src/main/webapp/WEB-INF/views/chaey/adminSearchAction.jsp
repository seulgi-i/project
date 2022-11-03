<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
 <meta charset="utf-8">
<title> 관리자 - 계좌조회 새창 </title>
  
</head>
<body>

	<!-- 누르면 새창으로 해당 계좌에 대한 상세정보가 뜰 수 있도록 페이지 하나 만들기 -->
	<form name="adminSearchAction_form" action="#" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   
          <!-- 예금주명 조회 -->
       		<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="11%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="14%">최근거래일<br>/만기일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	            <!-- 그 외 일때정보 받아오기 -->
	            <c:forEach var="dto" items="${list}">
	            <tr>
	              <td>${dto.account_name}</td>
	              <td>${dto.id }</td>
	              <td>${dto.account }</td>
	              <td>${dto.account_type}</td>
	              <td>${dto.new_date }</td>
	              <td>${dto.last_date }<br>/ ${dto.i_end_date}</td>
	              <td>${dto.balance }</td>
	              <td>${dto.account_state }</td>
	            </tr>
	            </c:forEach>
	            
	            <tr>
		            <td colspan=8>
				        <!-- 이전버튼 활성화 여부 -->
						<c:if test="${paging.startPage > 10}">
							<a href="${path}/adminSearchAction.ad?pageNum=${paging.prev}">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 처리 -->
						<!-- header.css div #right a{ color: black:} 추가 처리 -->
						<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							<a href="${path}/adminSearchAction.ad?pageNum=${num}">${num}</a>
						</c:forEach>
						
						<!-- 다음버튼 활성화 여부 -->
						<c:if test="${paging.endPage < paging.pageCount}">
							<a href="${path}/adminSearchAction.ad?pageNum=${paging.next}">[다음]</a>
						</c:if>
		            </td>
	            </tr>
	            
	          </tbody>
	        </table><br>
	        
	        
         <input type="text" style="margin-auto" id="account_name" name="account_name">
         <input type="button" id="account_name_btn" value="조회">
         <input type="hidden" id="SearchType" value="account_name">
    	<!-- ==================== End Single Post  ==================== -->

   </form>
   
</body>
</html>