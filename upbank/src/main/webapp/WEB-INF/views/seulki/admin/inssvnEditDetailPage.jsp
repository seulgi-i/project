<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title></title>
<meta name="description"
	content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
<meta name="author" content="Jozoor team">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Main Style -->

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">
<script type="text/javascript">
</script>
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
					<h1>적금등록하기</h1>
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
					<h3 class="title bottom-1">상품 추가</h3>
					<!-- Title Widget -->
					<ul class="arrow-list">
			         <li><a href="${path}/depositAdd.do">예금상품추가</a></li>
			         <li><a href="${path}/depositEdit.do">예금상품관리</a></li>
			         <li><a href="${path}/inssvnAdd.do">적금상품추가</a></li>
			         <li><a href="${path}/inssvnEdit.do">적금상품관리</a></li>
			         <li><a href="${path}/depositList.do">메인</a></li>
					</ul>
					<!-- End arrow-list -->
				</div>
				<!-- End -->

			</div>
			<!-- End Sidebar Widgets -->
			<!-- Start Posts -->
			<div class="eleven columns bottom-3">

				<div class="post single style-1">

					<h3 class="title bottom-1">상품 수정</h3>
					<hr class="line bottom-3"></hr>
                     
                      <form action="${path}/inssvnEditAction.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
	                     <input type="hidden" name="hiddenName" value="${dto.i_name}">
	                     <input type="hidden" name="hiddenFileImg" value="${dto.i_fileImg}"><!-- 기존 상품 이미지 -->
                         <table class="style color" style="width: 142%;">	
                           <tr>
                              <th>상품명</th>
                              <td><input type="text" class="input" id="i_name"name="i_name" size="40" value="${dto.i_name}" required></td>
                          </tr>                          
                     
                     <tr>
                        <th>상품카테고리</th>
                        <td>
                           <select id="i_type" class="input" name="i_type" required>
                              <option>카테고리</option>
                              <option value="단리" <c:if test="${dto.i_type == '단리'}">selected</c:if>>단리</option>
                              <option value="복리" <c:if test="${dto.i_type == '복리'}">selected</c:if>>복리</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <th>한줄요약</th>
                        <td><textarea rows="10" cols="50" id="i_summary" name="i_summary" style="vertical-align: middle; height: 40px;">${dto.i_summary}</textarea></td>
                     </tr>
                     <tr>
                        <th>적금설명</th>
                        <td><textarea rows="5" cols="50" id="i_explanation" name="i_explanation" style="vertical-align: middle;"">${dto.i_explanation}</textarea></td>
                     </tr>
                     <tr>
                        <th>유의사항</th>
                        <td><textarea rows="5" cols="50" id="i_notice" name="i_notice" style="vertical-align: middle;">${dto.i_notice}</textarea></td>
                     </tr>
                     <c:forEach var="dto" items="${list2}">
			 			<tr>
			           <th>${dto.month}개월 미만 금리 :</th>
			           <td><input type="text" name="rate${dto.month}"size="6" value="${dto.rate}"></td>
			           </tr> 
			           </c:forEach>
                     <tr>
                        <th>최소예치금액</th>
                        <td><input type="number" class="input" id="i_min_price" name="i_min_price" size="5" value="${dto.i_min_price}" required></td>
                     </tr>
                     <tr>
                        <th>최대예치금액</th>
                        <td><input type="number" class="input" id="i_max_price" name="i_max_price" size="5" value="${dto.i_max_price}" required></td>
                     </tr> 
                     <tr>
                     <th>최소적금기간</th>
  						 <td colspan="2">
                          <input type="number" class="input" name="i_min_date" size="8"value="${dto.i_min_date}">
                         </td>
                        </tr>
                       <c:if test="${dto.i_max_date == 12}">
                        <tr>
				         <th>최대예치기간 (월) : </th>
				         <td><input type="radio" name="i_max_date" value="12"  id="radio_1" checked ><label for="radio_1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12</font></font></label>
				          <input type="radio" name="i_max_date" value="24" id="radio_2"><label for="radio_2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">24</font></font></label>
				          <input type="radio" name="i_max_date" value="36" id="radio_3"><label for="radio_3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">36</font></font></label></td>
          				</tr>
          				</c:if>
          				<c:if test="${dto.i_max_date ==24}">
                        <tr>
				         <th>최대예치기간 (월) : </th>
				         <td><input type="radio" name="i_max_date" value="12"  id="radio_1"  ><label for="radio_1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12</font></font></label>
				          <input type="radio" name="i_max_date" value="24" id="radio_2" checked><label for="radio_2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">24</font></font></label>
				          <input type="radio" name="i_max_date" value="36" id="radio_3"><label for="radio_3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">36</font></font></label></td>
          				</tr>
          				</c:if>
          				<c:if test="${dto.i_max_date == 36}">
                        <tr>
				         <th>최대예치기간 (월) : </th>
				         <td><input type="radio" name="i_max_date" value="12"  id="radio_1"  ><label for="radio_1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12</font></font></label>
				          <input type="radio" name="i_max_date" value="24" id="radio_2"><label for="radio_2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">24</font></font></label>
				          <input type="radio" name="i_max_date" value="36" id="radio_3"checked><label for="radio_3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">36</font></font></label></td>
          				</tr>
          				</c:if>
          				<tr>
                      <th>파일</th>
  						 <td colspan="2">
  						  	<img src="${dto.i_fileImg}" width="80">
                        <input type="file" class="input" name="i_fileImg" id="i_fileImg"  placeholder="이미지" required accept="image/*">
                         </td>
                        </tr>   
                      <tr>                      
                         <!-- <td colspan ="2"  style="border-bottom:none;">-->
                         <td colspan ="3">
                            <br>
                            <div align="right">
                               <input type="submit" id="button" class="button1 small color" value="수정"style="text-size:14px">
                               <input type="reset" class="button1 small color" value="초기화"style="text-size:14px">
                               <input type="button" class="button1 small color"value="목록"onclick="window.location='${path}/inssvnEdit.do'">
                            </div>
                          </td>
                        </tr>
                        </table>
                    </form>    
                  </div>
               </div>

			</div>
			<!-- End Posts -->

			<div class="clearfix"></div>

		</div>
		<!-- <<< End Container >>> -->

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<!-- <<< End Footer >>> -->
		<!-- <<< End Footer >>> -->

	</div>
	<!-- End wrap -->
</body>
</html>