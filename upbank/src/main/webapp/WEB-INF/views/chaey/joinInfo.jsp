<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

  <!-- Basic Page Needs -->
  <title> 홈페이지 회원가입 </title>
	  <%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
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
	
	<div id="contain"> 
    
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
		     <a href="${path}/AccAnonymInsert.do" class="button medium color bottom-2"> 비대면 계좌 발급 알아보기</a>
		     
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
	          <div><p>온라인 서비스를 이용하실 계좌번호, 계좌비밀번호, 생년월일을 등록 후 본인명의 휴대폰 인증을 합니다.
	          </p></div>
	          
	          <h4><a href="#"> STEP 03. 정보입력 </a></h4>
	          <div><p> 성명, 인터넷뱅킹 로그인 시 사용할 이용자ID, 이용자비밀번호를 등록합니다.
	          </p></div> 
	          
	          <h4><a href="#"> STEP 04. 회원가입완료</a></h4>
	          <div><p> 업뱅크 인터넷뱅킹의 다양한 서비스를 이용할 수 있습니다.<br>
				인터넷뱅킹 이용시 혜택, 인터넷뱅킹 미리보기에서 인터넷뱅킹 고객만의 혜택과 편리한 서비스를 확인해 보세요.
	          </p></div> 
      	</div>
		
		<a href="${path}/join_terms.do" class="button medium color bottom-2"> 회원가입 바로가기</a><br><br><br>
      	
      	<!-- End accordion -->
      	
      
      
      <div class="clearfix"></div>
      
      
    
	    </div>
	   	<!-- End Project information -->
   
	   
	      
	   
	   </div>
	   <!-- <<< End Container >>> -->
	   </div>
	   <!-- End main content -->
	   
	   
   
   
   
   
   <footer>
   		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  
  <!-- Start JavaScript -->
  <!-- End JavaScript -->
  
  <!-- Start Style Switcher -->
  <!-- End Style Switcher -->
    
</body>
</html>