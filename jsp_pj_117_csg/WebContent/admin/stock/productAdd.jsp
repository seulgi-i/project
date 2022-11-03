<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용  -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 상품등록</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->
<style>
@charset "UTF-8";

#container {
   width: 100%;
   margin: 0 auto;
	margin-left: -88px;
}

#contents {
   max-width: 1240px;
   min-width: 1240px;
   width: 100%;
   margin: -28px auto;
   min-height: 800px;
}

#section2 {
    display: flex;
    color: black;
    justify-content: flex-start;
    flex-direction: row;
    align-items: baseline;
}
#section1 {
    font-size: 13px;
    text-align: center;
    margin: 0;
    margin-left: 83px;
    padding: 166px 0px 0px 0px;
}

/* 우측 내용 시작 */ 
right {
    text-align: center;
    padding: 100px 0 0 0px;
 }

.table_div {
   margin-top: 50px;
}

.table_div table {
   border-collapse: collapse;
}

.table_div table th, td {
    height: 50px;
    padding-left: 24px;
}
  
.table_div table th {
}

.inputButton {
   background-color: dark-yellow;
   font-size: 16px;
   padding: 10px 15px 10px 15px;
}

input {
   padding: 2px 2px;
}

.inputButton {
    font-size: 11px;
    padding: 3px 12px 5px 14px;
    line-height: 21px;
}
.input {
    width: 675px;
    height: 40px;
    border: 1px solid gray;
    box-sizing: border-box;
    padding: 6px 0px 0 10px;
    background: none;
}
tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
    font-size: 12px;
    text-align: center;
}
textarea {
    resize: vertical;
    background: linen;
 }
</style>
</head>
<body style="background:linen;">
<div class="wrap">
      <!-- header 시작 -->
		<%@ include file ="/common/header.jsp" %>
		<!-- header 끝 -->

      
      <!-- 상품 목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <h1 align="center" style="text-size:25px; font-family: 'Gowun_Batang', serif;"> productAdd </h1>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측 메뉴 시작 -->
               <div id="left">
                  <div class="left_inside">
                     <!-- 좌측 메뉴바 시작-->
                     <%@ include file ="/admin/common/leftMenu.jsp" %>
                     <!-- 좌측 메뉴바 종료 -->
                  </div>
               </div>
               <!-- 좌측 메뉴 종료 -->
               
               <!-- 우측 메뉴 시작 -->
               <div id="right">
                  <div class="table_div">
                     
                      <form action="${path}/productAddAction.st" method="post" name="productAdd" enctype="multipart/form-data">
                        <table style="width:800px" align="center" border="1">
                           <tr>
                              <th>* 브랜드 </th>
                              <td><input type="text" class="input" id="brand" name="brand" size="50" placeholder="브랜드 입력" required autofocus></td>
                          </tr>
                           <tr>
                              <th>* 상품명</th>
                              <td><input type="text" class="input" id="pdName"name="pdName" size="40" placeholder="상품명 입력" required></td>
                          </tr>                          
                         
                          <tr>
                                <th>* 상품이미지</th>
                                <td><input type="file" class="input"  id="pdImg" name="pdImg" accept="image/*"></td>
                          </tr>
                     
                     <tr>
                        <th>상품카테고리</th>
                        <td>
                           <select id="category" class="input" name="category" required>
                              <option>상품카테고리</option>
                              <option value="꽃다발">꽃다발</option>
                              <option value="화분">화분</option>
                              <option value="꽃바구니">꽃바구니</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th>제품설명</th>
                        <td><textarea rows="5" cols="50" id="content" name="content" palceholder="제품설명 입력"style=" margin-right: 353px;"></textarea></td>
                     </tr>
                     <tr>
                        <th>판매가</th>
                        <td><input type="number" class="input" id="price" name="price" size="10" placeholder="판매가격 입력" required></td>
                     </tr>
                     
                     <tr>
                        <th>등록수량</th>
                        <td><input type="number" class="input" id="quantity"name="quantity" size="10" placeholder="등록수량 입력" required></td>
                     </tr>
                     
                     <tr>
                        <th>판매 상태</th>
                        <td>
                           <select id="status" class="input" name="status" required>
                              <option>상품 판매상태</option>
                              <option value="판매중" selected>판매중</option>
                              <option value="품절" >품절</option>
                           </select>
                           
                        </td>   
                      </tr>

                      <tr>
                         <!-- <td colspan ="2"  style="border-bottom:none;">-->
                         <td colspan ="2">
                            <br>
                            <div align="right">
                               <input type="submit" class="inputButton" value="등록"style="text-size:14px">
                               <input type="reset" class="inputButton" value="초기화"style="text-size:14px">
                            </div>
                          </td>
                        </tr>
                        </table>
                    </form>    
                  </div>
               </div>
               <!-- 우측 메뉴 시작 -->
               
            </div><!-- section2 -->
         </div><!-- contents -->
      </div><!-- container -->
      <!-- 상품 목록 컨텐츠 종료 -->


      <!-- footer 시작 -->
      	<%@ include file ="/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>