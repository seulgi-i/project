package com.mvc.upbank.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.HolidayDataDTO;


public class HolidayDataService {
	
	private static final Logger logger = LoggerFactory.getLogger(HolidayDataService.class);
	
	
	//해당 날짜가 주말인지 아닌지 체크하는 메소드
	public static String getWeekendInfo(HttpServletRequest req, Model model, String CUR_DATE) {
		logger.info("HolidayDataService : getWeekendInfo");
		String year;
		String month;
		String day;
		
		String fullDate = String.valueOf(CUR_DATE);
		LocalDate date;
		
		if(fullDate != null) {
		year = fullDate.substring(0, 4);
		month = fullDate.substring(4,6);
		day = fullDate.substring(6, 8);
		
		date = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));        
		
		// 2. DayOfWeek 객체 구하기        
		} else {
		 date = LocalDate.now();
		}
		DayOfWeek dayOfWeek = date.getDayOfWeek();         
		// 3. 텍스트 요일 구하기 (영문)  
		String weekend = dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.US);
		return weekend;
	}
	
	//년도, 월 입력시 공휴일을 구하는 API 주소를 반환하는 메소드	
	public static String getRestDeInfo(HttpServletRequest req, Model model, String cur_date_sql) {
		// API URL을 반환
		String holiURL = "";
		SimpleDateFormat year = null;
		SimpleDateFormat month = null;
		String solYear = null;
		String solMonth = null;
		try {
			String servicekey = "%2FX9LqNHTnQUpiqRSh9lCVpDFom77SOAVADjInKK0AXmY9KYJU74QFxfwEyNuF6zjvvRbXQ%2BTq2AuxpSEajNMRg%3D%3D";

			if(cur_date_sql.length() > 8) {
				solYear = cur_date_sql.substring(0,4);
				solMonth = cur_date_sql.substring(5,7);
			} else if(cur_date_sql.length() == 8) {
				solYear = cur_date_sql.substring(0,4);
				solMonth = cur_date_sql.substring(4,6);
			}	else {
				year = new SimpleDateFormat("yyyy");
				month = new SimpleDateFormat("MM");
				solYear = year.format(new Date());
				solMonth = month.format(new Date());
			}
		
		holiURL = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear="
				  + solYear +"&solMonth=" + solMonth + "&ServiceKey=" 
				  + servicekey;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return holiURL;
	}
	

    // 휴일 xml을 파싱하기 위한 tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	
	public static List<HolidayDataDTO> result(HttpServletRequest req, Model model, String cur_date){
	URL url = null;
	HttpURLConnection httpUrlConnection = null;
	List<HolidayDataDTO> holiList = new ArrayList<HolidayDataDTO>();
	try {
		url = new URL(getRestDeInfo(req, model, cur_date));
		URLConnection urlConnection = url.openConnection();
		httpUrlConnection = (HttpURLConnection) urlConnection;
		httpUrlConnection.setDoInput(true);
		httpUrlConnection.setDoOutput(true);
		httpUrlConnection.setRequestMethod("GET");
		httpUrlConnection.setUseCaches(false);
		httpUrlConnection.setDefaultUseCaches(false);
		httpUrlConnection.setRequestProperty("Content-Type", "text/xml");

		BufferedReader rd;
		rd = new BufferedReader(new InputStreamReader(httpUrlConnection.getInputStream(), "UTF-8"));	
		
		StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        httpUrlConnection.disconnect();
		
        String xml = sb.toString(); // xml URL을 스트링 하나로 받은 것 => 파싱하면 됨.
        
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	        Document doc = dBuilder.parse(new InputSource(new StringReader(xml)));
	        
	     // root tag 
	        doc.getDocumentElement().normalize();
	        // Root element: result
	        
	     // 파싱할 tag
	        NodeList nList = doc.getElementsByTagName("item");
	        // 파싱할 리스트 수 
		        for(int i = 0; i < nList.getLength(); i++){		
		        	Node nNode = nList.item(i);
		        	if(nNode.getNodeType() == Node.ELEMENT_NODE){
		        						
		        		Element eElement = (Element) nNode;
		        		HolidayDataDTO dto = new HolidayDataDTO();
		        		
		        		dto.setDateKind(getTagValue("dateKind", eElement));
		        		dto.setDateName(getTagValue("dateName", eElement));
		        		dto.setIsHoliday(getTagValue("isHoliday", eElement));
		        		dto.setLocdate(getTagValue("locdate", eElement));
		        		dto.setSeq(Integer.parseInt(getTagValue("seq", eElement)));
	
		        		holiList.add(dto);
		        	}	// for end
		        }	// if end
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return holiList;
	}
	
}
