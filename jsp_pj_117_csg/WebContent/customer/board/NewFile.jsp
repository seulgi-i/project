<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${path}/resource/js/smartEditor/js/service/HuskyEZCreator.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "{path}/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});

	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.

		try {
		 elClickedObj.form.submit();
		} catch(e) {}
	}
</script>
</script>
</head>
<body>

<textarea name="ir1" id="ir1" rows="10" cols="100">기본 작성 글은 여기에 추가해서 로드</textarea>


</body>
</html>