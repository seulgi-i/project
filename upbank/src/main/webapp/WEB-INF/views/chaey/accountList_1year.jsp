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
 
 $(function(){
	$("#stopBtn").click(function(){
		if(confirm("일괄 중지처리 하시겠습니까?")){
			if(${list!=null}){
				location.href = '${path}/adminAccountChange_stop.ad';
			}else{
				alert("중지처리할 항목이 없습니다")
			}
		}
	})
 })


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
         <li><a href="#">입출금 내역조회 </a></li>
         <li><a href="#">결산내역 조회</a></li>
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
      
      <h3 class="title bottom-1">중지대상 계좌 </h3><!-- Title Post -->
       <div class="container main-content clearfix" style="width:95%">
       
           <!-- 종합정보 조회 -->
          <div id="content1" class="tabscontent">
       		<table class="style color">
	          <tbody valign="middle">
	            
	            <tr>
	              <th width="10%">예금주</th>
	              <th width="11%">ID</th>
	              <th width="13%">계좌번호</th>
	              <th width="10%">계좌종류</th>
	              <th width="12%">신규일</th>
	              <th width="14%">최근거래일</th>
	              <th width="15%">잔액</th>
	              <th width="15%">계좌상태</th>
	            </tr>
	            
	            <c:if test="${list==null}">
	            	<tr>
	            		<td colspan=8>
	            			중지대상 계좌가 없습니다.
	            		</td>
	            	</tr>
	            </c:if>
	            
	            <c:forEach var="dto" items="${list}">
	            <tr>
	              <td>${dto.account_name}</td>
	              <td>${dto.id }</td>
	              <td>${dto.account }</td>
	              <td>${dto.account_type}</td>
	              <td>${dto.new_date }</td>
	              <td>${dto.last_date }</td>
	              <td>${dto.balance }</td>
	              <td>${dto.account_state }</td>
	            </tr>
	            </c:forEach>
	            
	            <!-- 페이징처리 -->
	            <tr style="border:none;">
	            	<td colspan=8 style="border:none;">
	            		<!-- 이전버튼 활성화 여부 -->
						<c:if test="${paging.startPage > 10}">
							<a href="${path}/accountList_1year.ad?pageNum=${paging.prev}">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 처리 -->
						<!-- header.css div #right a{ color: black:} 추가 처리 -->
						<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							<a href="${path}/accountList_1year.ad?pageNum=${num}">${num}</a>
						</c:forEach>
						
						<!-- 다음버튼 활성화 여부 -->
						<c:if test="${paging.endPage < paging.pageCount}">
							<a href="${path}/accountList_1year.ad?pageNum=${paging.next}">[다음]</a>
						</c:if>
					</td>
	            </tr>
	            <tr style="border:none;">
	            	<td colspan=8 style="border:none;">
	            		<input type="button" id="stopBtn" value="일괄중지처리" class="button1 medium color bottom-2">
	            	</td>
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