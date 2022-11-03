<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

<%@ include file="/WEB-INF/views/chaey/setting_chaey.jsp" %>

  <title> Unbank | 내 자산도 Up! </title>
  
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
</head>
<style>
  
table {
	width: 100%;
    margin-bottom: 10px;
    text-align: center;
    font-size: 17px;
    font-weight: bold;
    font-family: NANUMSQUARE_AC;
	height: 13%;
    background: #378ac4;
}
table th {
	vertical-align: bottom;
	height: 47%;
}
table th a{
	color: white;
}
table th a:hover {

           color: #000000;

         text-decoration: 0px 2px 2px #000;

 }    
table td {
	color: white;
}
</style>
<body>

  <div id="wrap" class="boxed">
  
   <header>
      <%@ include file="/WEB-INF/views/common/header.jsp" %>     
   </header><!-- <<< End Header >>> -->
   
   <div>
   <div class="slider-1 clearfix" style="display:flex; justify-content: center; margin-top:30px;">

     <div class="flex-container" style="width:55%; height: 70%">
       <div class="flexslider loading">
        <ul class="slides" >
        
        
          <li style="background:url(${path}/resources/images/img/chaey/main1.png) no-repeat; background-position:50% 0">
           <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%">
            
             <h2 data-toptitle="20%">  </h2>
             <p data-bottomtext="39%">
             
             </p>
             <div class="links" data-bottomlinks="20%">
             </div>
           </div>
         </div><!-- End Container -->
         </li><!-- End item -->
          
          <li style="background:url(${path}/resources/images/img/chaey/main2.png) no-repeat; background-position:50% 0">
          
          <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%">
            
             <h2 data-toptitle="20%"></h2>
             <p data-bottomtext="39%">
             
             </p>
             <div class="links" data-bottomlinks="20%">
             </div>
           
           </div>
         </div><!-- End Container -->
          
         </li><!-- End item -->
         
         
         <li style="background:url(${path}/resources/images/img/chaey/main3.png) no-repeat; background-position:50% 0">
          
          <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%">
            
             <h2 data-toptitle="20%">  </h2>
             <p data-bottomtext="39%">
             
             </p>
             <div class="links" data-bottomlinks="20%" style="width:55%">
             </div>
             
           
           </div>
         </div><!-- End Container -->
          
         </li><!-- End item -->
         
         
         <li style="background:url(${path}/resources/images/img/chaey/main4.png) no-repeat; background-position:50% 0">
          
          <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%">
            
             <h2 data-toptitle="20%">  </h2>
             <p data-bottomtext="39%">
             
             </p>
             <div class="links" data-bottomlinks="20%">
             </div>
             
           </div>
         </div><!-- End Container -->
          
         </li><!-- End item -->
         
         <li style="background:url(${path}/resources/images/img/chaey/main5.png) no-repeat; background-position:50% 0">
          
          <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%"> 
            
             <h2 data-toptitle="20%">  </h2>
             <p data-bottomtext="39%">
             
             </p>
             <div class="links" data-bottomlinks="20%">
             </div>
             
           </div>
         </div><!-- End Container -->
          
         </li><!-- End item -->
         
         <li style="background:url(${path}/resources/images/img/chaey/main6.png) no-repeat; background-position:50% 0">
          
          <div class="container" style="width:500px; height: 70%">
           <div class="sixteen columns contain" style="width:500px; height: 70%">
            
             <h2 data-toptitle="20%">  </h2>
             <p data-bottomtext="39%"></p>
             <div class="links" data-bottomlinks="20%">
             </div>
             
           </div>
         </div><!-- End Container -->
          
         </li><!-- End item -->
         
         
        </ul>
       </div>
     <div class="sixteen columns" style="width:30%"><hr class="line bottom-3" style="width:30%"></div><!-- End line -->
      </div>
   
     
     
    <div class="services style-3 bottom-3" style="width:25%; margin-top:20px;">
     <div style="display:flex; justify-content: center;">
       <div class="eight columns bottom-3">
         <div class="item active bottom-3">
           <div class="circle float-left" style="background-color:#378ac4;  border-radius: 10px; width: 158px; height: 120px; text-align: start; padding-left: 13px; padding-top: 80px;">
           <a href="SearchMain.do"><span style=" font-size: 20px; font-weight:bold; position: absolute;">조회</span></a></div>
         </div>
       </div><!-- End item -->
       
       <div class="eight columns bottom-3">
         <div class="item bottom-3">
              <div class="circle float-left" style="background-color:#4b4c4d;  border-radius: 10px; width: 158px; height: 120px; text-align: start; padding-left: 13px; padding-top: 80px;">
           <a href="transfer.do"><span style=" font-size: 20px; font-weight:bold; position: absolute;">이체</span></a></div>
         </div>
       </div><!-- End item -->
       </div>
       
       <div style="display:flex; justify-content: center;">
         <div class="quick-icon-wrap">
         <ul style="display: flex;">
             <li class="link-num1" style="margin: 10 10 10 10;" >
                 <a href="login.do" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/04.png">
                 <span class="ico" style="display: block;"></span>
                  로그인
                </a>
            </li>
          <li class="link-num1" style="margin: 10 10 10 10;">
                 <a href="AccDefaultInsert.do" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/05.png">
                 <span class="ico" style="display: block;"></span>
                 신규계좌
                </a>
            </li>
           <li class="link-num1" style="margin: 10 10 10 10;">
                 <a href="autoTransferInsert.do" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/03.png">
                 <span class="ico" style="display: block;"></span>
                 자동이체
                </a>
            </li>
            </ul>
            <ul style="display: flex;">
            
             <li class="link-num1" style="margin: 10 10 10 10;">
                 <a href="CurrencyInfo.cr" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/02.png">
                 <span class="ico" style="display: block;"></span>
                환율
                </a>
            </li>
             <li class="link-num1" style="margin: 10 10 10 10;">
                 <a href="notice.do" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/01.png">
                 <span class="ico" style="display: block;"></span>
                 공지사항
                </a>
            </li>
              <li class="link-num1" style="margin: 10 10 10 10;">
                 <a href="cnslt.do" onclick="" style="display: inline-block; text-align: center;">
                 <img alt="" src="${path}/resources/images/img/seula/06.png">
                 <span class="ico" style="display: block;"></span>
                 상담내역
                </a>
            </li>
            </ul>
         </div>
       </div>
    </div>
    </div>
    
             <div class="sixteen columns"><hr class="line bottom-3"></div><!-- End line -->
        <table id="1line">
     	<tr>
     	<th style="width: 17%;"></th>
     	<th></th>
     	<th><a href="depositMain.do">예적금</a></th>
     	<th><a href="etf.do">펀드</a></th>
     	<th><a href="CurrencyExchangeMain.cr">환전지갑</a></th>
     	<th><a href="loan_main.lo">대출</a></th>
     	<th></th>
     	<th style="width: 17%;"></th>
     	</tr>
     	<tr>
     	<td style="width: 17%;"></td>
     	<td>
     	<td style="padding-top: 12px;">부자되는 알짜정보</td>
     	<td>한 눈에 보는 펀드</td>
     	<td>알뜰하게 환전하기</td>
     	<td>UpBank 든든대출</td>
		<td>
     	<td style="width: 17%;"></td>
     	</tr>
     </table>
    
    
    
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
      <%@ include file="/WEB-INF/views/common/footer_new.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
</body>
</html>