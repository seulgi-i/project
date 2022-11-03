package com.mvc.upbank.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.FundDAO;
import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dao.TransferDAO;
import com.mvc.upbank.dto.ChartDTO;
import com.mvc.upbank.dto.FundDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

@Service
public class FundServiceImpl implements FundService {
	
	private static final Logger logger = LoggerFactory.getLogger(FundService.class);
	
	@Autowired
	FundDAO dao;
	
	@Autowired
	SearchDAO daoS;
	
	@Autowired
	TransferDAO daoT;
	
	@Autowired
	SearchService search;
	
	//etn목록
	@Override
	public void etn(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> etn목록");
		
		String line = "";
		try{
			
			String address ="https://finance.naver.com/api/sise/etnItemList.nhn"; //네이버 펀드 파이낸스 api
			
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("Content-Type", "application/json;UTF-8");
			
			InputStreamReader ir = new InputStreamReader(urlConn.getInputStream(), "EUC_KR");
			BufferedReader br = new BufferedReader(ir);
			
			line = br.readLine();
			
			JSONParser parser = new JSONParser();
			//데이터를 파싱하여 배열로 추출
			Object obj = parser.parse(line);
			
			JSONObject jsonMain  = (JSONObject)obj;
			JSONObject jsonSub = (JSONObject)jsonMain.get("result");
			JSONArray jsonArr2 = (JSONArray)jsonSub.get("etnItemList");
			if(jsonArr2.size() >0){
				List<FundDTO> list = new ArrayList<>();
			
			for(int i = 0 ; i <100 ; i++){
				FundDTO dto = new FundDTO();
				JSONObject jobj = (JSONObject)jsonArr2.get(i);
				
				//아이템 코드
				String itemcode = (String) jobj.get("itemcode");
				dto.setItemcode(itemcode);
				
				//거래대금
				String amount_ = String.valueOf(jobj.get("accAmount"));
				int amonut = Integer.parseInt(amount_);
				dto.setAmonut(amonut);
				
				String itemname = String.valueOf(jobj.get("itemname"));
				String nowVal_ = String.valueOf(jobj.get("nowVal"));
				int nowVal = Integer.parseInt(nowVal_);
				String changeVal_ = String.valueOf(jobj.get("changeVal"));
				float changeVal = Float.parseFloat(changeVal_);
				String changeRate_ = String.valueOf(jobj.get("changeRate"));
				float changeRate = Float.parseFloat(changeRate_);
			   	String quant_ = String.valueOf(jobj.get("accQuant"));
			   	int quant = Integer.parseInt(quant_);
			   	String marketSum_ = String.valueOf(jobj.get("marketSum"));
			   	int marketSum = Integer.parseInt(marketSum_);
		
				dto.setChangeRate(changeRate);
				dto.setChangeVal(changeVal);
				dto.setItemname(itemname);
				dto.setMarketSum(marketSum);
				dto.setNowVal(nowVal);
				dto.setQuant(quant);
				list.add(dto);
				}
			
			model.addAttribute("list", list);
			}	
			br.close();
			ir.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	//차트 정보 조회
	@Override
	public void fundChartAction(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 차트 정보 조회");
			Document xml = null;
		    try {
		    	LocalDate now = LocalDate.now();         // 포맷 정의       
		    	String endTime =now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		    	String key = req.getParameter("key");
		    	String code = req.getParameter("itemcode"+key);
		    	
		    	//http://fchart.stock.naver.com/sise.nhn?symbol=069500&timeframe=day&count=1&requestType=0
		    	String address ="http://fchart.stock.naver.com/sise.nhn?symbol="+code+"&timeframe=day&count=50&requestType=0";
		      URL url = new URL(address);
		      URLConnection urlConnect = url.openConnection();
		      urlConnect.connect();

		      InputSource is = new InputSource(urlConnect.getInputStream());

		      xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);

		      // root element 취득
		      Element element = xml.getDocumentElement();

		      // child node 취득
		      NodeList list = element.getChildNodes();

		     /* String chart="";
		      String chartVolume="";*/
		      StringBuilder chart = new StringBuilder();
		      StringBuilder chartVolume = new StringBuilder();
		      ChartDTO dto = new ChartDTO();
		      // child node 가 1개 이상인 경우
		      if(list.getLength() > 0) {
		        for(int i=0; i<list.getLength(); i++) {

		          NodeList childList = list.item(i).getChildNodes();
		          if(childList.getLength() > 0) {
		            for (int j = 0; j < childList.getLength(); j++) {
		              // 데이터가 있는 애들만 출려되게 한다.
		              if(childList.item(j).getNodeName().equals("#text")==false) {
		              String str = childList.item(j).getAttributes().getNamedItem("data").getNodeValue();
		              String result = str.substring(0, str.length()-1);
		              String[] arr = result.split("\\|");
		            //날짜, 저가, 시작, 종료, 고가
		              String date1 = arr[0].concat("',");
		              String date2 = date1.substring(4);
		              String date = date2;
				      String open = arr[1]+",";
				      String high=arr[2];
				      String low=arr[3]+",";
				      String close=arr[4]+",";
				      String volume=arr[5];
				      
				      chart.append("['");
				      chart.append(date);
				      chart.append(low);
				      chart.append(open);
				      chart.append(close);
				      chart.append(high);
				      chart.append("],");
				      
				      chartVolume.append("['");
				      chartVolume.append(date);
				      chartVolume.append(volume);
				      chartVolume.append("],");
				      if( j == 97) {
				    	  int yesterday = Integer.parseInt(arr[4]);
				    	  dto.setYesterday(yesterday);
				      }
				      
				      if( j == 99) {
				      
		              dto.setDate(arr[0]);
		              dto.setClose(Integer.parseInt(arr[4]));
		              dto.setHigh(Integer.parseInt(arr[2]));
		              dto.setLow(Integer.parseInt(arr[3]));
		              dto.setOpen(Integer.parseInt(arr[1]));
		              dto.setVolume(Integer.parseInt(arr[5]));
		              
		              }
		              }
		              
		            }
		          }
		        }
		        
		        chart.setLength(chart.length() - 1);
		        chartVolume.setLength(chartVolume.length() - 1);
		        model.addAttribute("dtoC", dto);
		        model.addAttribute("chart", chart);
		        model.addAttribute("chartVolume", chartVolume);
		      }
		    } catch (FileNotFoundException e) {
		      e.printStackTrace();
		    } catch (SAXException e) {
		      e.printStackTrace();
		    } catch (IOException e) {
		      e.printStackTrace();
		    } catch (ParserConfigurationException e) {
		      e.printStackTrace();
		    }
	}

	//펀드 상세조회
	@Override
	public void fundDetailAction(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 펀드 상세조회");
		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		FundDTO dto = new FundDTO();
		String key = req.getParameter("key");
		
		String itemcode = req.getParameter("itemcode"+key);	//종목코드
		String itemname = req.getParameter("itemname"+key);	//종목명
		int nowVal = Integer.parseInt(req.getParameter("nowVal"+key));		//현재가
		float changeVal = Float.parseFloat(req.getParameter("changeVal"+key));	//전일비
		float changeRate = Float.parseFloat(req.getParameter("changeRate"+key));	//등락율
		float nav = Float.parseFloat(req.getParameter("nav"+key));			//NAV
		float threeMonthEarnRate = Float.parseFloat(req.getParameter("threeMonthEarnRate"+key));	//3개월 수익율
		int quant = Integer.parseInt(req.getParameter("quant"+key));	//거래량
		int amonut = Integer.parseInt(req.getParameter("amonut"+key));	//거래대금
		int marketSum = Integer.parseInt(req.getParameter("marketSum"+key));	//시가총액
	
		
		dto.setAmonut(amonut);
		dto.setChangeRate(changeRate);
		dto.setChangeVal(changeVal);
		dto.setItemcode(itemcode);
		dto.setItemname(itemname);
		dto.setMarketSum(marketSum);
		dto.setNav(nav);
		dto.setNowVal(nowVal);
		dto.setQuant(quant);
		dto.setThreeMonthEarnRate(threeMonthEarnRate);
		
		model.addAttribute("dto",dto);
		
	}
	//펀드 계좌 개설
	@Override
	public void fundAccountInsertAction(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 펀드 계좌 개설");
		
		logger.info("서비스 = SearchService : AccDefaultInsert");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		String ACCOUNT_PW_RE = req.getParameter("ACCOUNT_PW_RE");
		String PRODUCT_NAME = "upBank 종합 펀드 통장";
		String ACCOUNT_TYPE = "펀드";
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("id", id);
		map.put("PRODUCT_NAME", PRODUCT_NAME);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		int insertCnt = 0;
		SearchDTO dto = null;
		int already = daoS.AccDefaultInsertChk(map);
		List<SearchDTO> list;
		
		
		//비밀번호확인 통과, 기존가입계좌 없음
		if (ACCOUNT_PW.equals(ACCOUNT_PW_RE) && already == 0) {
			dto = new SearchDTO();
			dto.setACCOUNT_NAME(daoS.SearchAccName(id));
			dto.setID(id);
			dto.setACCOUNT_PW(ACCOUNT_PW);
			dao.fundAccountInsert(dto);
			insertCnt = daoS.AccDefaultInsertChk(map); // 1
			
			list = daoS.SearchProductName(map);
			for (int i = 0; i<list.size(); i++) {
				dto = list.get(i);
				if( dto.getPRODUCT_NAME().equals("upBank 자유로운 입출금통장")) {
					model.addAttribute("dto", dto);
				}
			}
		} else if(ACCOUNT_PW.equals(ACCOUNT_PW_RE) && already != 0) {
		//비밀번호확인 통과, 기존가입계좌 있음	
			insertCnt = -1;
		} 
		model.addAttribute("dto", dto);
		model.addAttribute("insertCnt", insertCnt);
	}
	
//	//펀드 계좌 개설
//	@Override
//	public void fundAccountInsertAction(HttpServletRequest req, Model model) {
//		
//		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
//		String ACCOUNT_PW_RE = req.getParameter("ACCOUNT_PW_RE");
//		String id = String.valueOf(req.getSession().getAttribute("customerID"));
//		int insertCnt = 0;
//		SearchDTO dto = null;
//		
//		//비밀번호확인 통과
//		if (ACCOUNT_PW.equals(ACCOUNT_PW_RE)) {
//			dto = new SearchDTO();
//			//고객 이름 
//			String name = daoS.SearchAccName(id);
//			dto.setACCOUNT_NAME(name);
//			dto.setID(id);
//			dto.setACCOUNT_PW(ACCOUNT_PW);
//
//			insertCnt = dao.fundAccountInsert(dto); // 1
//			dto = dao.SearcFundName(id);
//			
//		}
//		model.addAttribute("dto", dto);
//		model.addAttribute("insertCnt", insertCnt);
//	}

	//펀드 매매페이지
		@Override
		public void fundTrading(HttpServletRequest req, Model model) {
			logger.info("펀드Service ==> 펀드 매매페이지");
			String itemcode = req.getParameter("itemcode");	//종목코드
			String itemname = req.getParameter("itemname");	//종목코드
			FundDTO dto = new FundDTO();
			
			//현재가
			Map<String, Object> map =  getNowVal(itemcode, model);
			int nowVal =  (int) map.get("nowVal");
			
			//전일비
			float changeVal =  (float) map.get("changeVal");
			
			//등락율
			float changeRate =  (float) map.get("changeRate");
			
			//거래량
			int quant = (int)(map.get("quant"));
			
			//거래대금
			int amonut =  (int) map.get("amonut");
			
			//날짜
			String date =  (String) map.get("date");
			
			//저가
			int low =  (int) map.get("low");
		
			//시가
			int open =  (int) map.get("open");
			
			//종가
			int close =  (int) map.get("close");
			
			//고가
			int high =  (int) map.get("high");
			
			//거래량
			int volume =  (int) map.get("volume");
			
			// 전일가
			int yesterday =  (int) map.get("yesterday");
			
			dto.setItemcode(itemcode);
			dto.setItemname(itemname);
			dto.setNowVal(nowVal);
			dto.setChangeVal(changeVal);
			dto.setChangeRate(changeRate);
			dto.setQuant(quant);
			dto.setAmonut(amonut);
			dto.setDate(date);
			dto.setLow(low);
			dto.setOpen(open);
			dto.setClose(close);
			dto.setHigh(high);
			dto.setVolume(volume);
			dto.setYesterday(yesterday);
			
			//펀드 계좌정보 조회
			String id = String.valueOf(req.getSession().getAttribute("customerID"));
			String ACCOUNT_TYPE = "펀드";
			Map<String, Object> map1 = new HashMap<String, Object>(); 
			map1.put("id", id);
			map1.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
			List<SearchDTO> list;
			list = daoS.SearchProductName(map1);
			
			model.addAttribute("dto", dto);
			model.addAttribute("member", list);
		}

	//펀드 구매 처리
	@Override
	public void fundBuyAction(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 펀드 구매 처리");
		
		String id = (String) req.getSession().getAttribute("customerID");
		String f_account = req.getParameter("f_account");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		
		String itemcode = req.getParameter("itemcode");
		String itemname = req.getParameter("itemname");
		int f_val = Integer.parseInt(req.getParameter("f_val"));
		int f_cnt = Integer.parseInt(req.getParameter("f_cnt"));
		int f_totalPrice = Integer.parseInt(req.getParameter("f_totalPrice"));
		int f_fee = Integer.parseInt(req.getParameter("f_fee"));
		float f_finalTotalPrice_ = Float.parseFloat(req.getParameter("f_finalTotalPrice"));
		int f_finalTotalPrice = (int) (f_finalTotalPrice_);
		
		String f_type = "매수";
		
		FundDTO dto = new FundDTO();
		dto.setItemcode(itemcode);
		dto.setItemname(itemname);
		dto.setId(id);
		dto.setF_account(f_account);
		dto.setF_val(f_val);
		dto.setF_cnt(f_cnt);
		dto.setF_totalPrice(f_totalPrice);
		dto.setF_fee(f_fee);
		dto.setF_finalTotalPrice(f_finalTotalPrice);
		dto.setF_type(f_type);
		
		String msg ="";
		int insertCnt = 0;
		SearchDTO dtoS = dao.SearcFundName(id);
		
		if(dtoS.getACCOUNT().equals(f_account)) {
			if(dtoS.getACCOUNT_PW().equals(ACCOUNT_PW)) {
				if(dtoS.getBALANCE() >= f_finalTotalPrice) {
					
				//펀드 테이블 입력	
				insertCnt = dao.fundBuy(dto);	
				
				//계좌 잔고 수정
				Map<String, Object> map = new HashMap<>();
				map.put("id", id);
				map.put("ACCOUNT", f_account);
				int BALANCE = dtoS.getBALANCE() - f_finalTotalPrice;
				map.put("BALANCE", BALANCE);
				dao.fundBalanceUpdate(map);
				
				//수수료 테이블 입력
				TransferDTO dtoT = new TransferDTO();
				dtoT.setACCOUNT(f_account);
				dtoT.setTf_charges(f_fee);
				int insertCnt2 = daoT.transferChargeInsert(dtoT);
				
				msg = "구매완료 되었습니다";
				
				}else {
					msg="계좌 잔고가 부족합니다.";
				}
			}else {
				msg="계좌 비밀번호가 틀립니다.";
			}
		}else {
		}
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("msg", msg);
	}
	
	
	//펀드 판매 처리
	@Override
	public void fundSellAction(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 펀드 판매 처리");
		
		String id = (String) req.getSession().getAttribute("customerID");
		String f_account = req.getParameter("f_account");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		
		String itemcode = req.getParameter("itemcode");
		String itemname = req.getParameter("itemname");
		int f_val = Integer.parseInt(req.getParameter("f_val"));
		int f_cnt = Integer.parseInt(req.getParameter("f_cnt"));
		int f_totalPrice = Integer.parseInt(req.getParameter("f_totalPrice"));
		int f_fee = Integer.parseInt(req.getParameter("f_fee"));
		float f_finalTotalPrice_ = Float.parseFloat(req.getParameter("f_finalTotalPrice"));
		int f_finalTotalPrice = (int) (f_finalTotalPrice_);
		
		String f_type = "매도";
		
		FundDTO dto = new FundDTO();
		dto.setItemcode(itemcode);
		dto.setItemname(itemname);
		dto.setId(id);
		dto.setF_account(f_account);
		dto.setF_val(f_val);
		dto.setF_cnt(-f_cnt);
		dto.setF_totalPrice(-f_totalPrice);
		dto.setF_fee(f_fee);
		dto.setF_finalTotalPrice(-f_finalTotalPrice);
		dto.setF_type(f_type);
		
		String msg ="";
		int insertCnt = 0;
		SearchDTO dtoS = dao.SearcFundName(id);
		
		Map<String, Object> cnt = new HashMap<>();
		cnt.put("id", id);
		cnt.put("itemcode", itemcode);
		int fundCnt = dao.fundCnt(cnt);
		System.out.println("fundCnt :"+fundCnt);
		System.out.println("f_cnt :"+f_cnt);
		
		if(dtoS.getACCOUNT().equals(f_account)) {
			if(dtoS.getACCOUNT_PW().equals(ACCOUNT_PW)) {
				if(fundCnt >= f_cnt) {
					//펀드 테이블 입력	
					insertCnt = dao.fundBuy(dto);	
					
					//계좌 잔고 수정
					Map<String, Object> map = new HashMap<>();
					map.put("id", id);
					map.put("ACCOUNT", f_account);
					int BALANCE = dtoS.getBALANCE() + f_finalTotalPrice;
					map.put("BALANCE", BALANCE);
					dao.fundBalanceUpdate(map);
					
					//수수료 테이블 입력
					TransferDTO dtoT = new TransferDTO();
					dtoT.setACCOUNT(f_account);
					dtoT.setTf_charges(f_fee);
					int insertCnt2 = daoT.transferChargeInsert(dtoT);
					
					msg = "판매완료 되었습니다";
				}else {
					msg="보유 좌수가 부족합니다.";
				}
			}else {
				msg="계좌 비밀번호가 틀립니다.";
			}
		}else {
		}
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("msg", msg);
	}



	//펀드 보유 내역
	@Override
	public void fundMypage(HttpServletRequest req, Model model) {
		logger.info("펀드Service ==> 펀드 보유 내역");
		String id = (String) req.getSession().getAttribute("customerID");
		int selectCnt = 0;
		if(id != null) {
	
			FundDTO dto;
			Map<String, Object> mapId = new HashMap<>();
			mapId.put("id", id);
			
			List<FundDTO> list_ = dao.fundMypage(mapId);
			int f_finalTotalPrice = 0;//총 매입금액
			int f_totalEvaluationPrice = 0;//총평가금액
			int f_totalProfitLoss = 0;//총손익
			float f_totalReturn = 0;//펀드 총수익율
			
			List<FundDTO> list = new ArrayList<FundDTO>();
			FundDTO total = new FundDTO();
			for(int i=0; i<list_.size(); i++) {
				if(list_.get(i).getF_cnt() > 0) {
					
					dto = new FundDTO();
					
					//아이템코드
					String itemcode= list_.get(i).getItemcode();
					dto.setItemcode(itemcode);
					
					//아이템이름
					String itemname= list_.get(i).getItemname();
					dto.setItemname(itemname);
					
					//계좌번호
					String f_account= list_.get(i).getF_account();
					total.setF_account(f_account);
					
					//계좌명
					Map<String, Object> map1 = new HashMap<>();
					map1.put("id", id);
					map1.put("ACCOUNT", f_account);
					SearchDTO search = daoS.SearchAccAllColumn(map1);
					String PRODUCT_NAME = search.getPRODUCT_NAME();
					total.setPRODUCT_NAME(PRODUCT_NAME);
					
					//계좌 잔액
					int BALANCE = search.getBALANCE();
					total.setBALANCE(BALANCE);
					
					//현재가
					Map<String, Object> map =  getNowVal(itemcode, model);
					int nowVal =  Integer.parseInt(String.valueOf(map.get("nowVal")));
					dto.setNowVal(nowVal);
					
					//전일비
					float changeVal = Float.parseFloat(String.valueOf(map.get("changeVal")));
					dto.setChangeVal(changeVal);
					
					//등락율
					float changeRate =  Float.parseFloat(String.valueOf(map.get("changeRate")));
					dto.setChangeRate(changeRate);
					
					//거래량
					int quant = Integer.parseInt(String.valueOf(map.get("quant")));
					dto.setQuant(quant);
					
					//거래대금
					int amonut = Integer.parseInt(String.valueOf(map.get("amonut")));
					dto.setAmonut(amonut);
					
					//날짜
					String date =  String.valueOf(map.get("date"));
					dto.setDate(date);
					
					//저가
					int low =  Integer.parseInt(String.valueOf(map.get("low")));
					dto.setLow(low);
				
					//시가
					int open =  Integer.parseInt(String.valueOf(map.get("open")));
					dto.setOpen(open);
					
					//종가
					int close =  Integer.parseInt(String.valueOf(map.get("close")));
					dto.setClose(close);
					
					//고가
					int high =  Integer.parseInt(String.valueOf(map.get("high")));
					dto.setHigh(high);
					
					//거래량
					int volume =  Integer.parseInt(String.valueOf(map.get("volume")));
					dto.setVolume(volume);
					
					// 전일가
					int yesterday =  Integer.parseInt(String.valueOf(map.get("yesterday")));
					dto.setYesterday(yesterday);
					
					//매수가
					int f_val = list_.get(i).getF_val();
					dto.setF_val(f_val);
					
					//평가수익율
					float f_return1 = ((int)nowVal)-f_val;
					float f_return2 = f_return1 / f_val;
					float f_return = f_return2 * 100;
					dto.setF_return(f_return);
					
					//수량
					int f_cnt = list_.get(i).getF_cnt();
					dto.setF_cnt(f_cnt);
					
					//평가금액
					int f_evaluationPrice = ((int) nowVal) * f_cnt;
					dto.setF_evaluationPrice(f_evaluationPrice);
					
					//매수금액
					int f_totalPrice = list_.get(i).getF_totalPrice();
					dto.setF_totalPrice(f_totalPrice);
					
					//평가 손익
					int f_profitLoss = f_evaluationPrice - f_totalPrice;
					dto.setF_profitLoss(f_profitLoss);
					
					//총 매입금액
					f_finalTotalPrice += f_totalPrice;
					
					//총 평가금액 
					f_totalEvaluationPrice += f_evaluationPrice;
					
					//총 손익
					f_totalProfitLoss += f_profitLoss;
					list.add(dto);
				}

				
			}
			total.setF_finalTotalPrice(f_finalTotalPrice);
			total.setF_totalEvaluationPrice(f_totalEvaluationPrice);
			total.setF_totalProfitLoss(f_totalProfitLoss);
			
			//총 손익율
			float f_totalReturn1 = f_totalEvaluationPrice - f_finalTotalPrice;
			float f_totalReturn2 = f_totalReturn1 / f_finalTotalPrice;
			f_totalReturn = f_totalReturn2 * 100;
			total.setF_totalReturn(f_totalReturn);
			
			selectCnt = 1;
			model.addAttribute("total", total);
			model.addAttribute("list", list);
			model.addAttribute("selectCnt", selectCnt);
		}else {
			model.addAttribute("selectCnt", selectCnt);
		}
	}

	


	//펀드 거래내역
	@Override
	public void fundSearch(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("customerID");
		int selectCnt = 0;
		if(id != null) {
			Map<String, Object> mapId = new HashMap<>();
			mapId.put("id", id);
			List<FundDTO> itemList = dao.fundMypage(mapId);
			int f_finalTotalPrice = 0;//총 매입금액
			int f_totalEvaluationPrice = 0;//총평가금액
			int f_totalProfitLoss = 0;//총손익
			float f_totalReturn = 0;//펀드 총수익율
			
			FundDTO total = new FundDTO();
			
			for(int i=0; i<itemList.size(); i++) {
				if(itemList.get(i).getF_cnt() > 0) {
					//아이템코드
					String itemcode= itemList.get(i).getItemcode();
					
					//아이템명
					String itemname= itemList.get(i).getItemname();
					
					//계좌번호
					String f_account= itemList.get(i).getF_account();
					total.setF_account(f_account);
					if(!id.equals("admin")) {
				
					//계좌명
					Map<String, Object> map1 = new HashMap<>();
					map1.put("id", id);
					map1.put("ACCOUNT", f_account);
					SearchDTO search = daoS.SearchAccAllColumn(map1);
					String PRODUCT_NAME = search.getPRODUCT_NAME();
					total.setPRODUCT_NAME(PRODUCT_NAME);
					
					//계좌 잔액
					int BALANCE = search.getBALANCE();
					total.setBALANCE(BALANCE);
					}
					//현재가
					Map<String, Object> map =  getNowVal(itemcode, model);
					int nowVal =  Integer.parseInt(String.valueOf(map.get("nowVal")));

					//수량
					int f_cnt = itemList.get(i).getF_cnt();
					
					//평가금액
					int f_evaluationPrice = ((int) nowVal) * f_cnt;
					
					//매수금액
					int f_totalPrice = itemList.get(i).getF_totalPrice();
					
					//평가 손익
					int f_profitLoss = f_evaluationPrice - f_totalPrice;
					
					//총 매입금액
					f_finalTotalPrice += f_totalPrice;
					
					//총 평가금액 
					f_totalEvaluationPrice += f_evaluationPrice;
					
					//총 손익
					f_totalProfitLoss += f_profitLoss;
				}
			}
			total.setF_finalTotalPrice(f_finalTotalPrice);
			total.setF_totalEvaluationPrice(f_totalEvaluationPrice);
			total.setF_totalProfitLoss(f_totalProfitLoss);
			
			//총 손익율
			float f_totalReturn1 = f_totalEvaluationPrice - f_finalTotalPrice;
			float f_totalReturn2 = f_totalReturn1 / f_finalTotalPrice;
			f_totalReturn = f_totalReturn2 * 100;
			total.setF_totalReturn(f_totalReturn);
			
			selectCnt = 1;
			
			String _itemcode = req.getParameter("itemcode");
			String _type = req.getParameter("type");
			String _start = req.getParameter("start");
			String _end = req.getParameter("end");
			String type;
			String start;
			String end;
			String itemcode;
			
		    LocalDateTime time = LocalDateTime.now().plusDays(1);
		    LocalDateTime a = time.minusMonths(3);
	
		    
			if (_itemcode != null || _itemcode == "") {
				itemcode = req.getParameter("itemcode");
			}else {
				itemcode = "All";
			}
			
			if (_type != null || _type == "") {
				type = req.getParameter("type");
			}else {
				type = "All";
			}
			
			if (_start == null || _start == "") {
				start =a.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			}else {
				 
				 start = req.getParameter("start");
			}
			
			if (_end == null || _end == "") {
				end = time.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			}else {
				 DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMdd");
				 String end1 = req.getParameter("end"); //받아온값
				 java.sql.Date end1sql = java.sql.Date.valueOf(end1);
				 LocalDate end1sqlL = end1sql.toLocalDate().plusDays(1);
				 end = end1sqlL.format(df);		 
				 
				 
				 
				 
			}
		
			
			
			Map <String, Object> map2 = new HashMap<>();
			map2.put("id", id);
			map2.put("itemcode", itemcode);
		    map2.put("type", type);
		    map2.put("start", start);
		    map2.put("end", end);
			
			List<FundDTO> list = dao.fundSearch(map2);
			 //logger.info("dao 갔다옴 "+ list.get(0).getItemcode());
			
			model.addAttribute("total", total);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
			model.addAttribute("selectCnt", selectCnt);
			
		}else {
			model.addAttribute("selectCnt", selectCnt);
		}
	}

	//펀드 현재가
	@Override
	public Map<String, Object> getNowVal(String itemcode, Model model) {
		
		String line = "";
		Map<String, Object> map=null;
	try{
		//https://api.finance.naver.com/service/itemSummary.nhn?itemcode=252670
		String address ="https://api.finance.naver.com/service/itemSummary.nhn?itemcode="+itemcode; //네이버 펀드 파이낸스 api
		
		URL url = new URL(address);
		URLConnection urlConn = url.openConnection();
		urlConn.setRequestProperty("Content-Type", "application/json;UTF-8");
		
		InputStreamReader ir = new InputStreamReader(urlConn.getInputStream(), "EUC_KR");
		BufferedReader br = new BufferedReader(ir);
		
		
		line = br.readLine();
		JSONParser parser = new JSONParser();
		//데이터를 파싱하여 배열로 추출
		Object obj = parser.parse(line);
		JSONObject json  = (JSONObject)obj;
		
		//현재가
		long nowVal_ = (Long)(json.get("now"));
		int nowVal = (int)nowVal_;

		//전일대비
		long changeVal_ = (Long)(json.get("diff"));
		float changeVal = (float)changeVal_;
		
		//등락율
		String changeRate_ =  String.valueOf(json.get("rate"));
		float changeRate = Float.parseFloat(changeRate_);
		
		//거래대금
		long quant_ = (Long)(json.get("quant"));
		int quant = (int)quant_;
		
		//거래대금
		long amonut_ = (Long)(json.get("amount"));
		int amonut = (int)amonut_;
		
		
		  Document xml = null;
	      LocalDateTime time = LocalDateTime.now();
	      LocalDateTime a = time.minusDays(1);
	      String startTime = a.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	      String endTime = time.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	      
	      //https://api.finance.naver.com/sise.naver?symbol=423160&requestType=1&startTime=20221020&endTime=20221021&timeframe=day
	      //String address2 ="https://api.finance.naver.com/sise.naver?symbol="+itemcode+"&requestType=1&startTime="+startTime+"&endTime="+endTime+"&timeframe=day";
	      //http://fchart.stock.naver.com/sise.nhn?symbol=069500&timeframe=day&count=2&requestType=0
	      String address2 ="http://fchart.stock.naver.com/sise.nhn?symbol="+itemcode+"&timeframe=day&count=2&requestType=0";
	      URL url2 = new URL(address2);
	      URLConnection urlConnect = url2.openConnection();
	      urlConnect.connect();

	      InputSource is = new InputSource(urlConnect.getInputStream());
	      xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);


	      // root element 취득
	      Element element = xml.getDocumentElement();
	      
	      // child node 취득
	      NodeList list = element.getChildNodes();

	     /* String chart="";
	      String chartVolume="";*/
	      StringBuilder chart = new StringBuilder();
	      StringBuilder chartVolume = new StringBuilder();
	      ChartDTO dto = new ChartDTO();
	      // child node 가 1개 이상인 경우
	      if(list.getLength() > 0) {
	        for(int i=0; i<list.getLength(); i++) {

	          NodeList childList = list.item(i).getChildNodes();
	          if(childList.getLength() > 0) {
	            for (int j = 0; j < childList.getLength(); j++) {
	              // 데이터가 있는 애들만 출력되게 한다.
	              if(childList.item(j).getNodeName().equals("#text")==false) {
	              String str = childList.item(j).getAttributes().getNamedItem("data").getNodeValue();
	              String result = str.substring(0, str.length()-1);
	              String[] arr = result.split("\\|");
	            //날짜, 저가, 시작, 종료, 고가
	              String date = arr[0];
			      String open = arr[1];
			      String high=arr[2];
			      String low=arr[3];
			      String close=arr[4];
			      String volume=arr[5];
			      
			      if( j == 1) {
			    	  int yesterday = Integer.parseInt(arr[4]);
			    	  dto.setYesterday(yesterday);
			      }
			      
			      if( j == 3) {
			      
	              dto.setDate(arr[0]);
	              dto.setClose(Integer.parseInt(arr[4]));
	              dto.setHigh(Integer.parseInt(arr[2]));
	              dto.setLow(Integer.parseInt(arr[3]));
	              dto.setOpen(Integer.parseInt(arr[1]));
	              dto.setVolume(Integer.parseInt(arr[5]));
	              }
	              }
	            }
	          }
	        }
	      }
		map = new HashMap<String, Object>();
    	map.put("nowVal", nowVal);
    	map.put("changeVal", changeVal);
    	map.put("changeRate", changeRate);
    	map.put("quant", quant);
    	map.put("amonut", amonut);
    	
    	map.put("yesterday", dto.getYesterday());
    	map.put("date", dto.getDate());
    	map.put("close", dto.getClose());
    	map.put("low", dto.getLow());
    	map.put("open", dto.getOpen());
    	map.put("high", dto.getHigh());
    	map.put("volume", dto.getVolume());
		
		br.close();
		ir.close();
		
	} catch (Exception e){
		e.printStackTrace();
	}
	return map;
		
	}

	
	


}
