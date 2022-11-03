<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.*" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<%@ include file="/WEB-INF/views/common/setting.jsp" %>
 
  <title>펀드</title>
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
  <% 
		String line = "";
		try{
			//한국수출입은행 환율 Open API (인증키 발급 및 api 사용 가능)
			/*
			https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=a83WP1xrmUSbhA9da9X8JyLCX0gYNORA&searchdate=20221005&data=AP01
			참고 사이트: https://thesse.tistory.com/6 => JSON데이터 파싱 예시
			
			RESULT		Integer	조회 결과	1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
			CUR_UNIT	String	통화코드	
			CUR_NM		String	국가/통화명	
			TTB		String	전신환(송금)받으실때	
			TTS		String	전신환(송금)보내실때	
			DEAL_BAS_R	String	매매 기준율	
			BKPR		String	장부가격	
			YY_EFEE_R	String	년환가료율	
			TEN_DD_EFEE_R	String	10일환가료율	
			KFTC_DEAL_BAS_R	String	서울외국환중개 매매기준율	
			KFTC_BKPR	String	서울외국환중개 장부가격
			*/
			
			String address ="https://finance.naver.com/api/sise/etfItemList.nhn";
			
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			
			InputStreamReader ir = new InputStreamReader(urlConn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(ir);
			
			line = br.readLine();
			
			br.close();
			ir.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
	
	%>
  
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>펀드</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">펀드</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/etf.do">ETF</a></li>
         <li><a href="${path}/etn.do">ETN</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <div class="widget" style="margin-top:100px">
     <li style="text-indent: 1px;"><i class="icon-comments-alt s-20 color"></i>고객센터</li>
       <!-- Title Widget -->
       <p style="text-indent: 5px;">1588-1234</p>
       <p style="text-indent: 5px;">1599-1234</p>
     </div>
     <!-- End -->
     
     
   
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
<div class="post single style-1">
	      <h3 class="title bottom-1"> 본문 제목 </h3><!-- Title Post -->
	      <div class="post-content">
	   	 	<table border=1px cellspacing=0px>
	   	 		<tr>
	   	 			<th>종목코드</th>
	   	 			<th>etfTabCode</th>
	   	 			<th>종목명</th>
	   	 			<th>현재가</th>
	   	 			<th>전일비</th>
	   	 			<th>등락률</th>
	   	 			<th>NAV</th>
	   	 			<th>3개월 수익율</th>
	   	 			<th>거래량</th>
	   	 			<th>거래대금(백만)</th>
	   	 			<th>시가총액(억)</th>
	   	 		</tr>
	   	 			<%
	   	 				response.setCharacterEncoding("UTF-8");
	   	 				request.setCharacterEncoding("UTF-8");
	   	 				JSONParser parser = new JSONParser();
	   	 				//데이터를 파싱하여 배열로 추출
	   	 				JSONArray arr = (JSONArray)parser.parse(line);
	   	 			
	   	 				for(int i = 0 ; i <arr.size() ; i++){
	   	 					JSONObject obj = (JSONObject)arr.get(i);
	   	 					String itemcode = (String)obj.get("itemcode");
	   	 					String etfTabCode = (String)obj.get("etfTabCode");
	   	 					String itemname = (String)obj.get("itemname");
	   	 					String nowVal = (String)obj.get("nowVal");
	   	 					String changeVal = (String)obj.get("changeVal");
	   	 					String changeRate = (String)obj.get("changeRate");
						   	String nav = (String)obj.get("nav");
						   	String threeMonthEarnRate = (String)obj.get("threeMonthEarnRate");
						   	String quant = (String)obj.get("quant");
						   	String amonut = (String)obj.get("amonut");
						   	String marketSum = (String)obj.get("marketSum");
					%>
					<tr>
	   	 				<td><%= itemcode%></td>
	   	 				<td><%= etfTabCode%></td>
	   	 				<td><%= itemname%></td>
	   	 				<td><%= nowVal%></td>
	   	 				<td><%= changeVal%></td>
	   	 				<td><%= changeRate%></td>
	   	 				<td><%= nav%></td>
	   	 				<td><%= threeMonthEarnRate%></td>
	   	 				<td><%= quant%></td>
	   	 				<td><%= amonut%></td>
	   	 				<td><%= marketSum%></td>
	   	 			</tr>
					
					<% 	   	
	   	 				}
	   	 			%>
	   	 	</table>
	      </div><!-- End post-content -->
	     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>