<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<html>
<head>
 <meta charset="utf-8">
<title> 관리자 - 계좌조회 페이지 </title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
<script type="text/javascript">


/* 버튼명 중복가능하도록 ^이용해서 만들고, 마지막에 html 하나로통일하는법 고민해보기*/
 $(function(){
	 	$("input[name^='account_btn']").click(function(){
			
			var param = {
					"searchType": $(this).next().val(),
					"searchValue": $(this).prev().val(),
				}
					 
			$.ajax({
				url: '${path}/adminSearchAction.ad?${_csrf.parameterName}=${_csrf.token}',
				type: 'post',
				data: param,
				success: function(data){	//콜백함수 호출
					$('#content1').html(data);	
				},
				error: function(){
					alert('일치하는 정보가 없습니다. 다시 확인해주세요');
				}
			})
		});
	});
 

</script>  
  
  
</head>
<body>

	<div id="wrap" class="boxed">

	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	</header>
     
   <div class="page-title">
     <div class="container clearfix">
       <div class="sixteen columns"> 
         <h1>조회</h1>
       </div>
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">계좌 관리</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/adminSearchAccount.ad">계좌정보조회</a></li>
         <li><a href="${path}/adminChangeAccount.ad"><b>계좌상태 변경</b></a>
         	<dl style="margin-top:5px;">
	         	<dt style="font-size:12px"><a href="${path}/accountList_1year.ad">-중지대상 계좌</a></dt>
	         	<dt style="font-size:12px"><a href="${path}/accountList_5year.ad">-휴면대상 계좌</a></dt>
         	</dl>
         </li>
         
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="eleven columns bottom-3" style="width:70%" >
     
     <form name="adminSearchAccount_form" method="post" action="${path}/adminSearchAction.ad}">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      
      <h3 class="title bottom-1">계좌상태별 현황</h3><!-- Title Post -->
       <div class="container main-content clearfix" style="width:95%">
       
           <!-- 종합정보 조회 -->
          <div id="content1" class="tabscontent">
       		<table class="style color">
	          <tbody valign="middle">
	            <tr>
	              <th width="20%">정상계좌</th>
	              <th width="20%">거래중지 대상<br><a style="font-size:12px">(1년이상 미이체)</a></th>
	              <th width="20%">거래중지</th>
	              <th width="20%">휴면 대상<br><a style="font-size:12px">(5년이상 미이체)</a></th>
	              <th width="20%">휴면</th>
	            </tr>
	            
	            <!-- 종합 탭일때 종합정보 받아오기 -->
	            <tr>
	              <td>${normal}</td>
	              <td>${last_1year}</td>
	              <td>${stop}</td>
	              <td>${last_5year}</td>
	              <td>${sleep}</td>
	            </tr>
	            
	        </table><br>
          </div> 
          
      </div><!-- End post-content -->
      
    <!-- ==================== End Single Post  ==================== -->
     
   </div><!-- End Posts -->  
   </form>
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   </div>
  
  </div><!-- End wrap -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>