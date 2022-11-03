<!-- 
	22/10/14 아람: 로고 수정, 로고 링크 수정, 로그인 시 로그인 링크를 로그아웃 버튼으로 변경 

 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function login(e) {
	if(${sessionScope.customerID == null}) {
		alert("로그인이 필요합니다");
		window.location.href="${path}/login.do";
	} else {
		window.location.href= e;			
	}
}
</script>
</head>
<body>
	<div class="top-bar">
       <div class="container clearfix common">
        <div class="slidedown">
        
         <div class="eight columns">
           <div class="phone-mail">
             <a><i class="icon-phone"></i> Phone : 02) 000 - 0000</a>
             <a href="info@upbank.com"><i class="icon-envelope-alt"></i> Mail : info@upbank.com</a>
           </div><!-- End phone-mail -->
         </div>
         <div class="eight columns">
           <div class="social">
           <a href="main.do">홈으로</a>
           <a href="#">인증센터</a>
           
           
          <!-- 22/10/14 세션 아이디 인식해서 변하도록 수정 - 시작 -->
           <c:if test="${sessionScope.customerID == null}">
           <a href="join.do">회원가입</a>
           <a href="login.do">로그인</a>
           </c:if>
           
           <c:if test="${sessionScope.customerID == 'admin'}">
           <a href="admin.ad" style="color:lightblue; font-weight:bold;">${sessionScope.customerID} 홈으로 이동</a>
           <a href="logout.do">로그아웃</a>
           </c:if>
           
           <c:if test="${sessionScope.customerID != null && sessionScope.customerID != 'admin'}">
           	
	 	   <a href="mypage.do" style="color:lightblue; font-weight:bold;">${sessionScope.customerID} 님 환영합니다!</a>
	 	   
	 	   <a href="logout.do">로그아웃</a>
	          
           </c:if>
          <!-- 22/10/14 세션 아이디 인식해서 변하도록 수정 - 끝 -->
          
          
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
          <a href="main.do">
            <img src="resources/images/logo.png" alt="Upbank - 당신의 지갑을 UpBank" style="height:50px" />
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
                <li><a href="SearchRangeSelect.do">거래내역조회</a></li>
                <li><a href="SleepDisableAcc.do">휴면/해지계좌조회</a></li>
                <li><a href="SoonEndLoanSearch.do">기일도래계좌조회</a></li>
                <!-- 
                  <ul>
                   <li><a href="index_header_2.html">Header 2</a></li>
                   <li><a href="index_header_3.html">Header 3</a></li>
                   <li><a href="index_header_4.html">Header 4</a></li>
                   <li><a href="index_header_5.html">Header 5</a></li>
                   <li><a href="index_header_fixed.html">Header Fixed</a></li>
                  </ul>
                -->
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
                <li><a href="transferList.do">이체결과조회</a></li>
                
                <li><a href="autoTransferInsert.do">자동이체등록</a></li>

              </ul>
            </li>
            <li><a href="#2">금융상품</a>
              <ul>
                <li><a href="depositMain.do">예금</a>
                  <ul>
    		        <li><a href="depositMain.do">예금메인</a></li>
                    <li><a href="depositList.do">예금상품</a></li>
                    <li><a href="inssvnList.do">적금상품</a></li>
                    <li><a href="AccDefaultInsert.do">신규입출금계좌</a></li>
                    <li><a href="terminateList.do">계좌해지</a></li>
		          </ul>
                </li>
                <li><a href="loan_main.lo">대출</a>
               	  <ul>
    		        <li><a href="loan_product.lo">대출 상품리스트</a></li>
                     <li><a href="#" onclick="login('${path}/loan_join_result.lo');">대출 신청 결과 조회</a></li>
                      <li><a href="loan_account.lo">대출 계좌 조회</a></li>
		          </ul>
		        </li>
		        <li><a href="etf.do">펀드</a>
               	  <ul>
    		        <li><a href="etf.do">ETF</a></li>
                    <li><a href="etn.do">ETN</a></li>
		          </ul>
		        </li>
              </ul>
            </li>
            <li><a href="CurrencyInfo.cr">외환</a>
              <ul>
                <li><a href="CurrencyInfo.cr">환율조회</a></li>
                <li><a href="CurrencyCalc.cr">환율계산기</a></li>
                <li><a href="CurrencyExchangeMain.cr">환전신청</a></li>
              </ul>
            </li>
            <li><a href="notice.do">고객센터</a>
              <ul>
                <li><a href="notice.do">고객센터메인</a></li>
                <li><a href="faq.do">자주하는질문</a></li>
                <li><a href="cnsltInsert.do">상담신청</a></li>
                <li><a href="cnslt.do">상담내역</a></li>
              </ul>
            </li>
          </ul>
         </nav>
        </div><!-- End Menu -->
       
       </div><!-- End Container -->
     </div><!-- End main-header -->
     
</body>
</html>