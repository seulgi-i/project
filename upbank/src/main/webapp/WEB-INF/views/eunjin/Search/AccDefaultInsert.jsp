<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>UPBANK | 자유로운 입출금계좌 개설</title>

<script>
    
    // 숫자가 아닌 정규식
    var replaceNotInt = /[^0-9]/gi;
    var replaceNotInt2 = /[^0-9]/gi;
    
    $(document).ready(function(){
        
        $("#ACCOUNT_PW").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
        
        $("#ACCOUNT_PW_RE").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
 
    });
 
</script>

</head>
<body>
<div id="wrap" class="boxed">
<header>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</header>     
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
<div class="widget categories">
	<h3 class="title bottom-1">상품/가입</h3>
	<!-- Title Widget -->
	<ul class="arrow-list">
        <li><a href="${path}/depositMain.do">메인</a></li>
        <li><a href="${path}/depositList.do">예금 상품/가입</a></li>
        <li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
        <li><a href="${path}/AccDefaultInsert.do">신규입출금계좌</a></li>
        <li><a href="${path}/cancleList.do">해지</a></li>
	</ul>
	<!-- End arrow-list -->
</div>
<!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1">신규 입출금계좌 개설</h3><!-- Title Post -->
        <form name="accDefForm" action="${path}/AccDefaultInsertAction.do" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	      		<table class="style color">
	      		<h1>upBank 자유로운 입출금통장</h1>
	      			<tbody>
	      			<tr >
						<th>비밀번호</th>
						<td> 
							<input type="password" id="ACCOUNT_PW" name="ACCOUNT_PW" maxlength="4" placeholder="숫자 4자리를 입력하세요" required autofocus>
						</td>
					</tr>

					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="ACCOUNT_PW_RE" name="ACCOUNT_PW_RE" maxlength="4" placeholder="숫자 4자리를 입력하세요" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="button1 medium color bottom-2" type="submit">가입</button>
							<button class="button1 medium normal bottom-2" type="reset">초기화</button>
						</td>
					</tr>
	      			</tbody>
	      		</table>
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