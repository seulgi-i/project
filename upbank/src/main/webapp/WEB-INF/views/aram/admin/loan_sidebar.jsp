<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
</head>
<body>
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">대출</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="http://localhost:8022/loan_product.lo">대출 상품 조회</a></li>
         <li><a href="${path}/loan_product_add.lo">대출 상품 등록</a></li>
         <li><a href="${path}/admin_loan_join.lo">대출 신청 조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
</body>
</html>