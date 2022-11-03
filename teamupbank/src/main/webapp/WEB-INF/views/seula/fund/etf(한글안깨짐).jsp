<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
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
			
			String address ="https://finance.naver.com/api/sise/etfItemList.nhn";
			
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("Content-Type", "application/json;UTF-8");
			
			InputStreamReader ir = new InputStreamReader(urlConn.getInputStream(), "EUC_KR");
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
	   	 				JSONParser parser = new JSONParser();
	   	 				//데이터를 파싱하여 배열로 추출
	   	 				Object obj = parser.parse(line);
	   	 				
	   	 				JSONObject jsonMain  = (JSONObject)obj;
	   	 				JSONObject jsonSub = (JSONObject)jsonMain.get("result");
	   	 				JSONArray jsonArr2 = (JSONArray)jsonSub.get("etfItemList");
	   	 				if(jsonArr2.size() >0){
	   	 				
	   	 				for(int i = 0 ; i <jsonArr2.size() ; i++){
	   	 					JSONObject jobj = (JSONObject)jsonArr2.get(i);
	   	 					
	   	 					String itemcode = String.valueOf(jobj.get("itemcode"));
	   	 					String etfTabCode = String.valueOf(jobj.get("etfTabCode"));
	   	 					String itemname = String.valueOf(jobj.get("itemname"));
	   	 					String nowVal = String.valueOf(jobj.get("nowVal"));
	   	 					String changeVal = String.valueOf(jobj.get("changeVal"));
	   	 					String changeRate = String.valueOf(jobj.get("changeRate"));
						   	String nav = String.valueOf(jobj.get("nav"));
						   	String threeMonthEarnRate = String.valueOf(jobj.get("threeMonthEarnRate"));
						   	String quant = String.valueOf(jobj.get("quant"));
						   	String amonut = String.valueOf(jobj.get("amonut"));
						   	String marketSum = String.valueOf(jobj.get("marketSum"));
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