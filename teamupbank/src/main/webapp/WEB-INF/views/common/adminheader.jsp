<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="top-bar">
       <div class="container clearfix common">
        <div class="slidedown">
        
         <div class="eight columns">
           <div class="phone-mail">
             <a><i class="icon-phone"></i> Phone : +22 665 450 210</a>
             <a href="info@website.com"><i class="icon-envelope-alt"></i> Mail : info@website.com</a>
           </div><!-- End phone-mail -->
         </div>
         <div class="eight columns">
           <div class="social">
           <a href="main.do">홈으로</a>
           <a href="join.do">회원가입</a>
           <a href="login.do">로그인</a>
           <a href="#">인증센터</a>
           </div>
          </div><!-- End social-icons -->
          
         </div><!-- End slidedown -->
       </div><!-- End Container -->
       
     </div><!-- End top-bar -->
     
     <div class="main-header">
       <div class="container clearfix common">
         <a href="#" class="down-button"><i class="icon-angle-down"></i></a><!-- this appear on small devices -->
         <div class="one-third column">
          <div class="logo">
          <a href="index.html">
            <img src="images/logo.png" alt="Invention - Creative Responsive Theme" />
          </a>
          </div>
         </div><!-- End Logo -->
         
         <div class="two-thirds column">
          <nav id="menu" class="navigation" role="navigation">
          <a href="#">Show navigation</a><!-- this appear on small devices -->
          <ul id="nav">
            <li><a href="SearchMain.do">조회</a>
              <ul>
                <li><a href="SearchMain.do">계좌조회</a></li>
                <li><a href="index_3.html">거래내역조회</a></li>
                <li><a href="index_4.html">거래중지/휴면계좌조회</a></li>
                <li><a href="index_mobile_app.html">해지계좌조회</a></li>
                <!-- 
                  <ul>
                   <li><a href="index_header_2.html">Header 2</a></li>
                   <li><a href="index_header_3.html">Header 3</a></li>
                   <li><a href="index_header_4.html">Header 4</a></li>
                   <li><a href="index_header_5.html">Header 5</a></li>
                   <li><a href="index_header_fixed.html">Header Fixed</a></li>
                  </ul>
                -->
                <li><a href="index_one_page.html">기타조회</a></li>
                <!-- 
                  <ul>
                   <li><a href="index_footer_2.html">Footer 2</a></li>
                   <li><a href="index_footer_3.html">Footer 3</a></li>
                   <li><a href="index_footer_4.html">Footer 4</a></li>
                   <li><a href="index_footer_5.html">Footer 5</a></li>
                  </ul>
                -->
              </ul>
            </li>
            <li><a href="transfer.do">이체</a>
              <ul>
                <li><a href="transfer.do">계좌이체</a></li>
                <li><a href="manyTransfer.do">다계좌이체</a></li>
                <li><a href="transferList.do">이체결과조회</a></li>
                
                <li><a href="autoTransfer.do">자동이체</a></li>
                <li><a href="autoTransferRegistration.do">자동이체등록</a></li>
                <li><a href="autoTransferList.do">자동이체결과조회</a></li>
                
                
                <li><a href="sidebar_left.html">공과금</a></li>
              </ul>
            </li>
            <li><a href="#2">금융상품</a>
              <ul>
                <li><a href="depositMain.do">예금</a>
                  <ul>
    		        <li><a href="depositMain.do">예금메인</a></li>
                    <li><a href="#3-2">상품&가입</a></li>
                    <li><a href="#3-2">조회/추가입금</a></li>
                    <li><a href="#3-2">계좌해지</a></li>
                    
		          </ul>
                </li>
                <li><a href="loan_main.lo">대출</a>
               	  <ul>
    		        <li><a href="#3-1"></a></li>
                    <li><a href="#3-2"></a></li>
		          </ul>
		        </li>
		        <li><a href="etf.do">펀드</a>
               	  <ul>
    		        <li><a href="etfDetail.do">ETF</a></li>
                    <li><a href="etn.do">ETN</a></li>
		          </ul>
		        </li>
              </ul>
            </li>
            <li><a href="CurrencyInfo.do">외환</a>
              <ul>
                <li><a href="CurrencyInfo.do">환율조회</a></li>
                <li><a href="CurrencyCalc.do">환율계산기</a></li>
                <li><a href="CurrencyExchangeSearch.do">환전신청</a></li>
              </ul>
            </li>
            <li><a href="notice.do">고객센터</a>
              <ul>
                <li><a href="notice.do">고객센터메인</a></li>
                <li><a href="blog_2.html">자주하는질문</a></li>
                <li><a href="blog_3.html">상담신청</a></li>
                <li><a href="blog_3_filter.html">상담내역</a></li>
              </ul>
            </li>
          </ul>
         </nav>
        </div><!-- End Menu -->
       
       </div><!-- End Container -->
     </div><!-- End main-header -->
     
</body>
</html>