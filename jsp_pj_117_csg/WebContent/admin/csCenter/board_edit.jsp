<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<title>ADMIN: 관리자 수정</title>
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

$(function(){
    //목록버튼
    $("#btnList").click(function(){
       location.href="${path}/boardList.bo";
    
    });
    
    //수정버튼
    $("#btnUpdate").click(function(){
    	
    	var password = $("#password").val();
    	var title = $("#title").val();
    	var content = $("#content").val();
    	
    	if(password == ""){
    		alert("비밀번호를 입력하세요");
    		$("#password").focus();
    		return false;
    	}
    	if(title == ""){
    		alert("제목을 입력하세요");
    		$("#title").focus();
    		return false;
    		
    	}if(content == ""){
    		alert("내용을 입력하세요");
    		$("#content").focus();
    		return false;
    	}
       document.editForm.action="${path}/board_updateAction.bo";
       document.editForm.submit();
    });
    
    
    //삭제버튼
    $("#btnDelete").click(function(){
    	if(confirm("삭제하시겠습니까?")){
    	       document.editForm.action="${path}/board_deleteAction.bo";
    	       document.editForm.submit();
    	}
        
    });
 });
</script>


</head>
<body style="background:linen;">

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/common/header.jsp" %>
      <!-- header 끝 -->

      
      <!-- 상품 목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <h1 align="center"> board_edit </h1>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측 메뉴 시작 -->
               <div id="left">
                  <div class="left_inside">
                     <!-- 좌측 메뉴바 시작-->
                     <%@ include file="/admin/common/leftMenu.jsp" %>
                     <!-- 좌측 메뉴바 종료 -->
                  </div>
               </div>
               <!-- 좌측 메뉴 종료 -->
               
               <!-- 우측 메뉴 시작 -->
               <div id="right">
                  <div class="table_div">
                  <form method="post" name="editForm">
                     <table style="width:1000px align:center">
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
                        
                     </td>
                        </tr> 
                        
                        <tr>
                           <th>글제목</th>
                     <td colspan="3" style="text-align:center">
                     <input type="text" name="title" id="title" size="50"  class="input"  value="${dto.title}">
                     
                     </td>
                        </tr>                         
                        <tr>
                           <th>글내용</th>
                     <td colspan="3" style="text-align:center">
                     <textarea rows="5" cols="93" name="content" id="content" class="textarea"  >${dto.content}</textarea>
                     </td>
                        </tr>     
                        
                        <tr>
                           <th colspan="4">
                           <input type="hidden" name="num" value="${dto.num}">
                           <input type="button" class="inputButton" value="수정" id="btnUpdate">
                           <input type="button" class="inputButton" value="삭제" id="btnDelete">
                           <input type="button" class="inputButton" value="목록" id="btnList">
                        </tr>                    
                                               
                     </table>
               </form>
                  </div><!-- table_div -->
               </div><!-- right -->
               <!-- 우측 메뉴 시작 -->
               
            </div><!-- section2 -->
         </div><!-- contents -->
      </div><!-- container -->
      <!-- 상품 목록 컨텐츠 종료 -->


      <!-- footer 시작 -->
      <%@ include file="/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>