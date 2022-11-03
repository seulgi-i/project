<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>

  <title>공지사항</title>
 
   <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  

</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
  <link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css">
    <script src="${path}/resources/summernote/summernote-lite.js"></script>
<script src="${path}/resources/summernote/summernote-ko-KR.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
  </script>
  
  <script type="text/javascript">
  $(function() {
      $("#saveBtn").click(function() {
/*     	var title = $("#title").val();
    	alert(title);
    	var content = $("#summernote").val();
    	alert(content); */
    	if(title == ""){
    		alert("제목을 입력하세요");
    		$("#title").focus();
    		return false;
    	}if(content == ""){
    		alert("내용을 입력하세요");
    		$("#content").focus();
    		return false;
    	}
    	alert("공지사항 등록 완료");
    	 $("insertForm").submit();
      });
   });
  
  </script>
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>고객센터</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">고객센터</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="notice.do">공지사항</a></li>
         <li><a href="faq.do">자주하는질문</a></li>
		<li><a href="cnsltInsert.do">상담신청</a></li>
		<li><a href="cnslt.do">상담내역</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <div class="widget" style="margin-top:100px">
     <li style="text-indent: 1px;"><i class="icon-comments-alt s-20 color"></i>고객센터</li>
       <!-- Title Widget -->
       <p style="text-indent: 5px;">1588-1234</p>
       <p style="text-indent: 5px;">1599-1234</p>
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
		<form method="post" class="form-elements" id="insertForm" name="insertForm" action="${path}/noticeInsertAction.do">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <fieldset>
          <span>제목 : </span>
          <input type="text" name="n_title" class="title" id="title">
          </fieldset>
		  <textarea id="summernote" name="n_content" class="content"></textarea>
          
		  <div  style=" display: flex; justify-content: center; margin-top:20px;">
		  
		  <input type="submit" value="Save Button" class="button small color" id="saveBtn">
          <input type="reset" value="Reset Button" class="button small normal">
		  </div>
		</form>
		     
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   

   
   <footer>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>