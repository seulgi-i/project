/**
 * 회원가입 validation check
 */

function idFocus(){
   document.joinform.id.focus();
}

// 필수항목 체크
function signInCheck() {
   // id
   if (!document.joinform.id.value) {
      alert("아이디를 입력하세요.");
      document.joinform.id.focus();
      return false;

      // password
   } else if (!document.joinform.password.value) {
      alert("비밀번호를 입력하세요.");
      document.joinform.password.focus();
      return false;

      // repassword
   } else if (!document.joinform.repassword.value) {
      alert("비밀번호 확인을 입력하세요.");
      document.joinform.repassword.focus();
      return false;

      // 비밀번호 체크
   } else if (document.joinform.password.value != document.joinform.repassword.value) {
      alert("비밀번호가 일치하지 않습니다.");
      document.joinform.repassword.value = "";
      document.joinform.repassword.focus();
      return false;

      // name
   } else if (!document.joinform.name.value) {
      alert("이름을 입력하세요.");
      document.joinform.name.focus();
      return false;

      // birthday
   } else if (!document.joinform.birthday.value) {
      alert("생일을 입력하세요.");
      document.joinform.birthday.focus();
      return false;

      // address
   } else if (!document.joinform.address.value) {
      alert("주소를 입력하세요.");
      document.joinform.address.focus();
      return false;

      // email
   } else if (!document.joinform.email1.value) {
      alert("이메일을 입력하세요.");
      document.joinform.email1.focus();
      return false;

      // email2.value 미존재&& 직접입력 => 이메일 형식 불일치
   } else if (!document.joinform.email2.value
         && document.joinform.email3.value == 0) {
      alert("이메일 형식에 일치하지 않습니다.");
      document.joinform.email2.focus();
      return false;
   }

   // 2-1. join.jsp 폼 바로 아래 추가
   // <input type="hidden" name="hiddenId" value="0">
   // hiddenId : 중복확인 버튼 클릭 여부 체크(0: 클릭안함, 1: 클릭함)

   // 2-2. 중복확인 버튼 클릭하지 않는 경우 "중복확인 해주세요."
   else if (document.joinform.hiddenId.value == "0") {
      alert("중복확인 해주세요.");
      document.joinform.dupChk.focus();
      return false;
   }
}

// 아이디 중복확인 페이지
// 1. 중복확인 페이지 open
function confirmId() {
   if (!document.joinform.hiddenId.value) {
      alert("아이디를 입력하세요.");
      document.joinform.id.focus();
      return false;
   }
   var url = "/pj_117_csg/confirmIdAction.do?id=" + document.joinform.id.value;
   window.open(url, "confirm", "menubar=no, width=650, height=400");
}

// ---------------------중복확인----------------
// 3. 중복확인창 포커스
function confirmIdFocus() {
   document.confirmform.id.focus();

}

function confirmIdCheck() {
   if (!document.confirmform.id.value) {
      alert("아이디를 입력하세요.");
      document.confirmform.id.focus();
      return false;
   }
}

// 4. 자식창에서 부모창으로 id 값 전달
function setId(id) {

   /*
    * opener : window 객체의 open() 메서드로 열린 새 창(=중복확인창)에서 부모창(= join.jsp 폼)에 접근할 때
    * 사용 hiddenId : 중복확인 버튼 클릭 여부 체크(0: 클릭안함, 1: 클릭함) self.close(); 내 창 닫기
    */

   opener.document.joinform.id.value = id;
   opener.document.joinform.hiddenId.value = "1";
   self.close();
}

// --------이메일 주소를 select 박스로 선택-----------------------
function selectEmailChk() {
   
   //직접입력이 아닌 경우 email3.value를 email2.value로 초기화
   if (document.joinform.email3.value != 0) {
      document.joinform.email2.value = document.joinform.email3.value;
   
   //직접 입력할 경우 - email2 초기화   
   }else {
      document.joinform.email2.value ="";
      document.joinform.email2.focus();
   }

}


//--------이메일 주소를 select 박스로 선택-----------------------
function selectEmailChk_upd() {
   
   //직접입력이 아닌 경우 email3.value를 email2.value로 초기화
   if (document.updateform.email3.value != 0) {
      document.updateform.email2.value = document.updateform.email3.value;
   
   //직접 입력할 경우 - email2 초기화   
   }else {
      document.updateform.email2.value ="";
      document.updateform.email2.focus();
   }

}












