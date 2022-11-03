<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원탈퇴 - 인증 및 탈퇴처리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/join.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/260e91bab5.js" crossorigin="anonymous"></script>
<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="/jsp_pj_117/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->

</head>
<body style="background-color: linen;">

<div class ="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->

   <!-- 회원탈퇴 컨텐츠 시작 -->
   
     <div id="container">
        <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 align="center">회원탈퇴 - 인증 및 탈퇴처리</h1>
         </div><!-- section1 -->

         <!-- 상단 중앙2 시작 -->
         <div id="section2"> 
            <div id="s2_inner">
               <div class="join">
                  <form name="passwordform">
                  <!-- 아이디와 비밀번호 일치 : 1 -->
                  <c:if test="${selectCnt == 1}">
                  	  <!-- 탈퇴 실패 -->
                  	  <c:if test="${deleteCnt == 0}">
	                  	  <script type="text/javascript">
	                          alert("회원 탈퇴 실패!!");
	                       </script>
                  	  </c:if>
             
                  <!-- 탈퇴 성공 - 세션삭제, main.jsp로 이동 -->
                  <c:if test="${deleteCnt != 0}">
                  <%
                  request.getSession().invalidate();   //모든 세션 삭제
                    %> 
                       <script type="text/javascript">
                          setTimeout(function(){
                             alert("회원탈퇴처리 되었습니다. 그동안 이용해주셔서 감사합니다.");
                             window.location="${path}/main.do";
                          },1000);
                          </script>
                          </c:if>
                    </c:if>
                    
					<c:if test="${selectCnt != 1}">
						<script type="text/javascript">
	                         alert("인증 실패");
	                         window.location="${path}/Mypage.do";
	                      </script>
					</c:if>

                     <table>
                        <tr>
                        </tr>
                     </table>
                  </form>
               </div>
            </div><!-- s2_inner -->
         </div><!-- section2 -->
        </div><!-- contents -->
     </div><!-- container -->
  
  
   <!-- 회원탈퇴 컨텐츠 종료 -->

   <br><br><br><br><br><br>
   <!-- footer시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->   
</div>
</body>
</html>