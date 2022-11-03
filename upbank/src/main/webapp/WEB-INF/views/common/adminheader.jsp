<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Upback Admin Page</title>
<script>
        function popup(){
            var url = "http://localhost:3000/transferList";
            var name = "popup test";
            var option = "width = 1000, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function popup2(){
            var url = "http://localhost:3000/autoTransferList";
            var name = "popup test";
            var option = "width = 1000, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function popup3(){
            var url = "http://localhost:3000/accountList";
            var name = "popup test";
            var option = "width = 1000, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function popup4(){
            var url = "http://localhost:3000/stopAcc";
            var name = "popup test";
            var option = "width = 1000, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
               
    </script>

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
           <a href="#">인증센터</a>
          <!-- 22/10/14 세션 아이디 인식해서 변하도록 수정 - 시작 -->
           <c:if test="${sessionScope.customerID == null}">
           	<a href="login.do">로그인</a>
           </c:if>
           <c:if test="${sessionScope.customerID != null}">
           	<a href="admin.ad" style="color:lightblue; font-weight:bold;">${sessionScope.customerID} 홈으로 이동</a>
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
          <a href="admin.ad">
            <img src="resources/images/logo.png" alt="Upbank - 당신의 지갑을 UpBank"style="height:50px" /> 관리자 PAGE
          </a>
          </div>
         </div><!-- End Logo -->
         
         <div class="two-thirds column">
          <nav id="menu" class="navigation" role="navigation">
          <a href="#">Show navigation</a><!-- this appear on small devices -->
          <ul id="nav">
            <li><a>조회</a>
              <ul>
                <li><a href="adminSearchAccount.ad">계좌조회</a></li>
                <li><a href="adminChangeAccount.ad">계좌상태변경</a></li>

                <li><a href="javascript:popup3()">전체계좌조회</a></li>
                <li><a href="javascript:popup4()">거래중지계좌목록</a></li>
              </ul>
            </li>
            <li><a>이체</a>
              <ul>
                <li><a href="javascript:popup()">이체결과조회</a></li>
                <li><a href="javascript:popup2()">자동이체결과조회</a></li>
              </ul>
            </li>
            <li><a>금융상품</a>
              <ul>
                <li><a href="http://localhost:8022/depositProductList.do">예금</a>
                  <ul>
    		        <li><a href="depositEdit.do">예적금관리</a></li>
    		        <li><a href="depositEdit.do">예금관리</a></li>
                    <li><a href="inssvnEdit.do">적금관리</a></li>
                    <li><a href="terminateList.do">계좌해지</a></li>
		          </ul>
                </li>
                <li><a href="http://localhost:8022/loan_product.lo">대출</a>
               	  <ul>
    		        <li><a href="http://localhost:8022/loan_product.lo">대출 상품 조회</a></li>
                    <li><a href="${path}/loan_product_add.lo">대출 상품 등록</a></li>
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
            <li><a >외환</a>
              <ul>
                <li><a href="CurrencyExchangeAdmin.ad">환전수령여부변경</a></li>
              </ul>
            </li>
            <li><a href="http://localhost:8022/noticeList.ad">고객센터</a>
              <ul>
                <li><a href="http://localhost:8022/noticeList.ad">고객센터메인</a></li>
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