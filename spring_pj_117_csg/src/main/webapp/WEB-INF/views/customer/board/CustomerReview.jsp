<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 ??? -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44bbd7835d.js"
	crossorigin="anonymous"></script>
	
<title>ADMIN: 게시판</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/board.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


<!-- 3-3. 자바 스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html 브라우저 창에 표시가 안 되는 것을 방지-->
<script>
$(function(){
   $("#btnInsert").click(function(){
      location.href="${path}/board_insert.bo";
   });
});

</script>
<style>
#center{
	    margin-left: 85px;
}
.board_notice th,
.board_notice td {
	
	height: 66px;
	font-size : 14px;
	color : black;
		
}
.board_notice2 tbody tr:hover{/*마우스 갖다 올렸을 때*/
   background-color : #fdddde;
   border-radius : 4px;
}

.board_notice_wrap {
	width: 100%;
    height: 229px;
    position: relative;
}

.board_notice_wrap .paging {
	margin-top : 30px;
	padding-left: 80px; /* 페이지버튼 좌우 정렬 */
	text-align : center;
	font-size : 0;
}
.board_notice_wrap .paging a {
	display : inline-block;
	margin : 10px;
	padding : 5px 10px;
	border-radius: 27px;
	font-size : 12px;
}


.board_notice_wrap .paging a {
	border: 1px solid #ffe3e9;
		color : black;
		margin-right: 150px;
}

.board_notice_wrap .paging a {
	border: 1px solid black;
	color : black;
	
}
/* .board_notice_wrap .paging a.num.on {
	background : #ffbdcc;
	color : black;
}
 다음버튼 색깔*/


.container-fluid {
    background-color: #fff;
	float: center;
}
#container {
    width: 88%;
    margin: 0 auto;
    height: 99%;
    margin-top: 190px;
  margin-left: 117px;
}
#contents a button {
    display: inline-block;
    margin-top: 23px;
    margin-left: 10px;
    margin-bottom: 16px;
}

</style>
</head>
<body>

   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->

      <!-- 상품 목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
              <h1 style="font-family:'Gowun_Batang',serif"> Review </h1>
              <br>· 고객님들의 소중한 리뷰 게시판입니다. <br>
              	  <a href="${path}/CustomerReview.bo">
	            	<button type="button" class="btn btn-light">Review</button></a>
				<a href="${path}/Customerboard.bo">
					<button type="button" class="btn btn-light">Notice</button></a>	
            </div>
            <div>

			</div>	
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측 메뉴 시작 -->

                     <!-- 좌측 메뉴바 종료 -->
                  </div>
               </div>
               <!-- 좌측 메뉴 종료 -->
               
               <!-- 우측 메뉴 시작 -->
               <div id="center">
                  <div class="board_notice_wrap">
                  
                     <table class="board_notice" style="width:100%; align:center">
                           <tr>
                           <th style="width: 8%;">글번호</th>
                           <th style="width: 17%;">작성자</th>
                           <th style="width: 19%;">제목</th>
                           <th style="width: 11%;">날짜</th>
                           <th style="width: 4%;">조회수</th>
                        </tr>
                        </table>
                        <table class="board_notice2" style="width:100%; align:center">
                        <!-- 게시글이 있으면 -->
                        <c:forEach var="dto" items="${list}">
                           <%-- <c:forEach var="개별항목" items="${집합}"> --%>
                           
                           <tr style="align:center; border-bottom:1px solid black;">
                              <td style="text-align: center;">${dto.num}</td>
                              <td style="text-align: center;">${dto.writer}</td>
                              <td style="text-align: center;"">
                                    <a href="${path}/CustomerReview.bo?num=${dto.num}">${dto.title}</a>
                                    <!-- 댓글 갯수 -->
                                    <c:if test="${dto.comment_count > 0}">
                                       [ ${dto.comment_count} ]
                                    </c:if>
                              </td>
                              <td style="text-align: center;">${dto.regDate}</td>
                              <td style="text-align: center;">${dto.readCnt}</td>
                           </tr>
                        </c:forEach>
                        
                                                   
      
                           
                           
                         </table>
                           <div class="paging" style="margin-left:-80px">
                              <!-- 페이징 처리 -->
                              <!-- 이전 버튼 활성화 여부 -->
                              <c:if test="${paging.startPage > 10 }">
                               <a href="${path}/CustomerReview.bo?pageNum=${paging.prev}">이전</a>
                              </c:if>
                              
                              <!-- 페이지 번호 처리 -->
                              <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                                  <a href="${path}/CustomerReview.bo?pageNum=${num}">${num}</a> 
                                 
                              
                              </c:forEach>
                              <!-- 다음 버튼 활성화 여부 -->
                              <c:if test="${paging.endPage < paging.pageCount}">
                                 <a href="${path}/CustomerReview.bo?pageNum=${paging.next}">다음</a>
                              </c:if>                              
                           
                           </div>


                        
                    

                  </div><!-- table_div -->
               </div><!-- right -->
               <!-- 우측 메뉴 시작 -->
               
            </div><!-- section2 -->
         </div><!-- contents -->
      </div><!-- container -->
      <!-- 상품 목록 컨텐츠 종료 -->


      <!-- footer 시작 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>