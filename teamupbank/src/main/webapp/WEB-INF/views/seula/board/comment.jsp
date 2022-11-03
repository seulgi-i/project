<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<ul class="comments">
		<c:forEach var="dto" items="${list}" >
		<li class="comment-box">
           <div class="avatar"></div>
           <div class="comment">
              <h5><a href="#">${dto.cmt_name}</a></h5>
              <div class="date-replay">${dto.cmt_regDate}</div>
             <p>
             ${dto.cmt_content}
             </p>
           </div>
         </li><!-- End Parent -->
         </c:forEach>
         </ul><!-- End comments -->
</body>
</html>