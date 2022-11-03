//필수항목 체크
function signInCheck(){
	//이름
	if(!document.join_whether_form.name.value){
		alert("이름을 입력하세요");
		document.join_whether_form.id.focus();
		return false;
	}
	
	//생년월일
	if(!document.join_whether_form.birthday.value){
		alert("생년월일을 입력하세요");
		document.join_whether_form.birthday.focus();
		return false;
	}
	
	//계좌번호
	if(!document.join_whether_form.account.value){
		alert("계좌번호를 입력하세요");
		document.join_whether_form.account.focus();
		return false;
	}
	
	//계좌비밀번호
	if(!document.join_whether_form.account_pw.value){
		alert("비밀번호를 입력하세요");
		document.join_whether_form.account_pw.focus();
		return false;
	}
	
	//핸드폰번호1
	if(!document.join_whether_form.phone1.value){
		alert("핸드폰 번호를 입력하세요");
		document.join_whether_form.phone1.focus();
		return false;
	}
	
	//핸드폰번호2
	if(!document.join_whether_form.phone2.value){
		alert("핸드폰 번호를 입력하세요");
		document.join_whether_form.phone2.focus();
		return false;
	}
	
	//핸드폰번호3
	if(!document.join_whether_form.phone3.value){
		alert("핸드폰 번호를 입력하세요");
		document.join_whether_form.phone3.focus();
		return false;
	}
	
}

//function idFocus(){
//	document.joinform.id.focus();
//}


//아이디 중복확인 페이지
//1.중복확인 페이지 오픈
//function confirmId(){
//	
//	if(!document.joinform.id.value){
//		alert("아이디를 입력하세요");
//		document.joinform.id.focus();
//		return false;
//	}
//	
//	var url="/upbank/confirmIdAction.do?id="+document.joinform.id.value;
//	window.open(url, "confirm", "menubar=no width=600, height=200");
//}


