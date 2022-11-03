<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.*" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>Upbank | CurrencyInfo</title>

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
			YY_EFEE_R	String			년환가료율	
			TEN_DD_EFEE_R	String	10일환가료율	
			KFTC_DEAL_BAS_R	String	서울외국환중개 매매기준율	
			KFTC_BKPR	String	서울외국환중개 장부가격
			*/
			
			String authkey = "a83WP1xrmUSbhA9da9X8JyLCX0gYNORA";
			SimpleDateFormat fm1 = new SimpleDateFormat("yyyyMMdd");
			String bDate = fm1.format(new Date());
			String address ="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="
							+ authkey + "&searchdate=" + bDate +"&data=AP01";
			
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
     
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>환율</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">환율</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="${path}/CurrencyInfo.cr">환율조회</a></li>
         <li><a href="${path}/CurrencyCalc.cr">환율계산기</a></li>
         <li><a href="${path}/CurrencyExchangeMain.cr">환전신청</a></li>
       </ul><!-- End arrow-list -->
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
	   	 			<th>통화명</th>
	   	 			<th>통화코드</th>
	   	 			<th>송금받을때</th>
	   	 			<th>송금보낼때</th>
	   	 			<th>매매기준율</th>
	   	 			<th>장부가격</th>
	   	 			<th>년환가료율</th>
	   	 			<th>10일환가료율</th>
	   	 			<th>서울외국환중계<br>매매기준율</th>
	   	 			<th>서울외국환중계<br>장부가격</th>
	   	 		</tr>
	   	 			<%
	   	 				response.setCharacterEncoding("UTF-8");
	   	 				request.setCharacterEncoding("UTF-8");
	   	 				JSONParser parser = new JSONParser();
	   	 				//데이터를 파싱하여 배열로 추출
	   	 				JSONArray arr = (JSONArray)parser.parse(line);
	   	 			
	   	 				for(int i = 0 ; i <arr.size() ; i++){
	   	 					JSONObject obj = (JSONObject)arr.get(i);
	   	 					String cur_unit = (String)obj.get("cur_unit");
	   	 					String cur_nm = (String)obj.get("cur_nm");
	   	 					String ttb = (String)obj.get("ttb");
	   	 					String tts = (String)obj.get("tts");
	   	 					String deal_bas_r = (String)obj.get("deal_bas_r");
	   	 					String bkpr = (String)obj.get("bkpr");
						   	String yy_efee_r = (String)obj.get("yy_efee_r");
						   	String ten_dd_efee_R = (String)obj.get("ten_dd_efee_R");
						   	String kftc_deal_bas_r = (String)obj.get("kftc_deal_bas_r");
						   	String kftc_bkpr = (String)obj.get("kftc_bkpr");
					%>
					<tr>
	   	 				<td><%= cur_nm%></td>
	   	 				<td><%= cur_unit%></td>
	   	 				<td><%= ttb%></td>
	   	 				<td><%= tts%></td>
	   	 				<td><%= deal_bas_r%></td>
	   	 				<td><%= bkpr%></td>
	   	 				<td><%= yy_efee_r%></td>
	   	 				<td><%= ten_dd_efee_R%></td>
	   	 				<td><%= kftc_deal_bas_r%></td>
	   	 				<td><%= kftc_bkpr%></td>
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
   
   	<!-- 풋터 -->
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer><!-- <<< End Footer >>> -->
	</div><!-- End wrap --> 

</body>
</html>