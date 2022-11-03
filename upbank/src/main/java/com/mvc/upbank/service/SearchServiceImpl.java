package com.mvc.upbank.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dto.ChartDTO;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

@Service
public class SearchServiceImpl implements SearchService{
	
	private static final Logger logger = LoggerFactory.getLogger(SearchService.class);
	
	
	@Autowired
	SearchDAO dao;

	//전체계좌조회
	@Override
	public void SearchEveryAcc(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : SearchEveryAcc");
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		
		List<SearchDTO> list = dao.SearchEveryAcc(id);
		SearchDTO dto;
		
		for(int i = 0; i < list.size(); i++) {
			dto = new SearchDTO();
			
			if(list.get(i).getPRODUCT_NAME() != null) {
				dto.setPRODUCT_NAME(list.get(i).getPRODUCT_NAME());
			} else if (list.get(i).getI_NAME() != null) {
				dto.setPRODUCT_NAME(list.get(i).getI_NAME());
			} else if(list.get(i).getY_NAME() != null) {
				dto.setPRODUCT_NAME(list.get(i).getY_NAME());
			} else if(list.get(i).getLOAN_NAME() != null) {
				dto.setPRODUCT_NAME(list.get(i).getLOAN_NAME());
			}
			dto.setACCOUNT(list.get(i).getACCOUNT());
			dto.setNEW_DATE(list.get(i).getNEW_DATE());
			dto.setBALANCE(list.get(i).getBALANCE());
		}
		model.addAttribute("list", list);
	}

	//기본 입출금계좌 개설
	@Override
	public void AccDefaultInsert(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : AccDefaultInsert");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		String ACCOUNT_PW_RE = req.getParameter("ACCOUNT_PW_RE");
		String PRODUCT_NAME = "upBank 자유로운 입출금통장";
		String ACCOUNT_TYPE = "입출금";
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("id", id);
		map.put("PRODUCT_NAME", PRODUCT_NAME);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		int insertCnt = 0;
		SearchDTO dto = null;
		int already = dao.AccDefaultInsertChk(map);
		List<SearchDTO> list;
		
		
		//비밀번호확인 통과, 기존가입계좌 없음
		if (ACCOUNT_PW.equals(ACCOUNT_PW_RE) && already == 0) {
			dto = new SearchDTO();
			dto.setACCOUNT_NAME(dao.SearchAccName(id));
			dto.setID(id);
			dto.setACCOUNT_PW(ACCOUNT_PW);
			dao.AccDefaultInsert(dto);
			insertCnt = dao.AccDefaultInsertChk(map); // 1
			
			list = dao.SearchProductName(map);
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
		model.addAttribute("insertCnt", insertCnt);
	}

	//해지 및 휴면 계좌 조회
	@SuppressWarnings("null")
	@Override
	public void SleepDisableAcc(HttpServletRequest req, Model model) {
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		List<SearchDTO> alllist = dao.SleepDisableAcc(id);
		SearchDTO dto;
		int dtoCnt = 0;
		
		try {
		List<SearchDTO> list = new ArrayList<SearchDTO>();
		
		for(int i = 0; i < alllist.size(); i++) {
			dto = new SearchDTO();
				dto.setPRODUCT_NAME(alllist.get(i).getPRODUCT_NAME());
				dto.setACCOUNT_STATE(alllist.get(i).getACCOUNT_STATE());
				dto.setACCOUNT(alllist.get(i).getACCOUNT());
				dto.setNEW_DATE(alllist.get(i).getNEW_DATE());
				dto.setLAST_DATE(alllist.get(i).getLAST_DATE());
				dto.setBALANCE(alllist.get(i).getBALANCE());
				list.add(dto);
				dtoCnt +=1;
			}
			model.addAttribute("dtoCnt", dtoCnt);
			model.addAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void AccAnonymInsert(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : AccAnonymInsert");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		String ACCOUNT_PW_RE = req.getParameter("ACCOUNT_PW_RE");
		String PRODUCT_NAME = "upBank 기본 입출금통장";
		String ACCOUNT_TYPE = "입출금";
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("name", name);
		map.put("phone", phone);
		map.put("PRODUCT_NAME", PRODUCT_NAME);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		int insertCnt = 0;
		SearchDTO dto = null;
		int already = dao.AccAnonymInsertChk(map);
		
		//비밀번호확인 통과, 기존가입계좌 없음
		if (ACCOUNT_PW.equals(ACCOUNT_PW_RE) && already == 0) {
			dto = new SearchDTO();
			dto.setACCOUNT_NAME(name);
			dto.setPhone(phone);
			dto.setACCOUNT_PW(ACCOUNT_PW);
			dto.setPRODUCT_NAME(PRODUCT_NAME);
			insertCnt = dao.AccAnonymInsert(dto);; // 1
			
			dto = dao.SearchAccAllColumn2(map);
			model.addAttribute("dto", dto);
			
		} else if(ACCOUNT_PW.equals(ACCOUNT_PW_RE) && already != 0) {
		//비밀번호확인 통과, 기존가입계좌 있음	
			insertCnt = -1;
		} 
		//비밀번호 틀렸을시 0을 반환
		model.addAttribute("insertCnt", insertCnt);
		
	}

	@Override
	public void SearchRangeSelectAction(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : SearchRangeSelectAction");
		List<TransferDTO> list = new ArrayList<TransferDTO>();
		
		String start_date = req.getParameter("start_date");
		String end_date = req.getParameter("end_date");
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		List<SearchDTO> sList = dao.SearchEveryAcc(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		List<TransferDTO> tList = dao.SearchRangeSelectAction(map);
		
		for(int i = 0; i <sList.size(); i++) {
			String ACCOUNT = sList.get(i).getACCOUNT();
			for (int j = 0; j <tList.size() ;  j++) {
				if (ACCOUNT.equals(tList.get(j).getACCOUNT())){
					list.add(tList.get(j));
				}
			}
		}
		model.addAttribute("tList", tList);
	}

	@Override
	public void SearchDetailTransfer(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : SearchDetailTransfer");
		String ACCOUNT = req.getParameter("ACCOUNT");
		List<TransferDTO> list = dao.SearchDetailTransfer(ACCOUNT);
		model.addAttribute("list", list);
	}

	@Override
	public void SoonEndLoanSearch(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : SoonEndLoanSearch");
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		List<LoanAccountDTO> list = dao.SoonEndLoanSearch(id);
		
		model.addAttribute("list", list);
		
	}

	@Override
	public void dailyProfit(HttpServletRequest req, Model model) {
		logger.info("서비스 = SearchService : dailyProfit");
		List<ChartDTO> list = new ArrayList<ChartDTO>();
		
		for (int i = 0; i < LocalDate.now().minusMonths(1).lengthOfMonth(); i++) {
			ChartDTO dto = new ChartDTO();
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDateMinus = LocalDate.now().minusMonths(1).plusDays(i);
			String date = localDateMinus.format(formatter);			
			int sum_tf_profit = dao.dailyProfit(date);
			
			dto.setDate(date);
			dto.setSum_tf_profit(sum_tf_profit);
			list.add(dto);
		}
		
		String addRows="";
	      
	    for(int i = 0;  i < list.size() ; i++){
	    	addRows += addRows.length()==0 ? "[new Date('"+list.get(i).getDate() +"'),"+ list.get(i).getSum_tf_profit() +"]" : ",[new Date('" + list.get(i).getDate() +"'),"+ list.get(i).getSum_tf_profit() +"]";
	     }
		
		model.addAttribute("addRows", addRows);
	}

}
