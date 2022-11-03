<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<title>ADMIN: 관리자 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">
<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<script>
	$(function() {   // 페이지가 로딩되면
	   // 자동으로 댓글목록 호출
	   comment_list();
	   
	  	/*  댓글쓰기 버튼 클릭 */
	   $("#btnSave").click(function() {
	      comment_add();
	   });
	   
	   // 목록버튼 클릭시 목록으로 이동
	   $("#btnList").click(function() {
	      location.href="${path}/boardList.bo?${_csrf.parameterName}=${_csrf.token}";      
	   }); 
	   
	   // 수정 삭제 화면으로 이동
	   $("#btnEdit").click(function() {
	      // alert("상세페이지- btnEdit");
	      document.detailForm.action="${path}/password_chk.bo?${_csrf.parameterName}=${_csrf.token}";
	      document.detailForm.submit();
	   });
	});
	
	// 댓글쓰기
	function comment_add() {
	   //alert("comment_add()");
	   // 게시글번호(), 작성자, 글내용을 파라미터로 넘김
	   var param = {
		 "board_num": ${dto.num},  /* key : value */
	      "writer" : $('#writer').val(),
	      "content" : $('#content').val()
	   }
	   $.ajax({
	      url: "${path}/commentAdd.bo?${_csrf.parameterName}=${_csrf.token}",
	      type: "post",
	      data: param,
	      success: function() {  // 댓글쓰기가 완료되면 서버에서 콜백함수 호출
	         $('#writer').val("");   // 작성자 내용을 지움
	         $('#content').val("");  // 글내용을 지움
	         comment_list();   // 댓글목록 새로고침
	      },
	      error: function() {
	         alert('comment_add 오류');
	      }
	   });
	} 
	
	// 댓글목록
	function comment_list() {
	   $.ajax({
	      url: "${path}/commentList.bo?${_csrf.parameterName}=${_csrf.token}",
	      type: "post",
	      data: "num=${dto.num}",
	      success: function(result) { //seccess 윗쪽은 요청. 
	         $('#commentList').html(result);	// result : comment_list.jsp(컨트롤러에서 forward)
	      },
	      error: function() {
	         alert('comment_list() 오류');
	      }
	   });
	}
</script>
</head>
<body style="background:linen;">

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->

      
      <!-- 상품 목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <h1 align="center"> board </h1>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측 메뉴 시작 -->
               <div id="left">
                  <div class="left_inside">
                     <!-- 좌측 메뉴바 시작-->
                     <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
                     <!-- 좌측 메뉴바 종료 -->
                  </div>
               </div>
               <!-- 좌측 메뉴 종료 -->
               
               <!-- 우측 메뉴 시작 -->
               <div id="right" style=" width: 88%";>

                  <div class="table_div">
                  <form method="post" name="detailForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                     <table style="width:1000px; align:center">
                        <tr>
                           <th style="width:200px" align="center" border="1">작성일</th>
                     <td style="width:200px; text-align:center">${dto.regDate}</td>   
                     
                                          
                           <th style="width:200px" align="center" border="1">조회수</th>
                     <td style="width:200px; text-align:center">${dto.readCnt}</td>                          
                        </tr>
                        <tr>
                           <th style="width:200px" align="center" border="1">작성자</th>
                     <td style="width:200px; text-align:center">${dto.writer}</td>                        
                           
                           <th>비밀번호</th>
                     <td>
                        <input style="width:200px" type="password" class="input" name="password" id="password" value="${dto.password}" placeholder="비밀번호 입력" required>
                        
                        <c:if test="${param.message=='error'}">
                           <br><span style="color:red">비밀번호 불일치</span>
                        </c:if>
                     </td>
                        </tr> 
                        
                        <tr>
                           <th>글제목</th>
                     <td colspan="3"  style="text-align:center">${dto.title}</td>
                        </tr>                         
                        <tr>
                           <th>글내용</th>
                     <td colspan="3" style="text-align:center">${dto.content}</td>
                        </tr>     
                        
                        <tr>
                           <th colspan="4">
                           <input type="hidden" name="num" value="${dto.num}">
                           <input type="button" class="inputButton" value="수정/삭제" id="btnEdit">
                           <input type="button" class="inputButton" value="목록" id="btnList">
                        </tr>                    
                                               
                     </table>
                     <br>
   					 <!-- 댓글 입력 코드 -->
   					 <table width="1000px" align="center" border="1">
   					 <tr>
   					 	<td align="center" colspan="4" style="width:100px"> 댓 글</td>
                     </tr>
                     
                        <tr>
                           <th style="width:100px">이름</th>
                           <td style="width:200px" colspan="2">
                              <input style="width: 200px" class="input" id="writer" placeholder="이름">
                           </td>
                           <td style="width:30px" rowspan="2" align="right">
                             <center><button id="btnSave" type="button" class="inputButton">확인</button></center>
                           </td>
                        </tr>
                        
                        <tr>
                           <th style="width:100px">내용</th>
                           <td style="width:170px">
                              <textarea rows="5" cols="60" id="content" placeholder="내용을 입력하세요."></textarea>
                           </td>
                        </tr>
                     </table>
                     
                     <br><br>
                     <!-- 댓글 목록을 출력할 영역 -->
                     <div id="commentList">
                        댓글 목록을 출력할 영역
                     </div>
               		
               </form>
               
               		
               		
               		
               		
               		
                  </div><!-- table_div -->
               </div><!-- right -->
               <!-- 우측 메뉴 시작 -->
               
            </div><!-- section2 -->
         </div><!-- contents -->
      </div><!-- container -->
      <!-- 상품 목록 컨텐츠 종료 -->


      <!-- footer 시작 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
<body style="background:linen;">
</html>