<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
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


<link rel="shortcut icon" href="images/favicon.ico">

<script type="text/javascript">
$(function(){
	$('#loginalert').click(function(){
			alert("로그인 하세요.");
		});		
});
function input_Text6(){
	    document.getElementById("y_end_date").value = '6';
	}
function input_Text12(){
	    document.getElementById("y_end_date").value = '12';
	}	
function input_Text24(){
	    document.getElementById("y_end_date").value = '24';
	}
function input_Text36(){
	    document.getElementById("y_end_date").value = '36';
	}

//인풋텍스트 누르면 박스 나오게하기
function showDiv(element){
    var tag = document.getElementsByClassName("box");
    
    console.log(tag);

    for(var i=0; i<tag.length; i++){
        if(element.id+"Box" == tag[i].id)
            tag[i].style.display = "block";
        else
            tag[i].style.display = "none";
        
    }
}

var sum = 0;//함수 안에 지역변수로 선언하면 0으로 계속 초기화돼서 sum+=으로 더해지지 않는 거였음.
var showval =0;
function balance(button) {
	
	if(button)
		sum+= parseInt(button.value);//parseInt를 안하면 값이 더하기가 안되고 옆에 붙여넣기가 됨		
	else
		sum-= button.value;
	
	document.getElementById("y_balance").value = sum;
	document.getElementById("showval").value = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

var num=0;

function rate(button) {

	if(button)
		num+= parseInt(button.value);//parseInt를 안하면 값이 더하기가 안되고 옆에 붙여넣기가 됨		
	else
		num-= button.value;
	
	document.getElementById("rate").value = num/10;
} 

//이자계산기
$(function(){
	$("#calc").click(function(){
	 var param = {
			 "y_balance": $('#y_balance').val(),  /* key : value */
		     "y_end_date" : $('#y_end_date').val(),
		     "rate" : $('#rate').val()
		   }
	
	$.ajax({
		url: '${path}/depositcalculator_1.do?${_csrf.parameterName}=${_csrf.token}',
		type: 'post',
		data: param,
		success: function(data) {
			$("#display").html(data);
		},
		error: function() {
			alert("다시 입력해주세요.");
		}
		
	});
  });
 
});



</script>
 <style>

fieldset{
            text-align: center;
            background-color: white;
            margin-right: 150;
}

div.box{
            width: 500px;
            height: 50px;
            box-align:left;
            display: none;
}

#btn{
	border-radius: 7px;
    background: white;
    height: 30px;
    border: 1px solid;
}
    </style>
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
					<h1>예금</h1>
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
					<h3 class="title bottom-1">상품/가입</h3>
					<!-- Title Widget -->
					<ul class="arrow-list">
			         <c:if test="${sessionScope.customerID != null && sessionScope.customerID != 'admin'}">
		      		 <li><a href="${path}/depositMain.do">메인</a></li>
			         <li><a href="${path}/depositList.do">예금 상품/가입</a></li>
			         <li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
			         <li><a href="${path}/terminateList.do">해지</a></li>
					</c:if>
			        <!--  로그인 안 한 경우-->
					<c:if test="${sessionScope.customerID == null }">
					 <li><a href="${path}/depositMain.do">메인</a></li>
			         <li><a href="${path}/depositList.do">예금 상품/가입</a></li>
			         <li><a href="${path}/inssvnList.do">적금 상품/가입</a></li>
			         <li><a href=""id="loginalert">해지</a></li>
					</c:if> 
					</ul>
					<!-- End arrow-list -->
				</div>
				<!-- End -->

				<!-- Text Widget -->
				<div class="widget">
					<h3 class="title bottom-1">고객센터</h3>
					<!-- Title Widget -->
					<p></p>
				</div>
				<!-- End -->
			</div>
			<!-- End Sidebar Widgets -->
			<!-- Start Posts -->
			<div class="sixteen columns bottom-3">

				<!-- ==================== Single Post ==================== -->
				<div class="post single style-1">

					<h3 class="title bottom-1">예금 상품&가입</h3>
					<hr class="line bottom-3"></hr>
					<!-- Title Post -->
					  <form class="form-elements" name="depositForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">

					<div class="services style-2 bottom-3" style="padding: 0 0 0 20px;">
						<h5 class="title bottom-2" style="margin-bottom: 0 !important;"> </h5>
						<h3 class="title bottom-2" style="padding: 0 5px 5px 5px;"></h3>
						<br><br><br>
						<div class="one-third column" style="width:280px; margin: 0 0 20px 0;">
				         <div class="item active bottom-3">
				           <div class="circle float-left" style="height:50px; background-color:#378ac4;"><i class="icon-calendar"></i></div>
				           <div class="data float-right">
				           <h5>기간</h5>
				           <h4><strong>최고
					           ${dto.y_max_date}개월
				           	</strong></h4>
				           </div>
				         </div>
				       </div><!-- End item -->


 					<div class="one-third column" style="width:280px; margin: 0 50px 20px 0;">
				         <div class="item active bottom-3">
				           <div class="circle float-left" style="height:50px; background-color:#378ac4;"><i class="icon-ok"></i></div>
				           <div class="data float-right">
				           <h5>금액</h5>
				           <h4><strong> <fmt:formatNumber pattern="###,###,###" value="${dto.y_min_price}" />원~
								      <fmt:formatNumber pattern="###,###,###" value="${dto.y_max_price}" />원</strong></h4>
				           </div>
				         </div>
				       </div><!-- End item -->
				       
				       
							    <div class="one-third column" style="width:280px; margin: 0 0 20px 0;">
				         <div class="item active bottom-3">
				           <div class="circle float-left" style="height:50px; background-color:#e7402f;"><i class="icon-thumbs-up"></i></div>
				           <div class="data float-right">
				           <h5>최고 연</h5>
				           <h4>
				           		<strong><span style="font-size: 20px">${dto.rate}%(${dto.y_max_date}개월)</span></strong>
						   </h4>
				           </div>
				         </div>
				       </div><!-- End item -->
							
							
							
							</div>
						</div>
						</div>
						<c:if test="${sessionScope.customerID == null }">
						<a href="#" class="button1 small color"
							style="margin-left: 650px; margin-bottom: 30px; margin-top: -80;" onclick="alert('로그인 하세요.'); return false;">
							가입하기</a> <br>
						</c:if>
						<c:if test="${sessionScope.customerID != null }">
						<a href="${path}/depositJoinDetail.do?y_name=${dto.y_name}" class="button1 small color"
							style="margin-left: 650px; margin-bottom: 30px; margin-top: -80;">
							가입하기</a> <br>
						</c:if>
						<br>
					<!-- 예금계산기 출력 -->
				          
				          <br><br><br>
				          
				          
				          <div class="eight columns bottom-3">
        <h3 class="title bottom-2" style="border-bottom: 1px solid #b7b7b7;">예금계산기</h3>
        
        <div class="info-box" style="width: 1000px; font-size: 17px;">
         	<input type="text" id="showval" size="15" placeholder="예치금액" onclick="showDiv(this);"> 을
          	<input type="hidden" id="y_balance" >
			<input type="text" id="y_end_date" size="5" placeholder="기간" onclick="showDiv(this);"> 개월 간
			<input type="text" id="rate" size="5" placeholder="금리" onclick="showDiv(this);"> %의 예금상품에 저축하면?
		    <button type="button" class="button1 small color" id="calc" >결과보기</button>
		    <input type="reset" class="button1 small color" onclick="location.reload();">
		        </div>
      		 
				    
				    
				    <div id="showvalBox" class="box" >
				        <form method="post" >
							<button type="button" id ="btn" name="dupChk" onclick="balance(this)" value="10000000">+1000만</button>
							<button type="button" id ="btn" name="dupChk" onclick="balance(this)" value="5000000">+500만</button>
							<button type="button" id ="btn" name="dupChk" onclick="balance(this)" value="3000000">+300만</button>
							<button type="button" id ="btn" name="dupChk" onclick="balance(this)" value="1000000">+100만</button>
				        </form>
				    </div>
				    <tr>
				    <div id="rateBox" class="box" >
				      <form method="post">
						<button type="button" id ="btn" name="dupChk" onclick="rate(this)" value="1">+0.1%</button>
						<button type="button" id ="btn" name="dupChk" onclick="rate(this)" value="10">+1%</button>
						<button type="button" id ="btn" name="dupChk" onclick="rate(this)" value="50">+5%</button>
				      </form>
				   </div> 
				
				    <div id="y_end_dateBox" class="box">
				        <form method="post">
						<input type="button" id ="btn" name="dupChk" onclick="input_Text6()" value="6개월" >
						<input type="button" id ="btn" name="dupChk" onclick="input_Text12()" value="12개월">
						<input type="button" id ="btn" name="dupChk" onclick="input_Text24()" value="24개월">
						<input type="button" id ="btn" name="dupChk" onclick="input_Text36()" value="36개월">
				        </form>
				    </div>
				    <br>	<br>
				    <!-- ajax 출력위치 -->
					<div id="display">
					</div>
					<br><br>
				    </div>
				    
				<hr class="line bottom-3"></hr>						
				
										
				 
					
						<div class="eight columns bottom-3" style="width: 1000px">
							<div id="horizontal-tabs" class="two style2">
								<ul class="tabs" style="margin-left: 530px;">
									<li id="tab_two1" class="current">약관</li>
									<li id="tab_two2">금리 및 이율</li>
								</ul>
								<div class="contents" style="margin-left: 300px;">
									<div id="content_two1" class="tabscontent" style="display: block; margin-left: 240px;">
										<a href="${dto.y_fileImg}" download> <strong> 약관
												첨부파일 다운로드 </strong> <i class="icon-save s-20"></i>
										</a>
									</div>
									<div id="content_two2" class="tabscontent">
										<table class="style color">
											<tbody>
												<tr>
													<th><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">기간</font></font></th>
													<th><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">기본이율(%)</font></font></th>
												</tr>
												<tr>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">1개월 이상~ 12개월 미만</font></font></td>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">2.2</font></font></td>
												</tr>
												<tr>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">12개월 이상~ 24개월 미만</font></font></td>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">3.2</font></font></td>
												</tr>
												<tr>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">24개월 이상~ 36개월 미만</font></font></td>
													<td><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">4.4</font></font></td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>

						</div>
						</div>
						<!-- End contents -->
				</div>
				<!-- End horizontal-tabs -->

			</div>
		</div>








		</form>
	</div>
	<!-- ==================== End Single Post  ==================== -->



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