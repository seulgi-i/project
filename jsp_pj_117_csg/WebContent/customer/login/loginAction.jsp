<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link rel="stylesheet"
	href="${path}/resources/css/customerCss/login.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<style>

table {
    caption-side: bottom;
    border-collapse: collapse;
    margin-left: 141px;
}
h5 {
	font-size: 12px;
	font-weight: normal;
}

input[type="text"], input[type="password"] {
	padding: 0px 15px;
}

#member-wrap h5 .login_tab {
	float: right;
	display: none;
}

#member-wrap h5 {
	margin: 0 170px 7px;
}

input[type="radio"] {
	width: 20px;
	height: 20px;
	margin-right: 5px;
	border: 1px solid #000;
	border-radius: 5px;
	background: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}

input[type="checkbox"] {
	width: 20px;
	height: 20px;
	margin-right: 29px;
	border: 1px solid #000;
	border-radius: 9px;
	background: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}

#member-wrap .login .save-wrap label {
	display: inline-block;
	vertical-align: middle;
	margin-right: -210px;
}

img {
	max-width: 100%;
	height: auto !important;
}

#member-wrap .login .save-wrap {
	margin: 0px 173px 20px;
	font-size: 12px;
	display: inline-block;
	width: 49%;
}

label {
	display: inline-block;
	margin-left: -30px;
}

a {
	text-decoration: none;
	color: #000;
}

.forgot {
	text-align: center;
	font-size: 12px;
	padding-bottom: 39px;
	margin-left: 40px;
}

#member-wrap .login .btn-wrap {
	border: 1px solid #000;
	border-radius: 28px;
	height: 40px;
	line-height: 32px;
	text-align: center;
	display: block;
	font-size: 13px;
	margin: 0 0 17px;
	padding: 3px;
	width: 300px;
	margin-left: 168px;
	background: black;
	color: linen;
}

#member-wrap input[type="text"] {
	border: 1px solid #000;
	border-radius: 0;
	height: 48px;
	line-height: 46px;
	margin: 0 199px 15px;
	width: 50%;
	font-size: 13px;
}

#member-wrap input[type="password"] {
	border: 1px solid #000;
	border-radius: 0;
	height: 48px;
	line-height: 46px;
	margin: 0 199px 15px;
	width: 50%;
	font-size: 13px;
}

input, select, textarea {
	font-size: 100%;
	vertical-align: middle;
	border-radius: 0;
	font-family: arial, helvetica, sans-serif;
}

input {
	border-radius: 0;
	background: none;
	border: 0;
	height: 24px;
	line-height: 24px;
}

div {
	vertical-align: baseline;
}

#member-wrap {
	max-width: 600px;
	margin: 60px auto;
}

* {
	box-sizing: border-box;
}

div {
	vertical-align: baseline;
}
</style>
<script type="text/javascript">

	
</script>

<title></title>
</head>
<body style="background-color: linen;">

   <%@ include file="/common/nav.jsp" %>

	<!-- 로그인 컨텐츠 시작 -->
	<div id="section">
		<h1
			style="font-family: 'Gowun_Batang', serif; margin: 150px 0 auto; text-align: center;">login</h1>

	</div>

	<!-- 상단 중앙1 시작 -->

	<div class="cont-wrap">

		<div id="member-wrap">
			<!--
        $defaultReturnUrl = /index.html
        $forbidIpUrl = member/adminFail.html
    -->
			<div class="member">
				<div class="login">

					<form name="loginform" action="loginAction.do" method="post" onsubmit="return signInChk();">
						<!-- 세션이 없는 경우 : 첫 진입, 로그인 실패 -->
						<c:if test="${sessionScope.customerID == null}">
							<table>
								<tr>
									<td colspan="2" align="center">
										<h3>
											<c:choose>
												<c:when test="${selectCnt == -1}">
																비밀번호가 다릅니다. 다시 확인하세요.
															</c:when>
												<c:when test="${selectCnt == 0}">
																존재하지 않는 아이디입니다. 다시 확인하세요.
															</c:when>
											</c:choose>
										</h3>
									</td>
								</tr>


									<div>
									<label class="id"> <input id="id" name="id"
										class="inputTypeText" placeholder="ID" type="text"></label><br>
									<label class="password"> <input id="password"
										name="password" type="password" placeholder="Password"></label>

									<div class="save-wrap"></div>
									</div>
								


								<div class="btn-wrap">
									<input type="submit" value="로그인" style="color: white;">
								</div>
								<div class="btn-wrap">
									<input type="button" class="button" value="회원가입"
										onclick="window.location='join.do'" style="color: white;">
								</div>
							</table>
						</c:if>
						<c:if test="${sessionScope.customerID != null}">
							<c:if test="${sessionScope.customerID == 'admin' }">
								<script type="text/javascript">
											alert("관리자 로그인");
											window.location="${path}/boardList.bo";
										</script>
							</c:if>
							<table>
								<tr>
									<td align="center" style="width: 300px;"><br>
									<br> <span style="color: brown;"><b>${sessionScope.customerID}님</b></span>
										환영합니다 <br>
									<br></td>
								</tr>
								<td><br>
									<div align="center">
										<input type="button" value="회원 정보 수정"
											onclick="window.location='modifyCustomer.do'"> <input
											type="button" value="회원 탈퇴"
											onclick="window.location='deleteCustomer.do'"> <input
											type="button" value="로그아웃"
											onclick="window.location='logout.do'">
										<!-- 바깥이 ""이면 안은 '', 바깥이 ''이면 안은 "" -->
									</div></td>

							</table>
						</c:if>
						</form>
				</div>

			</div>
		</div>
	</div>
	<!-- container -->

	<!--로그인 컨텐츠 종료 -->


	<!-- 푸터 -->
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>