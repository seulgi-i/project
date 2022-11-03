<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pj.mvc.jsp.dto.CustomerDTO" %>
<%@ include file ="/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원수정 - 상세 페이지</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/join.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">
<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/44bbd7835d.js" crossorigin="anonymous"></script>


<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->


<!-- 3-3. -->
<script src="${path}/resources/js/customerJs/update.js" defer></script>
<style>

.table_div table th, td {
    height: 60px;
    padding-left: 10px;
}
input {
text-size : 10px;
}
#btn{
margin-left:10px;
 background:black;
 color: linen;
  border-radius: 20px;  
  padding: 5px;
 }
 
 table {
    caption-side: bottom;
    border-collapse: collapse;
    margin-left: 100px;
    margin-top: 40px;
}
</style>

</head>
<body style="background-color: linen;">

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/common/header.jsp" %>
      <!-- header 끝 -->

      <!-- 컨텐츠 시작 -->

      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <h1 align="center">회원수정</h1>
            </div>
            <!-- section1 -->

            <!-- 상단 중앙2 시작 div는 사각형으로 단락을 구분짓는다-->
            <div id="section2">
               <div id="s2_inner">
                  <div class="join">
                     <form name="updateform" action="${path}/modifyCustomerAction.do" method="post" >
		                     <c:if test="${selectCnt == 1}">
		                     	    <input type="hidden" name="hiddenId" value="0">
                        
			                        <table>
			                           <colgroup>
			                              <col style="width: 150px;">
			                              <col style="width: auto;">
			                              <col style="width: auto;">
			                           </colgroup>
			                           <tr>
			                              <th>* 아이디</th>
			                              <td>
			                              		${dto.getId()}
			                              </td>
			                           </tr>
			                           <tr>
			                              <th>* 비밀번호</th>
			                              <!-- class가있다는 건 css로 주겠다 -->
			                              <!--인풋태그명 디티오 멤버변수, 컬럼명이  일치해야한다  -->
			                              <td colspan="2">
			                                 <input type="password" class="input" name="password" size="20" placeholder="공백없이 20자 이내로 작성" value="${dto.getPassword()}">
			                              </td>
			
			                           </tr>
			                           <tr>
			                              <th>* 비밀번호(확인)</th>
			                              <!-- class가있다는 건 css로 주겠다 -->
			                              <!--인풋태그명 디티오 멤버변수, 컬럼명이  일치해야한다  -->
			                              <td colspan="2">
			                                 <input type="password" class="input" name="repassword" size="20" placeholder="비밀번호 확인"value="${dto.getPassword()}">
			                              </td>
			                           </tr>
			                           <tr>
			                              <th>* 이름</th>
			                              <td colspan="2">
			                                 <input type="text" class="input" name="name" size="20" value="${dto.getName()}">
			                              </td>
			                           </tr>
			
			                           <tr>
			                              <th>* 생년월일</th>
			                              <td colspan="2">
			                                 <input type="date" class="input" name="birthday" size="8" placeholder="생년월일 8자리"value="${dto.getBirthday()}">
			                              </td>
			                           <tr>
			                              <th>* 주소</th>
			                              <td colspan="2">
			                                 <input type="text" class="input" name="address" size="60"value="${dto.getAddress()}">
			                              </td>
			                           </tr>
			
			                           <tr>
			                              <th>* 핸드폰</th>
			                              <td>
			                              <c:if test="${dto.getHp() == null}">
			                                <input type="text" class="input" name="hp1" maxlength="3" style="width: 50px"> 
			                                 - 
			                                 <input type="text" class="input" name="hp2" maxlength="4" style="width: 50px">
			                                 - 
			                                 <input type="text" class="input" name="hp3" maxlength="4" style="width: 50px">
			                              </c:if>
			                              
			                                <c:if test="${dto.getHp() != null}">
<!-- 			                                테이블 hp: '010-1111-2222' cf)입력화면 : 쪼개져있다. (hp1-hp2-hp3)
												String hp = dto.getHp();
			                              		String [] hpArr = hp.split("-"); -->
			                              		<c:set var="hpArr" value="${fn:split(dto.getHp(), '-')}"  />
			                              		
					                         <input type="text" class="input" name="hp1" maxlength="3" style="width: 50px" value="${hpArr[0]}"> 
			                                 - 
			                                 <input type="text" class="input" name="hp2" maxlength="4" style="width: 50px" value="${hpArr[1]}"> 
			                                 - 
			                                 <input type="text" class="input" name="hp3" maxlength="4" style="width: 50px" value="${hpArr[2]}"> 
			                                </c:if>
			                               
											
			                              </td>
			                           </tr>
			
			                           <tr>
			                              <th>* 이메일</th>
			                              <td>
			                              
			                             	 <!-- 
			                             	 String email = dto.getEmail();
			                              	String[]emailArr = email.split("@"); -->
			                              	<c:set var="emailArr" value="${fn:split(dto.getEmail(), '@')}"  />
			                              

			                                 <input type="text" class="input" name="email1" maxlength="20" style="width: 100px" value="${emailArr[0]}"> 
			                                 @ 
			                                 <input type="text" class="input" name="email2" maxlength="20" style="width: 100px"value="${emailArr[1]}">
			                                 <select class="input" name="email3" style="width: 100px" onchange="selectEmailChk();">
			                                    <option value="0">직접입력</option>
			                                    <option value="naver.com">네이버</option>
			                                    <option value="google.con">구글</option>
			                                    <option value="daum.net">다음</option>
			                                    <option value="nate.com">네이트</option>
			                                 </select>
			                              </td>
			                           </tr>
			
			                           <tr>
			                              <td colspan="3" style="border-bottom: none;">
			                                 <br>
			                                 <div align="right">
			                                    <input type="submit" value="회원수정"style="margin-left:10px; background:black;color: linen; border-radius: 20px;  padding: 7px;"> 
			                                    <input type="reset" value="초기화"style="margin-left:10px; background:black;color: linen; border-radius: 20px;  padding: 7px;"> 
			                                    <input type="button" class="button" value="수정취소" onclick="window.location='${path}/main.do'"style="margin-left:10px; background:black;color: linen; border-radius: 20px;  padding: 7px;">
			                                 </div>
			                           </tr>
			                        </table>
					               </c:if>
					               
					               <c:if test="${selectCnt != 1}">
					              		<script type="text/javascript">
												alert("인증실패");
												window.location="${path}/modifyCustomer.do";
					                    	</script>
		              				 </c:if>
		                     
		               
                     </form>
                  </div>
               </div>
               <!-- s2_inner -->
            </div>
            <!-- section2 -->

         </div>
         <!-- contents -->

      </div>
      <!-- container -->

      <!--회원가입 컨텐츠 종료 -->


      <!-- footer시작 -->
      <%@ include file="/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>