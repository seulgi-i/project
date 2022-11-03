package com.mvc.upbank.service;

import java.io.*;
import java.net.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.CurrencyDAO;
import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dto.CurExchangeDTO;
import com.mvc.upbank.dto.CurrencyDTO;
import com.mvc.upbank.dto.HolidayDataDTO;
import com.mvc.upbank.dto.SearchDTO;


@Service
public class CurrencyServiceImpl implements CurrencyService{
	private static final Logger logger = LoggerFactory.getLogger(CurrencyService.class);
	
	@Autowired
	CurrencyDAO dao;
	@Autowired
	SearchDAO sdao;
	
	@Override
	public void CurrencyInfo(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyInfo");
		String line = "";
		InputStreamReader ir = null;
		BufferedReader br = null;
		String cur_date ="";
		String cur_date_sql =null;
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
			
			String authkey = "a83WP1xrmUSbhA9da9X8JyLCX0gYNORA";
			SimpleDateFormat fm1 = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");
			cur_date = fm1.format(new Date());
			cur_date_sql = fm2.format(new Date());
			String address ="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="
							+ authkey + "&searchdate=" + cur_date +"&data=AP01";
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			
			ir = new InputStreamReader(urlConn.getInputStream(), "UTF-8");
			br = new BufferedReader(ir);
			
			line = br.readLine();
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
				br.close();
				}
				if (ir != null) {
				ir.close();
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		JSONParser parser = new JSONParser();
		//데이터를 파싱하여 배열로 추출
		JSONArray arr;
		List<CurrencyDTO> list = new ArrayList<CurrencyDTO>();
		
		try {
			arr = (JSONArray)parser.parse(line);
			
			if(dao.CurrencySelectDate(cur_date_sql) == 0) {
				for(int i = 0 ; i <arr.size() ; i++){
					
					CurrencyDTO dto = new CurrencyDTO();
					
					JSONObject obj = (JSONObject)arr.get(i);
					String cur_unit = String.valueOf(obj.get("cur_unit")); //통화코드
					String cur_nm = String.valueOf(obj.get("cur_nm")); //국가이름
					String ttb = String.valueOf(obj.get("ttb")).replace(",", ""); // TTB 전신환(송금)받으실때	
					String tts = String.valueOf(obj.get("tts")).replace(",", ""); //TTS	전신환(송금)보내실때
					String deal_bas_r = String.valueOf(obj.get("deal_bas_r")).replace(",", ""); //DEAL_BAS_R	매매 기준율
					String bkpr = String.valueOf(obj.get("bkpr")).replace(",", ""); //장부가격	
				   	
				   	dto.setCur_unit(cur_unit);
				   	dto.setCur_nm(cur_nm);
				   	dto.setTtb(Double.parseDouble(ttb));
				   	dto.setTts(Double.parseDouble(tts));
				   	dto.setDeal_bas_r(Double.parseDouble(deal_bas_r));
				   	dto.setBkpr(Integer.parseInt(bkpr));
				   	dto.setCUR_DATE(java.sql.Date.valueOf(cur_date_sql));
				   	
				   	list.add(dto);
				   	
				   	dao.CurrencyInsert(dto);
				}
				
			}	else {
				for(int i = 0 ; i <arr.size() ; i++){
					
					CurrencyDTO dto = new CurrencyDTO();
					
					JSONObject obj = (JSONObject)arr.get(i);
					String cur_unit = String.valueOf(obj.get("cur_unit")); //통화코드
					String cur_nm = String.valueOf(obj.get("cur_nm")); //국가이름
					String ttb = String.valueOf(obj.get("ttb")).replace(",", ""); // TTB 전신환(송금)받으실때	
					String tts = String.valueOf(obj.get("tts")).replace(",", ""); //TTS	전신환(송금)보내실때
					String deal_bas_r = String.valueOf(obj.get("deal_bas_r")).replace(",", ""); //DEAL_BAS_R	매매 기준율
					String bkpr = String.valueOf(obj.get("bkpr")).replace(",", ""); //장부가격	
				   	
				   	dto.setCur_unit(cur_unit);
				   	dto.setCur_nm(cur_nm);
				   	dto.setTtb(Double.parseDouble(ttb));
				   	dto.setTts(Double.parseDouble(tts));
				   	dto.setDeal_bas_r(Double.parseDouble(deal_bas_r));
				   	dto.setBkpr(Integer.parseInt(bkpr));
				   	dto.setCUR_DATE(java.sql.Date.valueOf(cur_date_sql));
				   	
				   	list.add(dto);
				}
			}	
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			
		}
		//공휴일 정보 조회
		List<HolidayDataDTO> hList = HolidayDataService.result(req, model, cur_date_sql);
		String weekend = HolidayDataService.getWeekendInfo(req, model, cur_date);
		
		model.addAttribute("hList", hList);
		model.addAttribute("weekend", weekend);
		model.addAttribute("list", list);
	}

	@Override
	public void CurrencyCalc(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyCalc");
		
        String won = req.getParameter("won");
        String operator = req.getParameter("operator");
        double CurrencyCalc = dao.CurrencyCalc(operator);
        if (CurrencyCalc != 0) {
        double result = Double.parseDouble(won) / CurrencyCalc;
        
        String format = "#.##";
        DecimalFormat df = new java.text.DecimalFormat(format);
        
        String currencyResult = df.format(result);
        double DcurrencyResult = Double.valueOf(currencyResult);
        model.addAttribute("DcurrencyResult", DcurrencyResult);
        model.addAttribute("operator", operator);
        model.addAttribute("won", won);
        } else {
        	model.addAttribute("CurrencyCalc", CurrencyCalc);
        }
	}

	@Override
	public void CurrencyExchangeMain(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeMain");
		double todayCurrency = dao.CurrencyCalc("USD");
		if (todayCurrency != 0) {
		double noticeCurrency = todayCurrency - 10;
		double goodCurrency = todayCurrency-(todayCurrency - noticeCurrency)*0.5;
		
		CurrencyDTO dto = new CurrencyDTO();
		dto.setTodayCurrency(todayCurrency);
		dto.setNoticeCurrency(noticeCurrency);
		dto.setGoodCurrency(goodCurrency);
		
		model.addAttribute("dto", dto);
		} else {
			model.addAttribute("todayCurrency", todayCurrency);
		}
	}

	@Override
	public void CurrencyExchangeMain2(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeMain2");
		double todayCurrency = dao.CurrencyCalc("USD");
		double noticeCurrency = todayCurrency - 10;
		double goodCurrency = todayCurrency-(todayCurrency - noticeCurrency)*0.5;
		int exchangeWon = (int)(Integer.parseInt(req.getParameter("currencyExchange"))*goodCurrency);
		
		CurrencyDTO dto = new CurrencyDTO();
		dto.setTodayCurrency(todayCurrency);
		dto.setNoticeCurrency(noticeCurrency);
		dto.setGoodCurrency(goodCurrency);
		dto.setExchangeWon(exchangeWon);
		
		model.addAttribute("dto", dto);
	}

	@Override
	public void CurrencyExchangeMain3(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeMain3");
		Map<String, Object> map = new HashMap<String, Object>();
		int selectCnt = 0;
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		String name = sdao.SearchAccName(id);
		String ACCOUNT_TYPE = "입출금";
		String exchangeWon = req.getParameter("exchangeWon");
		
		LocalDate todaysDate = LocalDate.now();
		LocalDate plus1month = todaysDate.plusDays(30);
		String todayDate = String.valueOf(todaysDate);
		String plusMonth =String.valueOf(plus1month);
		map.put("id", id);
		map.put("name", name);
		map.put("todayDate", todayDate);
		map.put("plusMonth", plusMonth);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		map.put("exchangeWon", exchangeWon);
		
		//가지고있는 입출금계좌 모두 조회해서 리스트에 담기
		List<SearchDTO> list = sdao.SearchProductName(map);
		for(int i = 0 ; i<list.size(); i++) {
			SearchDTO dto = list.get(i);
			String PRODUCT_NAME = dto.getPRODUCT_NAME();
			int BALANCE = dto.getBALANCE();
			map.put("PRODUCT_NAME", PRODUCT_NAME);
			map.put("BALANCE", BALANCE);
			//기존 입출금계좌 개설여부
			selectCnt += sdao.AccDefaultInsertChk(map);
		}
	
		if (selectCnt == 0 ) {
			map.put("selectCnt", selectCnt);
		} else {
			map.put("list", list);
			map.put("selectCnt", selectCnt);
		}
		CurrencyExchangeMain2(req, model);
		model.addAllAttributes(map);
	}

	
	@Override
	@Transactional
	public void CurrencyExchangeMain4(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeMain4");
		int insertCnt = 0;
		//환전수령인에서 보낸 폼 데이터 받기
		String name = req.getParameter("name");
		String exchangeWon = req.getParameter("exchangeWon");
		String usercp = req.getParameter("usercp");
		String email = req.getParameter("useremail")+"@"+req.getParameter("useremail2");
		String whyExchange = req.getParameter("option");
		String exc_date = req.getParameter("exc_date");
		String type = req.getParameter("type");
		String subtype = req.getParameter("subtype");
		String subsubtype = req.getParameter("subsubtype");
		String ACCOUNT = req.getParameter("acctype");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ACCOUNT", ACCOUNT);
		map.put("id", String.valueOf(req.getSession().getAttribute("customerID")));
		SearchDTO sdto = sdao.SearchAccAllColumn(map);
		String ori_accPw = sdto.getACCOUNT_PW();
		
		//환전수령정보 dto에 세팅
		CurExchangeDTO dto = new CurExchangeDTO();
		int balance = sdto.getBALANCE();
		dto.setName(name);
		dto.setACCOUNT(ACCOUNT);
		dto.setUsercp(usercp);
		dto.setEmail(email);
		dto.setReason(whyExchange);
		java.sql.Date receive_date = java.sql.Date.valueOf(exc_date);
		dto.setReceive_date(receive_date);
		dto.setReceive_spot1(type);
		dto.setReceive_spot2(subtype);
		dto.setReceive_spot3(subsubtype);
		java.sql.Date submit_date = java.sql.Date.valueOf(LocalDate.now());
		dto.setSubmit_date(submit_date);
		int cur_exchange = Integer.parseInt(exchangeWon);
		dto.setCur_exchange(cur_exchange);
		if(ACCOUNT_PW.equals(ori_accPw) && balance >= Integer.parseInt(exchangeWon)) {
			dto.setAccount_pw(ACCOUNT_PW);
			insertCnt = dao.CurrencyExcInsert(dto);
		} else if(balance<Integer.parseInt(exchangeWon)) {
			insertCnt = -1;
		} else if(ACCOUNT_PW != ori_accPw) {
			insertCnt = -2;
		}
		model.addAttribute("insertCnt",insertCnt );
		model.addAttribute("dto", dto);
		
	}
	
	@Override
	public void CurrencyExchangeSearch(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeSearch");
		String usercp="";
		usercp = req.getParameter("usercp");
		int selectCnt = dao.CurrencyExcSearchCnt(usercp);
		List<CurExchangeDTO> list = dao.CurrencyExchangeSearch(usercp);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("list", list);
	}

	@Override
	public void CurrencyInfoDate(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyInfoDate");
		
		String CUR_DATE = String.valueOf(req.getParameter("cur_date")).replace("-", "");
		
		//공휴일 정보 조회
		List<HolidayDataDTO> hList = HolidayDataService.result(req, model, CUR_DATE);
		
		//테이블에 구 환율 정보 없을시 등록, 있을시 조회하여 화면단으로 보냄.
		String line = "";
		InputStreamReader ir = null;
		BufferedReader br = null;
		try{
					
			String authkey = "a83WP1xrmUSbhA9da9X8JyLCX0gYNORA";
			String address ="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="
							+ authkey + "&searchdate=" + CUR_DATE +"&data=AP01";
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			
			ir = new InputStreamReader(urlConn.getInputStream(), "UTF-8");
			br = new BufferedReader(ir);
			
			line = br.readLine();
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
				br.close();
				}
				if (ir != null) {
				ir.close();
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		JSONParser parser = new JSONParser();
		//데이터를 파싱하여 배열로 추출
		JSONArray arr;
		List<CurrencyDTO> list = new ArrayList<CurrencyDTO>();
		
		try {
			arr = (JSONArray)parser.parse(line);
			
			if(dao.CurrencySelectDate(String.valueOf(req.getParameter("cur_date"))) == 0) {
				for(int i = 0 ; i <arr.size() ; i++){
					
					CurrencyDTO dto = new CurrencyDTO();
					
					JSONObject obj = (JSONObject)arr.get(i);
					String cur_unit = String.valueOf(obj.get("cur_unit")); //통화코드
					String cur_nm = String.valueOf(obj.get("cur_nm")); //국가이름
					String ttb = String.valueOf(obj.get("ttb")).replace(",", ""); // TTB 전신환(송금)받으실때	
					String tts = String.valueOf(obj.get("tts")).replace(",", ""); //TTS	전신환(송금)보내실때
					String deal_bas_r = String.valueOf(obj.get("deal_bas_r")).replace(",", ""); //DEAL_BAS_R	매매 기준율
					String bkpr = String.valueOf(obj.get("bkpr")).replace(",", ""); //장부가격	
				   	
				   	dto.setCur_unit(cur_unit);
				   	dto.setCur_nm(cur_nm);
				   	dto.setTtb(Double.parseDouble(ttb));
				   	dto.setTts(Double.parseDouble(tts));
				   	dto.setDeal_bas_r(Double.parseDouble(deal_bas_r));
				   	dto.setBkpr(Integer.parseInt(bkpr));
				   	dto.setCUR_DATE(java.sql.Date.valueOf(String.valueOf(req.getParameter("cur_date"))));
				   	
				   	list.add(dto);
				   	
				   	dao.CurrencyInsert(dto);
				}
				
			}	else {
				for(int i = 0 ; i <arr.size() ; i++){
					
					CurrencyDTO dto = new CurrencyDTO();
					
					JSONObject obj = (JSONObject)arr.get(i);
					String cur_unit = String.valueOf(obj.get("cur_unit")); //통화코드
					String cur_nm = String.valueOf(obj.get("cur_nm")); //국가이름
					String ttb = String.valueOf(obj.get("ttb")).replace(",", ""); // TTB 전신환(송금)받으실때	
					String tts = String.valueOf(obj.get("tts")).replace(",", ""); //TTS	전신환(송금)보내실때
					String deal_bas_r = String.valueOf(obj.get("deal_bas_r")).replace(",", ""); //DEAL_BAS_R	매매 기준율
					String bkpr = String.valueOf(obj.get("bkpr")).replace(",", ""); //장부가격	
				   	
				   	dto.setCur_unit(cur_unit);
				   	dto.setCur_nm(cur_nm);
				   	dto.setTtb(Double.parseDouble(ttb));
				   	dto.setTts(Double.parseDouble(tts));
				   	dto.setDeal_bas_r(Double.parseDouble(deal_bas_r));
				   	dto.setBkpr(Integer.parseInt(bkpr));
				   	dto.setCUR_DATE(java.sql.Date.valueOf(String.valueOf(req.getParameter("cur_date"))));
				   	
				   	list.add(dto);
				}
			}	
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			
		}
		String weekend = HolidayDataService.getWeekendInfo(req, model, CUR_DATE);
		model.addAttribute("weekend", weekend);
		model.addAttribute("list", list);		
		model.addAttribute("hList", hList);
		model.addAttribute("CUR_DATE", CUR_DATE);
	}

	@Override
	public void CurrencyExchangeAdmin(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeAdmin");
		String usercp="";
		usercp = req.getParameter("usercp");
		int selectCnt = dao.CurrencyExcSearchCnt(usercp);
		List<CurExchangeDTO> list = dao.CurrencyExchangeSearch(usercp);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("list", list);
	}
	
	@Override
	public void CurrencyExchangeAdmin2(HttpServletRequest req, Model model) {
		logger.info("서비스 = CurrencyService : CurrencyExchangeAdmin2");
		int num = Integer.parseInt(req.getParameter("num"));
		int updateCnt = dao.CurrencyExchangeAdmin(num);
		model.addAttribute("updateCnt", updateCnt);
	}

	


}
