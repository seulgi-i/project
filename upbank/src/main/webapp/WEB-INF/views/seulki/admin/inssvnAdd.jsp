<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>Page left sidebar - Invention | Creative Responsive Theme</title>
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

$(function() {
	$("#sumit_b").click(function() {
		document.inssvnAdd.action="${path}/inssvnAddAction.do?${_csrf.parameterName}=${_csrf.token}";
		document.inssvnAdd.submit();
	});
});

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
					<h1>예금등록하기</h1>
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
					<h3 class="title bottom-1">admin</h3>
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
			<!-- <div class="eleven columns bottom-3"> -->
			<div class="eight columns bottom-3">
        <h3 class="title bottom-2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">적금상품추가</font></font></h3>
                        <hr style="border: solid 2px #378AC4"><br>
        <form action="${path}/inssvnAddAction.do" method="post" name="inssvnAdd" enctype="multipart/form-data"  class="form-elements">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          		<table class="style color" width="600px">	
         <tr>
		          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품명 :</font></font></th>
		        	<td><input type="text" name="i_name" placeholder="상품명 입력"></td>
          		</tr>
          
          <tr>	
          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">최대예치기간 (월) : </font></font></th>         
          <td><input type="radio" name="i_max_date" value="12"  id="radio_1" checked><label for="radio_1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12</font></font></label>
          <input type="radio" name="i_max_date" value="24" id="radio_2"><label for="radio_2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">24</font></font></label>
          <input type="radio" name="i_max_date" value="36" id="radio_3"><label for="radio_3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">36</font></font></label></td>
          </tr>
          
         <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">최소예치기간 (월) :</font></font></th>
          <td><input type="text" name="i_min_date" placeholder="기간 입력"></td>
          </tr>
          
          <tr>
          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">복리/단리 :</font></font></th>
          <td><select name="i_type">
            <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">단리</font></font></option>
            <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">복리</font></font></option>
          </select></td>
          </tr>
           
          <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">최소예치금액 :</font></font></th>
          <td><input type="text" name="i_min_price" placeholder="최소 예치금액" ></td>
          </tr>
          
           <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">최대예치금액 :</font></font></th>
           <td><input type="text" name="i_max_price" placeholder="최대 예치금액"></td>
          </tr>         
          
            <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1개월 미만 금리 :</font></font></th>
           <td><input type="text" name="rate1" size="6" placeholder="1개월 미만" ></td>
           </tr> 
           
           
           <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">6개월 금리 :</font></font></th>
           <td><input type="text" name="rate6" size="6" placeholder="6개월"></td>
           </tr>
           
           
            <tr> 
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12개월 금리 :</font></font></th>
          <td><input type="text" name="rate12" size="6" placeholder="12개월"></td>  
            </tr> 
            
             <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">24개월 금리 :</font></font></th>
           <td><input type="text"name="rate24" size="6" placeholder="24개월"></td>  
           </tr>
            
            <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">36개월 금리 :</font></font></th>
           <td><input type="text"name="rate36" size="6" placeholder="36개월"></td>         
           </tr> 
        
          <tr>
          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">한줄요약 :</font></font></th>
           <td><input type="text" name="i_summary" placeholder="한줄요약 입력"></td>
          </tr>
          
          <tr>
          <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품설명 :</font></font></th>
          <td><input type="text"  name="i_explanation" placeholder="상품설명 "></td>
          </tr>
          <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">유의사항 :</font></font></th>
           <td><input type="text"   name="i_notice" placeholder="유의사항"></td>
          </tr>
          
          <tr>
           <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 :</font></font></th>
        <td> <input type="file" class="input"  id="i_fileImg" name="i_fileImg" accept="image/*"></td>
          </tr>
          </table>
          <div class="clear"></div>
          <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
          <input type="submit" value="저장 버튼" id="sumit_b" class="button1 small color"></font></font></font></font>
          <input type="reset" value="Reset Button" class="button1 small normal">
          </form>
        
       </div>
                           



                     
                     
                  </div>
               </div>

			<!-- End Posts -->

			<div class="clearfix"></div>

		<!-- <<< End Container >>> -->

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<!-- <<< End Footer >>> -->
		<!-- <<< End Footer >>> -->

	<!-- End wrap -->
</body>
</html>