<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입 폼</title>

<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">

<!-- 1.fontawesome.com에서 인증(start for free) 2.이미지 사용가능 -->
<script src="https://kit.fontawesome.com/44bbd7835d.js" crossorigin="anonymous"></script>

<!-- 3-3-2. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩 할때까지 html이 브러우저창에  표시가 안되는 것을 방지. -->

<!-- 3-3. -->
<script src="${path}/resources/js/customerJs/join.js" defer></script>


</head>
<body>

	<form name="confirmform" action="${path}/confirmIdAction.do" method="post" onsubmit="return confirmIdCheck();">
<!-- id중복 -->

	<c:if test="${selectCnt == 1}">
		<table>
				<tr>
					<th colspan="2" align="center">
						<span>${id}</span>는 사용할 수 없습니다.
						
					</th>
				</tr>
				<tr>
					<th>아이디 : </th>
					<td>
							<input type="text" class="input" name="id" maxlength="20" 
							style="width:150px" placeholder="공백없이 15자 이내로 작성" autofocus required> 
					</td>
				</tr>
				<tr>
					<td colspan="2">
							<br> 
							<input class="input" type="submit" value="확인"> 
							<input class="input" type="reset"  value="취소" onclick="self.close();">
					</td>
				</tr>
			</table>
		</c:if>

		

 	<!-- id 중복 아닐 때 -->
	<c:if test="${selectCnt != 1}">
		<table width="450px">
			<tr>
				<th colspan="2" align="center" width="150px"x	>
				<span>${id}</span>는 사용할 수 있습니다.</th>
			</tr>
			
			<tr>
				<th>
					<input class="input" type="button" value="확인" onclick="setId('${id}');">
					<input class="input" type="reset"  value="취소" onclick="self.close();">
				</th>			
			</tr>
		</table>		
	</c:if>

	</form>

</body>
</html>