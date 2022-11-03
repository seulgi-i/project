<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function login(e) {
		if(${sessionScope.customerID == null}) {
			alert("로그인이 필요합니다");
			window.location.href="${path}/login.do";
		} else {
			window.location.href= e;			
		}
	}
</script>
</head>
<body>
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">대출</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/loan_main.lo">대출 메인</a></li>
         <li><a href="${path}/loan_product.lo">상품&가입</a></li>
         <li><a href="#" onclick="login('${path}/loan_account.lo');">대출계좌조회</a></li>
         <li><a href="#" onclick="login('${path}/loan_repay.lo');">대출중도상환</a></li>
         <li><a href="#" onclick="login('${path}/loan_join_result.lo');">대출신청결과조회</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
</body>
</html>