<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>예금 가입</title>
<meta name="description"
	content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">


<link rel="shortcut icon" href="images/favicon.ico">


<script type="text/javascript">
// 숫자가 아닌 정규식
var replaceNotInt = /[^0-9]/gi;
var replaceNotInt2 = /[^0-9]/gi;

$(document).ready(function(){
    $("#ACCOUNT_PW").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });
    
    $("#ACCOUNT_PW_RE").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });

});
function input_Text12(){
	    document.getElementById("y_end_date").value = '12';
	}	
function input_Text24(){
	    document.getElementById("y_end_date").value = '24';
	}
function input_Text36(){
	    document.getElementById("y_end_date").value = '36';
	}
function input_Text1000(){
	document.getElementById("y_money").value = '10000000';
}
function input_Text500(){
	document.getElementById("y_money").value = '5000000';
}
function input_Text300(){
	document.getElementById("y_money").value = '3000000';
}
function input_Text100(){
	document.getElementById("y_money").value = '1000000';
}



$(function() {
	var pw = $('#ACCOUNT_PW').val();
	$("#sumit_b").click(function() {
		document.depositJoinForm.action="${path}/depositJoinAction.do?${_csrf.parameterName}=${_csrf.token}";
		document.depositJoinForm.submit();
	});
});


$(document).ready(function() {

	//입출금계좌별 잔액 조회
	$('#account').change(function(){
		var acc = $(this).val();
		var bal = $("#" + acc).attr('title');
		var result = null;
		if(bal != null) {
			result = "출금가능금액:&nbsp;&nbsp;" + bal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		} else {
			result = "출금가능금액:&nbsp;&nbsp;0원";
		}
		$("#balance").html(result);
	});
}); 
</script>
<style>
#btn {
	background: transparent;
	border: 1px solid grey;
	margin-left: 3;
}
</style>
</head>
<body>

	<div id="wrap" class="boxed">

		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
		<!-- <<< End Header >>> -->
		<!-- <<< End Header >>> -->

		<div class="page-title">
			<div class="container clearfix">

				<div class="sixteen columns">
					<h1>예금</h1>
				</div>

			</div>
			<!-- End Container -->
		</div>
		<!-- End Page title -->

		<!-- Start main content -->
		<div class="container main-content clearfix">
			<!-- Start Sidebar Widgets -->
			<div class="five columns sidebar bottom-3">

				<!-- Search Widget -->
				<div class="widget search">
					<h3 class="title bottom-1">Search</h3>
					<!-- Title Widget -->
					<form action="#">
						<input type="text" class="text-search" value="Search in blog"
							onBlur="if(this.value == '') { this.value = 'Search in blog'; }"
							onfocus="if(this.value == 'Search in blog') { this.value = ''; }" />
						<input type="submit" value="" class="submit-search" />
					</form>
				</div>
				<!-- End -->

				<!-- Categories Widget -->
				<div class="widget categories">
					<h3 class="title bottom-1">상품/가입</h3>
					<!-- Title Widget -->
					<ul class="arrow-list">
						<c:if
							test="${sessionScope.customerID != null && sessionScope.customerID != 'admin'}">
							<li><a href="${path}/depositMain.do">메인</a></li>
							<li><a href="${path}/depositList.do">예금 상품/가입</a></li>
							<li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
							<li><a href="${path}/terminateList.do">해지</a></li>
						</c:if>
						<!--  로그인 안 한 경우-->
						<c:if test="${sessionScope.customerID == null }">
							<li><a href="${path}/depositMain.do">메인</a></li>
							<li><a href="${path}/depositList.do">예금 상품/가입</a></li>
							<li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
							<li><a href="" id="loginalert">해지</a></li>
						</c:if>
					</ul>
					<!-- End arrow-list -->
				</div>
				<!-- End -->

				<!-- Text Widget -->
				<div class="widget">
					<h3 class="title bottom-1">고객센터</h3>
					<!-- Title Widget -->
					<p></p>
				</div>
				<!-- End -->
			</div>
			<!-- End Sidebar Widgets -->
			<!-- Start Posts -->
			<div class="eleven columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">

					<h3 class="title bottom-1">${dto2.y_name}</h3>

					<h5>정보입력</h5>
					<hr style="border: solid 2px #378AC4">
					<br>
					<!-- Title Post -->
					<form name="depositJoinForm" action="${path}/depositJoinAction.do"
						method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="hidden"
							name="y_name" value="${dto2.y_name}"> <input
							type="hidden" name="y_type" value="${dto2.y_type}"> <input
							type="hidden" name="ACCOUNT_TYPE" value="${dto2.ACCOUNT_TYPE}">

						<table class="style color" width="600px">
							<tr>
								<th>가입기간</th>
								<td><input type="text"
									style="margin-top: 15px; text-align: center; height: 30px;" size="20"
									name="y_end_date" id="y_end_date" placeholder="1~36개월, 월단위">개월
									<c:if test="${dto2.y_max_date==36}">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text12()" value="12개월">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text24()" value="24개월">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text36()" value="36개월">
									</c:if> <c:if test="${dto2.y_max_date==24}">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text12()" value="12개월">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text24()" value="24개월">
									</c:if> <c:if test="${dto2.y_max_date==12}">
										<input type="button" id="btn" name="dupChk"
											onclick="input_Text12()" value="12개월">
									</c:if></td>
							</tr>

							<tr>
								<th>가입금액</th>
								<br>
								<td><input type="text"
									style="margin-top: 15px; text-align: center; height: 30px;" size="25"
									name="y_money" id="y_money" placeholder="최소100만원 이상, 원단위">원
									<input type="button" id="btn" name="dupChk"
									onclick="input_Text1000()" value="1000만"> <input
									type="button" id="btn" name="dupChk" onclick="input_Text500()"
									value="500만"> <input type="button" id="btn"
									name="dupChk" onclick="input_Text300()" value="300만"> <input
									type="button" id="btn" name="dupChk" onclick="input_Text100()"
									value="100만"> <br>
								<br></td>
							</tr>
						</table>

						<hr style="border: solid 2px #378AC4">
						<br>
						<br>
						<table class="style color" width="600px">
						<tr>
							<th>입출금 계좌 확인</th>
							<td><select name="account" id="account" varStatus="status">
									<option value="">입출금 통장</option>
									<c:forEach var="dto" items="${list}">
										<option value="${dto.ACCOUNT}" id="${dto.ACCOUNT}"
											title="${dto.BALANCE}">${dto.PRODUCT_NAME}<span>&nbsp;:&nbsp;</span>${dto.ACCOUNT}</option>
										<input type="hidden" name="product_name" value="${dto.PRODUCT_NAME}">
									</c:forEach>
							</select></td>
							</tr>
							<tr>
								<th>출금가능금액</th>
								<td style="color: blue" id="balance">&nbsp;&nbsp; 원</td>
							</tr>
							<tr>
								<th>계좌 비밀번호</th>
								<td><input type="password" id="2ACCOUNT_PW"
									name="2ACCOUNT_PW" maxlength="4" size="42"  style="height: 30px;" placeholder="숫자 4자리를 입력하세요"
									required></td>
							</tr>
							<tr>
								<th>신규 비밀번호</th>
								<td><input type="password" id="ACCOUNT_PW"
									name="ACCOUNT_PW" maxlength="4" size="42"  style="height: 30px;"  placeholder="숫자 4자리를 입력하세요"
									required></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" id="ACCOUNT_PW_RE"
									name="ACCOUNT_PW_RE" maxlength="4"  size="42" style="height: 30px;"  placeholder="숫자 4자리를 입력하세요"
									required></td>
						</table>

						<div align="center">
							<input type="submit" class="button1 small color" id="sumit_b"
								value="가입하기" style="text-size: 14px"> <input type="reset" class="button1 small black" value="초기화"
								style="text-size: 14px"> <input type="button" class="button1 small color" value="목록"
								onclick="window.location='${path}/depositList.do' ">
						</div>
					</form>

				</div>
			</div>

		</div>
		<!-- End contents -->

	</div>
	<!-- End horizontal-tabs -->










	<div class="clearfix"></div>


	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<!-- <<< End Footer >>> -->
	<!-- <<< End Footer >>> -->

</body>
</html>