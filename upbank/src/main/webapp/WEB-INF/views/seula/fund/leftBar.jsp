<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div class="widget categories">
       <h3 class="title bottom-1">펀드</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/etf.do">ETF</a></li>
         <li><a href="${path}/etn.do">ETN</a></li>
         <c:if test="${sessionScope.customerID != 'admin'}">
         <li><a href="${path}/fundAccountInsert.do">펀드 계좌 개설</a></li>
         <li><a href="${path}/fundMypage.do">펀드 보유 내역</a></li>
		 </c:if> 
         <li><a href="${path}/fundSearch.do">펀드 거래 내역</a></li>
       </ul><!-- End arrow-list -->
     </div>
     
     
</body>
</html>