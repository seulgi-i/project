<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

  <!-- Basic Page Needs -->
  <title> 회원 정보 수정 </title>
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
	   
	   
	   	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 align="center"> 회원정보 수정 - 인증화면</h1>
			</div>
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<div id="s2_inner">
					<div class="join">
						<form name="passwordform" action="${path}/modifyDetailAction.do" method="post">
							
							<!-- 수정실패면 -->
							<c:if test="${updateCnt == 0}">
						   		<script type="text/javascript">
							   		alert("업데이트 실패");
							   		window.location="${path}/modifyCustomer.do";
								</script>
							</c:if>
							
							<!-- 수정 성공이면 -->
							<c:if test="${updateCnt != 0}">
							
							   <%
								   request.getSession().invalidate();
							   	//모든세션삭제.(세션남아있으면 변경전 비번으로 인증되므로)
							   %>

							  	<script type="text/javascript">
							   		setTimeout(function(){
							   			alert("수정완료")
							   			window.location="${path}/login.do";
							   			},1000);
								</script>
								
							</c:if>
						</form>
					</div>	<!-- /join -->
				</div>	<!-- /s2_inner -->
			</div>	<!-- /section2 -->
		   		
   		</div>	<!-- /contents -->
   	</div>	<!-- /container -->
	   
	   
	   
	   <%-- 
	   	<div class="page-title">
	     	<div class="container clearfix">
	         	<h1> 회원 정보 수정</h1>
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
			      	<form name="updateform" action="${path}/modifyCustomerAction.do" method="post" onsubmit="return signInCheck();">
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	
			      		<!-- Start accordion -->
						<div id="accordion2" class="accordion style2 top-3 bottom-3" style="width:80%; margin-left: 10%;">
				
							<h4><a href="#"> 회원정보 수정</a></h4>
							<div><p>
				     			<!-- 계좌번호가 존재하고, ID가 등록되어있으면 Id/비번찾기창으로 이동 -->
								이용자의 비밀번호 및 등록된 정보를 수정합니다.<br>
							
								<!-- 중앙정렬, 폭조정용 div시작  -->
			      				<div style="border:3px solid #c9cbcb; width:95%; display:flex; text-align:center; justify-content: center; margin:auto; padding:30px;">
									<br><br><br>
			      		
			      					<!-- inline-block용 div 시작 -->
			      					<div style="display:inline-block">
							      		<h3>회원정보 수정</h3><br>
										<table class="join_whether_tbl">
							      			
												<th width="20%">계좌번호</th>
												<td width="30%"> 
													<input type="text" id="account" name="account" value="${dto.account}" readonly>
												</td>
												
												
											<tr>
												<th width="20%">이름</th>
												<td width="30%"> 
													<input type="text" id="name" name="name" value="${dto.name}" readonly>
												</td>
												<th>생년월일</th>
												<td>
													<input type="date" id="birthday" name="birthday" value="${dto.birthday}" readonly>
												</td>
											</tr>
											<tr>
												<th>ID</th>
												<td> 
													<input type="text" id="id" name="id" value="${dto.id}" readonly>
												</td>
												<th>핸드폰</th>
												<td width="25%"> 
													<input type="text" id="phone" name="phone" value="${dto.phone}">
												</td>
											</tr>
											<tr>
												<th>PW</th>
												<td>
													<input type="password" id="password" name="password" placeholder="********">
												</td>
												<th>PW확인</th>
												<td>
													<input type="password" id="repassword" name="repassword" placeholder="********">
												</td>
											</tr>
											<tr>
												<th>직업</th>
												<td>
													<input type="text" id="job" name="job" value="${dto.job}">
												</td>
												<th>가입일</th>
												<td id="reg_date" name="reg_date"> ${dto.reg_date} </td>
											</tr>
											<tr>
												<th>주소</th>
												<td> 
													<input type="text" id="address" name="address" value="${dto.address}">
												</td>
												<td colspan="2" style="border-left:none"> 
													<input type="text" id="address_detail" name="address_detail" value="${dto.address_detail}" placeholder="상세주소를 입력하세요" style="width:95%">
												</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td colspan="3">
													<c:set var="emailArr" value="${fn:split(dto.getEmail(), '@')}"/>
								
													<input type="text" class="input" name="email1" maxlength="20" style="width:200px" value="${emailArr[0]}">
													@
													<input type="text" class="input" name="email2" maxlength="20" style="width:150px" value="${emailArr[1]}">
													<select class="input" name="email3" style="width:100px" onchange="selectEmailChk();">
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
													<button class="button medium color bottom-2" type="submit" style="margin-top:15px">수정 완료</button>
													<button class="button medium color bottom-2" style="margin-top:15px" onclick="window.location='${path}/main.do'">수정 취소</button>
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
   
   
    --%>
   
   
   
   
   
   
   
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