<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<title>중복확인폼</title>

<link rel="stylesheet" href="${path}/resources/css/chaey/confirmIdAction.css">
<script src="${path}/resources/js/chaey/join.js"></script>

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->

</head>
<body onload="confirmIdFocus();">

   <!-- header : 새창이므로 없음 -->
   
   <!-- 컨텐츠 시작 -->
   
			<!-- 상단 중앙2 시작 -->
				
			<form name="confirmform" action="${path}/confirmIdAction.do" method="post" onsubmit="return confirmIdCheck();">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
			<!-- id 중복인경우 -->
			<c:if test="${selectCnt ==1 }">
				<table>
					<tr>
						<th colspan="2" align="center">
							<span>${id}</span>는 사용 할 수 없습니다
					</tr>
				
					<tr>
						<th> * 아이디  </th> <!-- *은 필수라는 의미를 표시하기 위함 -->
						<td>
							<input type="text" class="input" name="id" maxlength="20" style="width:250px" placeholder="공백없이 15자 이내로 작성" autofocus required>
							<!-- 중복확인 버튼 하나떄문에 css style 설정하기 애매하므로 행에서 직접 style을 설정하기도한다 -->
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input class="class="button medium color bottom-2" type="submit" value="확인">
							<input class="class="button medium color bottom-2" type="reset" value="취소" onclick="self.close();">	
							<!-- 중복확인 버튼 하나떄문에 css style 설정하기 애매하므로 행에서 직접 style을 설정하기도한다 -->
						</td>
					</tr>
				</table>
				
			
			
			</c:if>
			
			<!-- 중복 아닐때 -->
			<c:if test="${selectCnt !=1}">
				<table width="600px">
					<tr>
						<th colspan="2" align="center">
							<span>${id}</span>는 사용 할 수 있습니다
					</tr>
					
					<tr>
						<th>
							<input class="input" type="button" value="확인" onclick="setId('${id}');">
						</th>
					
					
					</tr>
					
					
					
				</table>
				
			</c:if>			
				
			</form>
		   		
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
  
   
   <!-- footer 끝 -->


</body>
</html>