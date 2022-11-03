function selectEmailChk(){
	if(document.joinform.email3.value!="0"){
		document.joinform.email2.value=document.joinform.email3.value;
	}else{
		document.joinform.email2.value="";
		document.joinform.email2.focus();
	}
}

/**
 * 회원가입 validation check
 */

//필수항목 체크
function signInCheck(){
	//중복확인
	if(!document.joinform.id.value){
		alert("아이디 입력");
		document.joinform.id.focus();
		return false;
	}
	
	//비번
	else if(!document.joinform.password.value){
		alert("비밀번호 입력");
		document.joinform.password.focus();
		return false;
	}
	
	//비번확인
	else if(!document.joinform.repassword.value){
		alert("비밀번호 다시 입력");
		document.joinform.repassword.focus();
		return false;
	}
	
	//비번 일치확인 
	else if(document.joinform.password.value!=document.joinform.repassword.value){
		alert("비밀번호가 일치하지않습니다");
		document.joinform.repassword.focus();
		return false;
	}
	
//	//name
//	else if(!document.joinform.name.value){
//		alert("이름 입력");
//		document.joinform.name.focus();
//		return false;
//	}
	
	//birthday
	else if(!document.joinform.birthday.value){
		alert("생년월일 입력");
		document.joinform.birthday.focus();
		return false;
	}
	
	//address 
	else if(!document.joinform.address.value){
		alert("주소 입력");
		document.joinform.address.focus();
		return false;
	}
	
	//email1
	else if(!document.joinform.email1.value){
		alert("이메일 입력");
		document.joinform.email1.focus();
		return false;
	}
	
	//email2 형식 : email2.value 미존재 && 직접입력 => 형식 불일치
	else if(!document.joinform.email2.value && document.joinform.email3.value==0){
		alert("이메일 형식이 일치하지 않습니다");
		document.joinform.email2.focus();
		return false;
	}
	
	
	
	
	//2-1 .join.jsp 폼 바로아래 추가
	//<input type="hidden" name="hiddenId" value="0">
	//hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭안함 / 1:클릭함)
	
	//2-2 중복확인 버튼 클릭하지 않은경우 "중복 확인 버튼 눌러주세요"
	else if(document.joinform.hiddenId.value == "0"){
		alert("중복확인 해주세요");
		document.joinform.dupChk.focus();
		return false;
	}
	
}

//function idFocus(){
//	document.joinform.id.focus();
//}


//아이디 중복확인 페이지
//1.중복확인 페이지 오픈
function confirmId(){
	
	if(!document.joinform.id.value){
		alert("아이디를 입력하세요");
		document.joinform.id.focus();
		return false;
	}
	
	var url="/upbank/confirmIdAction.do?id="+document.joinform.id.value;
	window.open(url, "confirm", "menubar=no width=600, height=200");
}


//////////////// 중복확인 /////////////////
//3 중복확인창 포커스
function confirmIdFocus(){
	document.confirmform.id.focus();
}

function confirmIdCheck(){
	if(!document.joinform.id.value){
		alert("아이디를 입력하세요");
		document.confirmform.id.focus();
		return false;
	}
	
}

//중복확인에서 가입창으로 아이디값 전달
/*
 * opener : window객체의 open() 메서드로 열린 새창(=중복확인창)에서 부모창(가입폼)에 접근할 떄 사용
 * join.jsp의 hiddenId : 중복확인이 되었으므로 값을 1로 부여
 * 그후 열렸던 창(자기자신)을 닫아라
 */
function setId(id){
	opener.document.joinform.id.value = id;
	opener.document.joinform.hiddenId.value="1";
	self.close();
}
