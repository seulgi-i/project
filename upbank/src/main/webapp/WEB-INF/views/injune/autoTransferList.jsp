<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

  <!-- Basic Page Needs -->
  <meta charset="utf-8">
  <title>Upbank</title>
  <meta name="description" content="Invention Theme for corporate and creative sites, responsive and clean layout, more than color skins">
  <meta name="author" content="Jozoor team">

  <!-- Mobile Specific Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <!-- Main Style -->

  
  <!--[if lt IE 9]>
      <script src="js/html5.js"></script>
  <![endif]-->
  
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  <script>
  	$("#datepicker").datepicker({
		language : 'ko'
	});
  
	function datePickerSet(sDate, eDate, flag) {

		//시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
				&& eDate.length > 0) {
			var sDay = sDate.val();
			var eDay = eDate.val();

			if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

				var edp = eDate.datepicker().data("datepicker");
				edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(eDay)) {
				sDate.datepicker({
					maxDate : new Date(eDay.replace(/-/g, "/"))
				});
			}
			sDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(sDay)) {
				eDate.datepicker({
					minDate : new Date(sDay.replace(/-/g, "/"))
				});
			}
			eDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
			var sDay = sDate.val();
			if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			sDate.datepicker({
				language : 'ko',
				autoClose : true
			});
		}

		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	}
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
        <h1>자동이체</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
   
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">자동이체</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/autoTransferInsert.do">자동이체등록</a></li>
         <li><a href="${path}/autoTransferList.do">자동이체결과조회</a></li>
         
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <!-- End -->
     
     
     <!-- Latest Tweets Widget -->
     <div class="widget">
       <h3 class="title bottom-1">
       <i class="icon-headphones s-30"></i>
       고객센터</h3><!-- Title Widget -->
       <p>
          <br>1232-2132<br>
       </p>
     </div>
     <!-- End -->
     
     
     <!-- Video Widget -->
     <div class="widget">
       <h3 class="title bottom-1"></h3><!-- Title Widget -->
       <!-- Youtube Video -->
        <div class="video-wrap widescreen">
        </div><!-- End video wrap -->
        <!-- End Youtube -->
     </div>
     <!-- End -->
   
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="eleven columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
      <h3 class="title bottom-1">자동이체결과조회</h3><!-- Title Post -->
          		<table class="style color" style='width:1300px;table-layout: fixed;word-break:break-all;height: auto'>
		          <tbody valign="middle">
		            <tr>
		              <th>이체기관</th>
		              <th>출금 계좌</th>
		              <th>입금 계좌</th>
		              <th>금액</th>
		              <th>주기</th>
		              <th>시작일</th>
		              <th>종료일</th>
		              <th>종류</th>
		              <th>상태</th>
		              <th>최근납부</th>
		              <th>해지일</th>
		            </tr>
		            <c:forEach var="dto" items="${dtos}">
		            <tr>
		              <td>${dto.auto_inPlace}</td>
		              <td>${dto.ACCOUNT }</td>
		              <td>${dto.auto_senderAccount}</td>
		              <td><fmt:formatNumber value="${dto.auto_balance}" type="number"/>원</td>
		              <td>
                          <c:choose>
                            <c:when test="${dto.auto_outDate==1}">
                               		매달 1일
                            </c:when>
                            <c:when test="${dto.auto_outDate==5}">
                              		 매달 5일
                            </c:when>
                            <c:when test="${dto.auto_outDate==7}">
                               		매달 7일
                            </c:when>  
                            <c:when test="${dto.auto_outDate==10}">
                              		 매달 10일
                            </c:when>
                            <c:when test="${dto.auto_outDate==15}">
                               		매달 15일
                            </c:when>
                            <c:when test="${dto.auto_outDate==20}">
                              		 매달 20일
                            </c:when>
                            <c:when test="${dto.auto_outDate==25}">
                              		매달 25일
                            </c:when>
                         </c:choose>
		               <td> <fmt:formatDate value="${dto.auto_registDate}" pattern="yyyy-MM-dd"/> </td>
		              <td> <fmt:formatDate value="${dto.auto_expirationDate}" pattern="yyyy-MM-dd"/></td>
		               <td>
                        <c:choose>
                           <c:when test="${dto.auto_type==1}">
                              	예금
                           </c:when>
                           <c:when test="${dto.auto_type==2}">
                              	적금
                           </c:when>
                           <c:when test="${dto.auto_type==3}">
                             	 대출
                           </c:when>
                        </c:choose> 
   						</td>
                     <td>
                       <c:choose>
                         <c:when test="${dto.auto_status == 0}">
                            	정상
                         </c:when>
                         <c:when test="${dto.auto_status == 1}">
                            	해지
                         </c:when>
                         <c:when test="${dto.auto_status == 2}">
                            	만료
                         </c:when>
                      </c:choose>
                   </td>
                   <td>
	                    <c:if test="${dto.auto_lastDay==null}">
	                      	내역없음
	                   </c:if>
	                   <c:if test="${dto.auto_lastDay!=null}">
	                      <fmt:formatDate value="${dto.auto_lastDay}" pattern="yyyy-MM-dd"/>
	                   </c:if> 
	                </td>
	                 <td>
	                     <c:if test="${dto.auto_status==0}">
	                       <div class="form-button-action">
	                          <form action="${path}/autoTransferDelete.do" method="post" name="removeForm">
	                             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                             <input type="hidden" name="auto_id" value="${dto.auto_id}">
	                          	<button>해지</button>
	                          </form>
	                       </div>
	                    </c:if>
	                    <c:if test="${dto.auto_status==1}">
	                       <fmt:formatDate value="${dto.auto_cancle}" pattern="yyyy-MM-dd"/>
	                    </c:if> 
	                 </td>
		            </tr>
		            </c:forEach>
		          </tbody>
		        </table>
      
<div class="container main-content clearfix">
   
          </div><!-- End contents -->
    
    <!-- =================================================== -->
     
    </div><!-- End contain-->
  
    </div><!-- End portfolio -->
    


		       
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
  
  </div><!-- End wrap -->
  

    
</body>
</html>