<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

  <!-- Basic Page Needs -->
  <title> 홈페이지 회원가입 </title>
	  <%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
	  <link rel="stylesheet" href="${path}/resources/css/chaey/joinform.css">
	  <script src="${path}/resources/js/chaey/join.js"></script>
	  
<script type="text/javascript">

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
	
	</div><!-- End Page title -->
   
   
	<!-- Start Project Details -->
   	<div style="style="border:1px solid black; display:flex; text-align:center; justify-content: center;">
   	
		<div id="contain"> 
	    
	    	<div style="width:80%; margin-left: 10%;">
	   
	   
				<div class="four columns bottom-2"> 
		     
			      	<!-- 회원가입폼 시작 -->
			      	<form name="joinform" action="${path}/joinAction.do" method="post">
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	
			      		<!-- Start accordion -->
						<div id="accordion2" class="accordion style2 top-3 bottom-3" style="width:80%; margin-left: 10%;">
				
							<h4><a href="#"> STEP 03. 정보 입력 </a></h4>
							<div><p>
				     			<!-- 계좌번호가 존재하고, ID가 등록되어있으면 Id/비번찾기창으로 이동 -->
								인터넷뱅킹 로그인 시 사용할 이용자ID, 비밀번호 등 이용자의 정보를 등록합니다.<br>
							
								<!-- 중앙정렬, 폭조정용 div시작  -->
			      				<div style="border:3px solid #c9cbcb; width:95%; display:flex; text-align:center; justify-content: center; margin:auto; padding:30px;">
									<br><br><br>
			      		
			      					<!-- inline-block용 div 시작 -->
			      					<div style="display:inline-block">
							      		<h3>Upbank 회원가입</h3><br>
										<table class="join_whether_tbl">
							      			<tr>
							      				<!-- 이전페이지에서 받은값 그대로 가져오기 -->
												<th width="20%">계좌번호</th>
												<td width="30%"> 
													<input type="text" id="account" name="account" value="${dto.account}" readonly>
												</td>
												<th width="20%">이름</th>
												<td width="30%"> 
													<input type="text" id="name" name="name" value="${dto.name}" readonly>
												</td>
											</tr>
											<tr>
												<th>생년월일</th>
												<td>
													<input type="date" id="birthday" name="birthday" value="${dto.birthday}">
												</td>
												<th>핸드폰</th>
												<td width="25%"> 
													<input type="text" id="phone" name="phone" value="${dto.phone}" readonly>
												</td>
											</tr>
											<tr>
												<th>ID</th>
												<td colspan="2" style="border-right:none"> 
													<input type="hidden" name="hiddenId" value="0">
													<input type="text" id="id" name="id" required style="margin-left:-10px">
												</td>
												<td style="border-left:none">
													<input type="button" name="dupChk" value="중복확인" style ="margin-left:10px;" width="100px" onclick="confirmId();">
												</td>
						
											</tr>
											<tr>
												<th>PW</th>
												<td>
													<input type="password" id="password" name="password" required>
												</td>
												<th>PW확인</th>
												<td>
													<input type="password" id="repassword" name="repassword" required>
												</td>
											</tr>
											<tr>
												<th>직업</th>
												<td>
													<input type="text" id="job" name="job">
												</td>
												<th>가입일</th>
												<td id="reg_date" name="reg_date">
													<!-- <input type="date" id="reg_date" name="reg_date" value=""> -->
												</td>
											</tr>
											
											<script>
												date = new Date();
												year = date.getFullYear();
												month = date.getMonth() + 1;
												day = date.getDate();
												document.getElementById("reg_date").innerHTML = year + "/" + month + "/" + day;
											</script>
											
											
											<tr>
												<th>주소</th>
												<td> 
													<input type="text" id="address" name="address">
												</td>
												<td colspan="2" style="border-left:none"> 
													<input type="text" id="address_detail" name="address_detail" placeholder="상세주소를 입력하세요" style="width:95%">
												</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td colspan="3">
										            <input type="text" class="form-control" id="email1" name="email1" maxlength="20" style="width:200px; display:inline;" required placeholder="20글자이내">
											            @
										            <input type="text" class="form-control" id="email2" name="email2" maxlength="20" style="width:150px; display:inline;" required placeholder="선택하세요">
													<select class="form-control" id="email3" name="email3" onchange="selectEmailChk()" style="width:100px; display:inline;">
														<option value="0">직접입력</option>
														<option value="naver.com">네이버</option>
														<option value="gmail.com">구글</option>
														<option value="daum.net">다음</option>
														<option value="nate.com">네이트</option>
													</select>
												</td>
											</tr>
											<tr>
												<th colspan="4">
													<button class="button medium color bottom-2" type="submit" style="margin-top:15px">가입 완료</button>
												</th>
											</tr>
				      					</table>
				      				</div><!-- inline-block용 div 끝 -->
				      			</div><!-- 중앙정렬, 폭조정용 div끝  -->
				      		</div><!-- step3 정보담을div -->
				      	</div><!-- End accordion -->
				      	
			      	</form>
			      	<!-- 회원가입폼 종료 -->
		      
			    </div>
			   	<!-- End Project information -->
	   
		   
			</div>
		   
		</div>
		<!-- <<< End Container >>> -->
	
	</div>
	<!-- End Project Details -->
   
   
   
   
   
   
   
   
   
   
	<!-- Start main content -->
	
	
	   
   
   
   
   
   <footer>
   		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
  <!-- Start JavaScript -->
  <!-- End JavaScript -->
  
  <!-- Start Style Switcher -->
  <!-- End Style Switcher -->
    
</body>
</html>