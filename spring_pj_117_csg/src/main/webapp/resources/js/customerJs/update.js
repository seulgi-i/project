/**
 * 회원가입 validation check
 */



// 필수항목 체크
function signInCheck() {
   

      // password
   if (!document.updateform.password.value) {
      alert("비밀번호를 입력하세요.");
      document.updateform.password.focus();
      return false;

      // repassword
   } else if (!document.updateform.repassword.value) {
      alert("비밀번호 확인을 입력하세요.");
      document.updateform.repassword.focus();
      return false;

      // 비밀번호 체크
   } else if (document.updateform.password.value != document.updateform.repassword.value) {
      alert("비밀번호가 일치하지 않습니다.");
      document.updateform.repassword.value = "";
      document.updateform.repassword.focus();
      return false;

      // name
   } else if (!document.updateform.name.value) {
      alert("이름을 입력하세요.");
      document.updateform.name.focus();
      return false;

      // birthday
   } else if (!document.updateform.birthday.value) {
      alert("생일을 입력하세요.");
      document.updateform.birthday.focus();
      return false;

      // address
   } else if (!document.updateform.address.value) {
      alert("주소를 입력하세요.");
      document.updateform.address.focus();
      return false;

      // email
   } else if (!document.updateform.email1.value) {
      alert("이메일을 입력하세요.");
      document.updateform.email1.focus();
      return false;

      // email2.value 미존재&& 직접입력 => 이메일 형식 불일치
   } else if (!document.updateform.email2.value
         && document.updateform.email3.value == 0) {
      alert("이메일 형식에 일치하지 않습니다.");
      document.updateform.email2.focus();
      return false;
   }


}

// --------이메일 주소를 select 박스로 선택-----------------------
function selectEmailChk() {
   
   //직접입력이 아닌 경우 email3.value를 email2.value로 초기화
   if (document.updateform.email3.value != 0) {
      document.updateform.email2.value = document.updateform.email3.value;
   
   //직접 입력할 경우 - email2 초기화   
   }else {
      document.updateform.email2.value ="";
      document.updateform.email2.focus();
   }

}












