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

  <script>
	$(function() {   // 페이지가 로딩되면
	   // 자동으로 댓글목록 호출
	   comment_list();
	   
	   // 댓글쓰기 버튼 클릭
	   $("#btnSave").click(function() {
	      comment_add();
	      location.replace('${path}/cnsltDetail.do?c_No=${dto.c_No}');
	   });
	   
	});
	
	// 댓글쓰기
	function comment_add() {
	   /* alert("comment_add()"); */
	   // 게시글번호(), 작성자, 글내용을 파라미터로 넘김
	   var param = {
		 "c_No": ${dto.c_No},  /* key : value */
	     "cmt_name" : $('#cmt_name').val(),
	     "cmt_content" : $('#cmt_content').val()
	   }
	      
	   $.ajax({
	      url: "${path}/commentInsertAction.do?${_csrf.parameterName}=${_csrf.token}",
	      type: "post",
	      data: param,
	      success: function() {  // 댓글쓰기가 완료되면 서버에서 콜백함수 호출
	         $('#cmt_name').val("");   // 작성자 내용을 지움
	         $('#cmt_content').val("");  // 글내용을 지움
	         comment_list();   // 댓글목록 새로고침
	      },
	      error: function() {
	         alert('comment_add 오류');
	      }
	   });
	} 
	
	// 댓글목록
	function comment_list() {
	   /* alert("comment_list()");    */
	   $.ajax({
	      url: "${path}/commentListAction.do?${_csrf.parameterName}=${_csrf.token}",
	      type: "post",
	      data: "c_No=${dto.c_No}",
	      success: function(result) { //seccess 윗쪽은 요청. 
	         $('#commentList').html(result);	// result : comment_list.jsp(컨트롤러에서 forward)
	      },
	      error: function() {
	         alert('comment_list() 오류');
	      }
	   });
	}
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
		<form method="post" class="form-elements" id="insertForm" name="insertForm" action="">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      
      <h3 class="title bottom-1" style="background:#f8f9fb;padding: 10px 20px 5px 20px; border-bottom: 1px solid #e1e1e1; border-top:1px solid #555;
      display: flex; justify-content: space-between;">
      	제목 ${dto.c_title}<br>
      	<span style="font-size:13px;">분류 : ${dto.c_category}&nbsp;&nbsp;&nbsp;&nbsp;상태 : ${dto.c_comment}&nbsp;&nbsp;&nbsp;&nbsp;작성일 : ${dto.c_regDate}</span>
      	</h3><!-- Title Post -->
       <hr >
      <div class="post-content" style="padding: 10px 5px 40px 5px;">
        <p>
        ${dto.c_content}
        </p>
        
      </div><!-- End post-content -->
		  <div  style=" display: flex; justify-content: center; margin-top:20px;">
		  
		  <input type="button" style="color:#ffffff;" value="수정" class="button small color" onclick="window.location='${path}/cnsltUpdatePage.do?c_No='+${dto.c_No}">
		  <input type="button" style="color:#ffffff;" value="삭제" class="button small color" onclick="window.location='${path}/cnsltDeleteAction.do?c_No='+${dto.c_No}">
          <input type="button" style="color:#ffffff;" value="목록" class="button small color" onclick="window.location='${path}/cnslt.do'">
		  </div>
		  
		  <!-- 답변 내용 -->
		  
	<div class="comments-box">
      <h3 class="title bottom-1">상담내역</h3><!-- Title Post -->
      <hr class="bottom-2">
      
      <div  id="commentList">
		댓글 목록을 출력할 영역
      </div>
      
     </div>
		  <!-- 답변 내용 -->
		  
		  
		  <!-- 댓글 작성 -->
		   <hr class="bottom-2">
	<div class="comment-form top-4">
      <hr class="bottom-2">
      <h3 class="title bottom-2">Add Comment</h3><!-- Title Post -->
      
      
      <div class="form-box">
        <label for="name">Name <small>*</small></label>
        <input type="text" id="cmt_name" name="name" class="text">
      </div><!-- End Box -->
      
      <div class="form-box big">
        <label for="comment">Comment <small>*</small></label>
        <textarea name="comment" id="cmt_content"></textarea>
      </div><!-- End Box -->
      
      <div class="clearfix"></div>
      
      <input type="button" style="color:#ffffff;" value="작성" class="button medium color" id="btnSave">
      
      </div>
      </form>
       
    </div>
		  <!-- 댓글 작성 -->
		  
    
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