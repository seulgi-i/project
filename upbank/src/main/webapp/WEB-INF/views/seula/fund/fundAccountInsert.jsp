<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>UPBANK | 펀드 계좌 개설</title>

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
    $(function() {
    var id;
    $('#insertBtn').click(function(){
    	id = ${sessionScope.customerID};
    	if( id == null || id == ''){
    		alert('로그인이 필요합니다.');
    		window.location.href='${path}/login.do';
    	}else{
    		 document.accDefForm.submit();
    	}
    });
    });
 
</script>

</head>
<body>
<div id="wrap" class="boxed">
 <header>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> --> 
   
       	<c:if test="${sessionScope.customerID == null}">
		   <script type="text/javascript">
		    	alert("로그인이 필요합니다.");
		   		window.location="${path}/login.do";
		   		</script>
		   </c:if> 
		   
		   
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
        <form name="accDefForm" action="${path}/fundAccountInsertAction.do" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	      		<table class="style color">
	      		<br>
	      		<h1>upBank 펀드 계좌 개설</h1>
	      			<tr>
						<th>비밀번호</th>
						<td> 
							<input style="width:300px; height: 40px;" type="password" id="ACCOUNT_PW" name="ACCOUNT_PW" maxlength="4" placeholder="숫자 4자리를 입력하세요" required autofocus>
						</td>
					</tr>

					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input style="width:300px; height: 40px;" type="password" id="ACCOUNT_PW_RE" name="ACCOUNT_PW_RE" maxlength="4" placeholder="숫자 4자리를 입력하세요" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="insertBtn" class="button1 medium color bottom-2" type="submit">가입</button>
							<button class="button1 medium normal bottom-2" type="reset">초기화</button>
						</td>
					</tr>
	      		
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