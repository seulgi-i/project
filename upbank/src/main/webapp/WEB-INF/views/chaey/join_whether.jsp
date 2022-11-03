<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	
  <!-- Basic Page Needs -->
  <title> 홈페이지 회원가입 </title>
	  <%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
	  <link rel="stylesheet" href="${path}/resources/css/chaey/joinform.css"> 
	  <script src="${path}/resources/js/chaey/join_whether.js"></script>
<script type="text/javascript">

 
 $(function(){
		$("#searchBtn").click(function(){
			if(signInCheck()!=false){
			
				var param = {
						"account": $('#account').val(),
						"account_pw": $('#account_pw').val(),
						"name": $('#name').val(),
						"birthday": $('#birthday').val(),
						"phone1": $('#phone1').val(),
						"phone2": $('#phone2').val(),
						"phone3": $('#phone3').val()
					}
				
				$.ajax({
					url: '${path}/join_search.do?${_csrf.parameterName}=${_csrf.token}',
					type: 'post',
					data: param,
					success: function(data){	//콜백함수 호출
						$('#result').html(data);	
									
					},
					error: function(){
						alert('일치하는 정보가 없습니다. 다시 확인해주세요');
					}
				})
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
	   
	   
	   	<div class="page-title">
	     	<div class="container clearfix">
	         	<h1> 홈페이지 회원가입 </h1>
	         	<div class="portfolio-control">
	           		<a href="portfolio_4.html#4" data="All Projects" class="all black"><i class="icon-th"></i></a>
	         	</div><!-- End control -->
	       	</div>
		</div><!-- End Container -->
	
	
   <!-- 메인시작 -->
   	<div>
   		<!-- 폼시작 -->
   		<form name="join_whether_form" action="${path}/join_form.do" method="post">
   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   	
			<!-- Start Project Details -->
			<div class="twelve columns bottom-1">
		   
		     	<!-- Start accordion -->
				<div id="accordion2" class="accordion style2 top-3 bottom-3" style="width:80%; margin-left: 10%;">
				
					<h4><a href="#"> STEP 02. 계좌등록 및 본인확인 </a></h4>
					<div><p>
		     			<!-- 계좌번호가 존재하고, ID가 등록되어있으면 Id/비번찾기창으로 이동 -->
						홈페이지 회원가입은 업뱅크 계좌를 보유하신 고객분들만 이용하실 수 있습니다.<br>
						신규 계좌발급을 원하시면영업점에 방문하시거나 비대면 계좌 발급 서비스를 이용하시길 바랍니다.
						
						<div style="border:3px solid #c9cbcb; width:95%; display:flex; text-align:center; justify-content: center; margin:auto; padding:30px;">
							<br><br><br>
							
							<div style="display:inline-block">
							<table class="join_whether_tbl">
								<tr>
									<th width="150px">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
									<td width="300px"> 
										<input type="text" id="name" name="name" required>
									</td>
									<th width="100px"> 생년월일 </th>
									<td width="200px">
										<input type="date" id="birthday" name="birthday" required>
									</td>
								</tr>
								<tr>
									<th>계좌번호</th>
									<td> 
										<input type="text" id="account" name="account" required>
									</td>
									<th>비밀번호</th>
									<td> 
										<input type="password" id="account_pw" name="account_pw" required placeholder="****">
									</td>
								</tr>
								<tr>
									<th> 핸드폰번호 </th>
									<td>
										<input type="text" id="phone1" name="phone1" placeholder="010" required style="width:18%; height:60%;">-
										<input type="text" id="phone2" name="phone2" placeholder="0000" required style="width:18%; height:60%;">-
										<input type="text" id="phone3" name="phone3" placeholder="0000" required style="width:18%; height:60%;">
										<input type="button" value="발송" style="font-size:12px; width:15%; height:50%; margin-left:10px;">
									</td>
									<th> 인증번호 </th>
									<td>
										<input type="number" id="phone_code" name="phone_code">
									</td>
									<!-- 여유있을때 인증번호 만들기 -->
								</tr>
								
							</table><br><br>
														
							<div style="width:30%; display:flex; text-align:center; justify-content:center; margin:auto;">
							     <input type="button" value="회원 확인" class="button medium color bottom-2" id="searchBtn" name="searchBtn">
							</div><br><br>
							</div>							
						 
						 	<br><br><br>
						</div>
					</div>
					
				</div>
		     
		     
		    <!-- 계좌확인후 있으면 가입폼을 Ajax로 아래 띄우기,없으면 계좌없다고 알람창띄우고 계좌발급 안내페이지  -->
			    
			
			</div>
		   	<!-- End Project Details -->
	
	
		</form>
		<!-- 폼종료 -->
	</div>
	<!-- 메인종료 -->
   
   
   
	<!-- Start Container -->
	<div id="contain"> 
    
    	<div style="width:60%; margin-left: 20%;">
   
		   <!-- Ajax를 통해 계좌조회시 내 계좌가 출력될 영역 -->
			<div class="four columns bottom-2"> 
   	 			<!-- ajax+반복문으로 값이 출력될 영역 -->
	   	 		<div id="result">
	   	 		
	   	 		
	   	 		</div>
			   	<!-- End Ajax 계좌출력 -->
	   	 		
	    	</div>
   
	   
	      
	   
		</div>

	</div>
   <!-- <<< End Container >>> -->
	   
	   

   
   
   <footer>
   		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
    </div>
    <!-- End Page title 푸터꺠지면 푸터 위로올려 -->
    
  <!-- Start JavaScript -->
  <!-- End JavaScript -->
  
  <!-- Start Style Switcher -->
  <!-- End Style Switcher -->
    
</body>
</html>