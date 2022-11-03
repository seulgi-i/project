<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>
<!-- 반응형웹 적용 -->
<title>중복확인폼</title>

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->

</head>
<body>

   <!-- header : 새창이므로 없음 -->
   
   <!-- 컨텐츠 시작 -->
   
			<!-- 상단 중앙2 시작 -->
				
			<form name="join_search_form" action="${path}/join_form.do" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="name" value="${dto2.name}">
				<input type="hidden" name="account" value="${dto2.account}">
				<input type="hidden" name="birthday" value="${dto2.birthday}">
				<input type="hidden" name="phone" value="${dto2.phone}">
			
			<!-- 계좌가 존재하는 경우 : 계좌목록 및 정보 출력 -->
			<%-- <c:forEach var="dto" items="${list}"> --%> 
			
			<c:if test="${dto.ID==null}">
				<table class="style color">
					<tr>
		   	 			<th width="30%">계좌번호</th>
		   	 			<th width="12%">계좌종류</th>
		   	 			<th width="12%">계좌상태</th>
		   	 			<th width="20%">계좌개설일</th>
		   	 			<th width="15%">선택</th>
		   	 		</tr>
					<tr>
						<td width="30%">${dto.ACCOUNT}</td>
						<td width="12%">${dto.ACCOUNT_TYPE}</td>
						<td width="12%">${dto.ACCOUNT_STATE}</td>
						<td width="20%">${dto.NEW_DATE}</td>
						<td width="15%">
							<input class="class="button medium color bottom-2" type="submit" value="가입진행">			
						</td>
					</tr>
				</table>
			</c:if>
			
			<!-- 계좌X : 회원이 아닐경우 -->
			<c:if test="${dto.ID!=null}">
				<table class="style color">
					<tr>
		   	 			<th width="30%">계좌번호</th>
		   	 			<th width="12%">계좌종류</th>
		   	 			<th width="12%">계좌상태</th>
		   	 			<th width="20%">계좌개설일</th>
		   	 			<th width="15%">선택</th>
		   	 		</tr>
					<tr>
						<td colspan="5" text-align="center">
							이미 등록된 회원입니다
						</td>
					</tr>
				</table>
			</c:if>			
				
			</form>
		   		
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
  
   
   <!-- footer 끝 -->


</body>
</html>