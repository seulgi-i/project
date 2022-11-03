<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보수정 - 인증화면</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/info.css">


<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/260e91bab5.js" crossorigin="anonymous"></script>
<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->
<style>

#section2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: black;
    margin-left: 450px;
    }
#section {	  /* 제목 */
    padding: 100px;
    margin-left: 70px;
    margin-top: 100px;
    text-align: center;
}
#container {
   width: 100%;
   margin: 0 auto;
}
#contents {
   max-width: 1240px;
   min-width: 1240px;
   width: 100%;
   margin: -53px auto;
   min-height: 800px;
}
</style>
</head>
<body style="background-color: linen;">

<div class ="wrap">
   <!-- header 시작 -->
	<%@ include file="/common/header.jsp" %>
   <!-- header 끝 -->

   <!-- 회원수정 컨텐츠 시작 -->
   
     <div id="container">
        <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section">
            <h1 style="font-family:'Gowun_Batang',serif">회원정보 수정- 인증화면</h1>
         </div><!-- section1 -->

         <!-- 상단 중앙2 시작 -->
         <div id="section2"> 
            <div id="s2_inner">
               <div class="join">
                  <form name="modifyform" action="${path}/modifyDetailAcion.do" method="post">
                    <%
                    	String customerID = (String) request.getSession().getAttribute("customerID");
                    	out.print("customerID =>" + customerID);
                    %>
                   
                     <table>
                        <colgroup>
                           <col style="width : 200px;">
                           <col style="width : 200px;">
                        </colgroup>
                        <tr>
                           <th colspan="2" style="align:center;">
                           회원수정을 위해 <span style="color:#FF82AA;"><b><%=customerID%></b></span>님의 비밀번호를 입력하세요.
                           </th>
                        </tr>
                        
                        
                        <tr>
                           <th> * 비밀번호</th>
                           <td colspan="2">
                           <input type="password"class="input" name="password" size="20" placeholder="공백없이 20자 이내로 작성" required>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3" style="border-bottom: none;">
                              <br>
                              <div align="right">
                                 <input type="submit" value="회원정보 수정" style="margin-left:10px; background:black;color: linen; border-radius: 20px;  padding: 7px;">
                                 <input type="button" class="button" value="수정취소" onclick="window.location='${path}/main.do'"style="margin-left:10px; background:black;color: linen; border-radius: 20px;  padding: 7px;">
                              </div>
                        </tr>
                     </table>
                  </form>
               </div>
            </div><!-- s2_inner -->
         </div><!-- section2 -->
        </div><!-- contents -->
     </div><!-- container -->
  
  
   <!-- 회원수정 컨텐츠 종료 -->

   
   <!-- footer시작 -->
	<%@ include file="/common/footer.jsp" %>
   <!-- footer 끝 -->   
</div>
</body>
</html>