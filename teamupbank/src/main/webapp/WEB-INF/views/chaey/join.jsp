<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

  <!-- Basic Page Needs -->
  <title> 홈페이지 회원가입 </title>
	  <%@ include file="/WEB-INF/views/common/setting.jsp" %>
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
   
   
   
   
	<!-- Start main content -->
	<div id="contain""> 
    
    <div style="width:80%; margin-left: 20%;">
   
		<div class="clearfix"></div>
		   
			<!-- Start Project Details -->
			<div class="twelve columns bottom-1">
		   
		     	<div style="float:left; width:20%;">
		     		<img src="${path}/resources/images/img/chaey/joinicon.png" width="180px">
		     	</div>
		     	
		     	<div style="float:left; width:70%;">
		     		<h3 class="title"> 홈페이지 회원가입 안내 </h3>
		     
		     		<div class="about-project bottom-1">
			      	<p>
					         업뱅크 홈페이지에서 회원가입을 하시면 인터넷뱅킹 서비스를 이용하실 수 있습니다.<br>
						홈페이지 회원가입은 업뱅크 계좌를 보유하신 고객분들만 이용하실 수 있습니다.<br>
						신규 계좌발급을 원하시면영업점에 방문하시거나 비대면 계좌 발급 서비스를 이용하시길 바랍니다. 
			       	</p>
			  	</div>
			</div>
		     
		     <!-- 아직보류, 추후 계좌발급 링크로 연결 -->
		     <a href="#" class="button medium color bottom-2"> 비대면 계좌 발급 알아보기</a>
		     
			</div>
		   <!-- End Project Details -->
		   
   
		<div class="four columns bottom-2"> 
     
     <h3 class="title">가입 절차</h3>
     
     	<!-- Start accordion -->
      	<div id="accordion2" class="accordion style2 top-3 bottom-3">
        
	          <h4><a href="#"> STEP 01. 약관동의 </a></h4>
	          <div><p>전자금융거래이용약관 등 관련 약관에 동의합니다.
	          </p></div>
	          
	          <h4><a href="#"> STEP 02. 계좌등록 및 본인확인</a></h4>
	          <div><p>조회서비스를 신청하실 계좌번호, 계좌비밀번호, 생년월일을 등록 후 본인명의 휴대폰 인증을 합니다.
	          </p></div>
	          
	          <h4><a href="#"> STEP 03. 정보입력 </a></h4>
	          <div><p> 성명, 인터넷뱅킹 로그인 시 사용할 이용자ID, 이용자비밀번호를 등록합니다.
	          </p></div> 
	          
	          <h4><a href="#"> STEP 04. 회원가입완료</a></h4>
	          <div><p> 업뱅크 인터넷뱅킹의 다양한 서비스를 이용할 수 있습니다.<br>
				인터넷뱅킹 이용시 혜택, 인터넷뱅킹 미리보기에서 인터넷뱅킹 고객만의 혜택과 편리한 서비스를 확인해 보세요.
	          </p></div> 
      	</div>
		
		<a href="#" class="button medium color bottom-2"> 회원가입 바로가기</a><br><br><br>
      	
      	<!-- End accordion -->
      	
      	
      	<form name="joinform" action="${path}/joinAction.do" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      		<h2>임시 회원가입창</h2>
	      		<table>
	      			<tr>
						<th>계좌번호</th>
						<td> 
							<input type="text" id="account" name="account" required autofocus>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td> 
							<input type="text" id="name" name="name" required>
						</td>
					</tr>
					<tr>
						<th>ID</th>
						<td> 
							<input type="text" id="id" name="id" required>
						</td>
					</tr>
					<tr>
						<th>PW</th>
						<td>
							<input type="password" id="password" name="password" required>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="date" id="birthday" name="birthday">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td> 
							<input type="text" id="address" name="address">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="mb-3">
					            <label for="email">*이메일</label><br>
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
					        </div>	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="button medium color bottom-2" type="submit">가입 완료</button>
						</td>
					</tr>
	      		
	      		</table>
      	</form>
      
      
      
      <div class="clearfix"></div>
      
      <h3 class="title bottom-1">Share</h3>
      
      <div class="share-social">
      <a href="http://twitter.com/home?status=Invention Theme :+http://themes.jozoor.com/wp/crevision/white/preview/monsterup/ via @jozoor" 
      target="_blank">
      <i class="social_icon-twitter s-17 white"></i></a>
      <a href="http://www.facebook.com/share.php?u=http://themes.jozoor.com/wp/crevision/white/preview/monsterup/" target="_blank">
      <i class="social_icon-facebook s-18 white"></i></a>
      <a href="https://plus.google.com/share?url=http://themes.jozoor.com/wp/crevision/white/preview/monsterup/" target="_blank">
      <i class="social_icon-gplus s-18 white"></i></a>
      <a href="http://pinterest.com/pin/create/button/?url=http://themes.jozoor.com/wp/crevision/white/preview/monsterup/&media=http://themes.jozoor.com/wp/crevision/white/wp-content/uploads/2012/11/thumb-3.jpg&description=Invention Theme" target="_blank">
      <i class="social_icon-pinterest s-18 white"></i></a>
      </div>
      
    
	    </div>
	   	<!-- End Project information -->
   
	   
	      
	   
	   </div>
	   <!-- <<< End Container >>> -->
	   </div>
	   <!-- End main content -->
	   
	   
   
   
   
   
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