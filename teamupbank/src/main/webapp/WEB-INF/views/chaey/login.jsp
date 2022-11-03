<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

  <!-- Basic Page Needs -->
  <title> 로그인 페이지 </title>
	  <%@ include file="/WEB-INF/views/common/setting.jsp" %>
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
     	<%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1> 회원 로그인 </h1>
         <div class="portfolio-control">
           <a href="portfolio_4.html#4" data="All Projects" class="all black"><i class="icon-th"></i></a>
         </div><!-- End control -->
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   
   
   <!-- Start main content -->
   <div class="container main-content clearfix" style="border:1px solid gray">
    
    
    <!-- 로그인창 -->
      <div class="flex-container" style="border:1px solid black; display:flex; text-align:center; justify-content: center;">
      	<form name="loginForm" method="post" action="${path}/loginAction.do">
      	<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      		<br><br><br>

      		<div style="padding:40px; border:1px solid skyblue">
			<table id="loginTable" style="margin:auto">
				<tr align="center">
					<td colspan="2">
						<img src="static/images/img/chaey/loginimg.png" width="180px"><br>
						<h4>member login</h4><br><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" text-align="center" style="border:0.5px solid grey; padding-left:5px; width:300px; height:40px;">
						<i class="icon-user s-20"></i>
						<input type="text" id="id" name="id" placeholder="User Name / ID" style="border:none">
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td colspan="2" text-align="center" style="border:0.5px solid grey; padding-left:5px; width:300px; height:40px;">
					<i class="icon-lock s-20 color"></i>
						<input type="password" id="password" name="password" placeholder="Password" style="border:none">
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td colspan="2" style="text-align:center">
					 	<input type="submit" value="로그인" id="로그인" class="button medium color bottom-2" style="width:95%; text-align:center" >
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td align="center" style="padding-left:5px"> ID찾기</td>
					<td align="center"> 비밀번호 찾기 </td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td align="center" colspan="2">혹시 회원이 아니신가요?  회원가입하기</td>
				</tr>
			</table>
			</div>
			
			<br><br><br><br><br>
      	</form>	
      <div>
      	
      	</div>
        
      </div>
      <!-- 로그인창 끝 -->
      
   
   
   <!-- Start Project Details -->
   <br><br>
   <div class="twelve columns bottom-1">
   
     <h3 class="title"> <b>안전한 온라인 뱅킹을 위해 알아두세요</b> </h3>
     
     <div class="about-project bottom-1">
       <p><br>
			은행 관계자는 어떠한 이유로도 고객의 비밀번호를  요구하지 않습니다. 
         <br><br>
			절대 타인에게 비밀번호나 개인의 신상정보를 알려주지마세요.
		 <br><br>
		 	공공기관 또는 지인을 사칭한 전화 또는 메시지에 유의해주세요.
		
       </p>
     </div>
     
     
     <a href="${path}/notice.do" class="button medium color bottom-2"> 고객센터 이동 </a>
     
   </div>
   <!-- End Project Details -->
   
   
   
   
     
   <div class="four columns bottom-2"> 
     
     <h3 class="title">Information</h3>
     
      <ul class="arrow-list job bottom-2">
        <li><a href="#">HTML/CSS</a></li>
        <li><a href="#">Logo Design</a></li>
        <li><a href="#">User Interface Design</a></li>
      </ul><!-- End square-list -->
      
      
      
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
   
   
   <div class="sixteen columns clearfix"><hr class="line bottom-3"></div><!-- End line -->
   
   <div class="sixteen columns bottom-2">
   <h3 class="title">Related Projects</h3>
   </div>
   
   <div class="clearfix"></div>
   
   <div class="recent-work bottom-3">
   
     <!-- item 1 -->
     <!-- item 4 -->
      <div class="one-third column item Photography Animation" data-categories="Web Photography">
        <a href="single_project_1.html">
          <img src="images/img/portfolio/thumb-4.jpg" alt="" class="pic" />
          <div class="img-caption">
          <div class="desc"><h3>Apple Creative</h3><p>Web Design, Photography</p><span>+</span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
      
      <!-- item 5 -->
      <div class="one-third column item Web Animation" data-categories="Web Animation">
        <a href="single_project_1.html">
          <img src="images/img/portfolio/thumb-5.jpg" alt="" class="pic" />
          <div class="img-caption">
          <div class="desc"><h3>Apple Creative</h3><p>Web Design, Animation</p><span>+</span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
      
     <!-- item 6 -->
      <div class="one-third column item Logo Photography" data-categories="Logo Photography">
        <a href="single_project_1.html">
          <img src="images/img/portfolio/thumb-6.jpg" alt="" class="pic" />
          <div class="img-caption">
          <div class="desc"><h3>Apple Creative</h3><p>Logo Design, Photography</p><span>+</span></div>
          </div><!-- hover effect -->
          </a>
      </div>
      <!-- End -->
   
   </div><!-- End related projects -->
    
   </div><!-- <<< End Container >>> -->
   
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