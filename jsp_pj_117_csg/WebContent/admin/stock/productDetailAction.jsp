<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 - 상품 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/productDetail.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<script>
/* 
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
          alert("비밀번호를 입력하세요.!!");
          $("#password").focus();
          return false;
       }
       
       if(title ==""){
          alert("제목을 입력하세요!!");
          $("#title").focus();
          return false;
       }
       
       if(content == ""){
          alert("내용을 입력하세요!!");
          $("#content").focus();
          return false;
       }
       document.editForm.action="${path}/board_updateAction.bo";
       document.editForm.submit();
    });
    
    
    //삭제버튼
    $("#btnDelete").click(function(){

         if(confirm("게시글을 삭제 하시겠습니까?")){
        document.editForm.action="${path}/board_deleteAction.bo";
        document.editForm.submit();
         }
         
    });
 }); */
</script>


</head>
<body style=background:linen;>

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/common/header.jsp" %>
      <!-- header 끝 -->

      
      <!-- 상품 목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <h1 align="center"> 수정삭제페이지 </h1>
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
                  <form method="post" name="editForm" action="${path}/productUpdateAction.st" enctype="multipart/form-data">
                     <table style="width:1000px;" border="1">
                     <input type="hidden" name="pageNum" value="${pageNum}">
                     <input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
                     <input type="hidden" name="hiddenPdImg" value="${dto.pdImg}"><!-- 기존 상품 이미지 -->
                        <tr>
                           <th>제품번호</th>
                     <td>
                     <input type="text" class="input" name="pdNo" id="pdNo" size="20" value="${dto.pdNo}" placeholder="제품번호"  required>
                     </td>   
                     
                                          
                           <th>*제품명</th>
                     <td>
                     <input type="text" class="input" name="pdName" id="pdName" size="20" value="${dto.pdName}" placeholder="제품명"  required>
                     </td>                          
                        </tr>
                        <tr>
                           <th>브랜드</th>
                     <td>
                     <input type="text"   class="input"  name="brand" id="brand" size="20" value="${dto.brand}" placeholder="브랜드"  required>
                     </td>                        
                           
                           <th>상품이미지</th>
                     <td>
                        <img src="${dto.pdImg}" width="80">
                        <input type="file" class="input" name="pdImg" id="pdImg"  placeholder="이미지" required accept="image/*">
                     </td>
                        </tr> 
                           <tr>
                              <th>카테고리</th>
                              <td>
                                 <select id="category" class="input" name="category" required>
                                    <option>상품 카테고리</option>
                                    <option value="꽃다발" <c:if test="${dto.category == '꽃다발'}">selected</c:if>>꽃다발</option>
                                    <option value="화분" <c:if test="${dto.category == '화분'}">selected</c:if>>화분</option>
                                    <option value="꽃바구니" <c:if test="${dto.category == '꽃바구니'}">selected</c:if>>꽃바구니</option>
                                 </select>
                              </td>
                           </tr>                          
                        <tr>
                           <th>제품설명</th>
                     <td colspan="3" >
                     <textarea rows="5" cols="93" name="content" id="content" class="textarea"  >${dto.content}</textarea>
                     </td>
                        </tr>   
                        <tr>
                            <th>가격</th>
                     <td>
                     <input type="text"   class="input"  name="price" id="price" size="20" value="${dto.price}" placeholder="가격입력"  required>
                     </td>  
                            <th>수량</th>
                     <td>
                     <input type="text"   class="input"  name="quantity" id="quantity" size="20" value="${dto.quantity}" placeholder="수량"  required>
                     </td>  
                        </tr>
                           <tr>
                              <th>판매 상태</th>
                              <td>
                                 <select id="status" class="input" name="status" required>
                                    <option>상품 판매 상태</option>
                                    <option value="판매중" <c:if test="${dto.status == '판매중'}">selected</c:if>>판매 중</option>
                                    <option value="품절" <c:if test="${dto.status == '품절'}">selected</c:if>>품절</option>
                                 </select>
                              </td>
                           </tr>   
                        <tr>
                           <th>등록일</th>
                     <td colspan="3" >
                     ${dto.indate}
                     </td>   
                  </tr>                        
                        <tr>
                           <th colspan="4" style="text-align: center">
                           <input type="submit" class="inputButton" value="수정" id="btnUpdate">
                           <input type="reset" class="inputButton" value="취소" >
                           <input type="button" class="inputButton" value="목록"onclick="window.location='${path}/productList.st'">
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