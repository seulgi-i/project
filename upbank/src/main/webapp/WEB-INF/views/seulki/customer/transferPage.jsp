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
      
      <h3 class="title bottom-1" >자동이체등록</h3><!-- Title Post -->
       <hr>
       <div style="border:1px solid black; padding: 10px; font-size:20px; font-style: ">
       <i class="icon-ok-circle s-25" ></i>안내 및 유의사항<br>
       <br>
       <hr>
       <br>
       <div style="font-size:12px">
       <i class="icon-caret-right s-20"></i>타행으로 매월 일정금액 자동이체시 수수료는 건당 300원입니다.<br>
       <i class="icon-caret-right s-20"></i>납부자자동이체는 이체지정일 전영업일 20시 이후에 출금되어 이체 지정일 오전에 타행계좌로 입금되며, 미출금시(잔액이 없는경우)에는<br>
       										해당월분에 대해서 재처리 하지 않습니다.(단, 이체지정일이 휴일인 경우 지정일 익영업일 오전에 타행계좌로 입금됩니다.)<br>
       <i class="icon-caret-right s-20"></i>매월 말일 자동이체 등록방법 (당행 자동이체만 가능)
       </div>
       </div>
       <form action="${path}/autoTransferInsertAction.do" method="post" name="autoTransfer" class="form-elements" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="id" value="${sessionScope.customerID}">
       
       <hr>
       <br><br><br>
       	<h5>출금정보</h5>
       	<br>
       	<hr style="border:solid 2px #378AC4">
       	<br>
       <table class="style color" width="600px">
       		
       		<tr>
       			<th width = "250"> 출금계좌번호</th>
       			<td width = "800">
          			<select name="ACCOUNT">
		                  <option value="${dto.tf_account}" id="${dto.tf_account}">${dto.tf_product_name}${dto.tf_account}</option>
          			</select>
          		
       		</tr>
        		<tr>
       			<th> 계좌비밀번호</th>
       			<td>
       				<input type="password" name="ACCOUNT_PW" maxlength="4" required/>
       			</td>
       			
       		</tr> 
       </table>
       
       <hr>
       <br><br><br>
       	<h5>입금정보</h5>
       	<br>
       	<hr style="border:solid 2px #378AC4">
       	<br>
       <table class="style color" width="600px">
       		
       		 <tr>
       			<th> 입금은행</th>
       			<td >
        			<select name="auto_senderBank" required>
                      <option value="">은행명을 선택하세요</option>
                      <option value="UpBank">UpBank</option>
				</select>
       		</tr>
       		<tr>
       			<th> 입금계좌번호</th>
       			<td>
       				<input type="text" name="auto_senderAccount" id="auto_senderAccount" value="${dto.account}" />
       				<!-- <input type="button" value="최근입금계좌"></input> -->
       			</td>
       			
       		</tr>
       		<!-- <tr>
       			<td>이체금액</td>
       			<td>
       				<br>
       				<input type="button" value="1만원" onclick=addPrice('10000');"/>
       				<input type="button" value="3만원" onclick=addPrice('30000');"/>
       				<input type="button" value="5만원" onclick=addPrice('50000');"/>
       				<input type="button" value="10만원" onclick=addPrice('100000');"/>
       				<input type="button" value="50만원" onclick=addPrice('500000');"/>
       				<input type="button" value="100만원" onclick=addPrice('1000000');"/>
       				<input type="reset" value="정정">
			
       			</td>
       		</tr> -->
       		<tr>
       			<th>이체금액</th>
       			<td>
       				<input type="number" name="auto_balance" value="${dto.i_money}"/>원
       			</td>
       		</tr>
       		<tr>
       			<th>이체 주기</th>
       				<td><select class="input" name="auto_outDate" required>
						<option value="">선택</option>
						<option value="1">매달 1일</option>
						<option value="5">매달 5일</option>
						<option value="7">매달 7일</option>
						<option value="10">매달 10일</option>
						<option value="15">매달 15일</option>
						<option value="20">매달 20일</option>
						<option value="25">매달 25일</option>
						</select> <br>*매일 이체방식은 영업일에만 이체처리됩니다.<br> (토요일, 일요일,
					공휴일의 경우 이체처리 되지 않습니다.)
       		</tr>
       		<tr>
       			<th>이체 시작일/종료일</th>
       			<td>
       				<input type="date" id="datepicker1" name="auto_registDate" value="${nextDate}">
					<input type="date" id="datepicker2" name="auto_expirationDate" value="${dto.i_end_date}">
				</td>
		
       		</tr>
       		<!-- <tr>
       			<td>휴일이체구분</td>
       			<td>
       				<select class="input" name="holidays_auto_transfer" style='width: 150px' required>
					<option value="휴일익일이체">휴일익일이체</option>
					<option value="휴일전일이체">휴일전일이체</option>
					</select> 당행이체 자동이체일 경우 선택
				</td>
       		</tr> -->
       		
       		<tr>
       			<th>자동이체 종류</th>
       			<td>
       				<select class="input" name="auto_type">
       				 	<option value="">선택</option>
                        <option value="2">적금</option>
       				</select>
  				</td>	
       		</tr>
       		<tr>
       			<th>이체기관명(내용)</th>
       			<td>
       				<input type="text" name="auto_inPlace" value="정기적금"/>
       			</td>
       		</tr>
       </table>
     <i class="icon-caret-right s-20"></i>최근 전화금융사기(보이스피싱) 피해가 급증하고 있습니다. 한번 더 확인하신 후 이체해 주시기 바랍니다.
     
       <br>
       <div align="center">
          <input type="submit" id="button"  value="등록" class="button1 small color">
          <input type="reset"  value="취소" class="button1 small black">
       </div>
 </form>
    
    <!-- =================================================== -->
     
    </div><!-- End contain-->
    
    </div><!-- End portfolio -->
    
   </div><!-- <<< End Container >>> -->

      
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   <script src="${path}/resources/js/datepicker.js"></script>
   <script src="${path}/resources/js/datepicker.ko.js"></script>
   <script src="${path}/resources/js/datepicker.en.js"></script>
   </footer>
  
  </div><!-- End wrap -->
  

    
</body>
</html>