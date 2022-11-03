package com.mvc.upbank.service;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.AutoTransferDAOImpl;
import com.mvc.upbank.dao.LoanDAOImpl;
import com.mvc.upbank.dao.SearchDAOImpl;
import com.mvc.upbank.dao.TransferDAOImpl;
import com.mvc.upbank.dto.AutoTransferDTO;
import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.LoanJoinDTO;
import com.mvc.upbank.dto.LoanProductDTO;
import com.mvc.upbank.dto.LoanProductRateDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;
import com.mvc.upbank.page.Paging;

@Service
public class LoanServiceImpl implements LoanService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoanService.class);
	
	@Autowired
	LoanDAOImpl dao;
	
	@Autowired
	SearchDAOImpl accDao;
	
	@Autowired
	TransferDAOImpl transDao;
	
	@Autowired
	AutoTransferDAOImpl autoDao;
	
	// 대출 이자 계산기
	@Override
	public void loan_cal(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 이자 계산기");
		
		// 누른 버튼에 맞는 계산 메서드 호출
			// 원리금 균등 상환
		if(req.getParameter("kind").equals("amortization")) {
			amortization(req, model);
			
			// 원금 균등 상환
		} else if(req.getParameter("kind").equals("even_repayment")) {
			even_repayment(req, model);
			
			// 원금 만기일시 상환
		} else if(req.getParameter("kind").equals("repayment")) {
			repayment(req, model);
		}
	}

	// 대출 상품 리스트
	@Override
	public void loan_product_list(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 상품 리스트");

		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 상품 갯수 체크
		int productCnt = dao.productCnt();
		
		paging.setTotalCount(productCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<LoanProductDTO> list = null;
		if(productCnt > 0) list = dao.productList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 대출 상품 상세 페이지
	@Override
	public void product_detail(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 상품 상세 페이지");
		
		int loan_num = Integer.parseInt(req.getParameter("loan_num"));
		
		LoanProductDTO dto = dao.productDetail(loan_num);
		model.addAttribute("dto", dto);
	}
	
	// 고객 ------------------------------------------
	// 대출 상품 가입
	@Override
	public void loan_join(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 상품 가입 처리");
		product_detail(req, model);
		String id = (String)req.getSession().getAttribute("customerID");
		CustomerDTO cDto = dao.getCustomerInfo(id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String PRODUCT_NAME = "upBank 자유로운 입출금통장";
		String ACCOUNT_TYPE = "입출금";
		map.put("id", id);
		map.put("PRODUCT_NAME", PRODUCT_NAME);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		List<SearchDTO> accList = accDao.SearchProductName(map);
		
		model.addAttribute("cDto", cDto);
		model.addAttribute("accList", accList);
	}

	// 대출 상품 가입 처리
	@Override
	public synchronized void loan_join_action(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 상품 가입 처리");
		
		// 인적 정보
		String id = (String) req.getSession().getAttribute("customerID");
		String name = req.getParameter("name");
		
		String social_num = null;
		String social_etc = req.getParameter("social_etc");
		if(social_etc == null || social_etc.length() == 0) {
			social_num = req.getParameter("social_num");
		}
		String postcode = req.getParameter("postcode");
		String address = req.getParameter("address");
		String address_detail = req.getParameter("address_detail");
		String phone = req.getParameter("phone");
		String emergency_phone = req.getParameter("emergency_phone");
		String account = req.getParameter("account");
		
		// 대출 정보
		int loan_num = Integer.parseInt(req.getParameter("loan_num"));
		int l_principal = Integer.parseInt(req.getParameter("l_principal")) * 1000000;
		int l_period = Integer.parseInt(req.getParameter("l_period"));
		String l_repay = req.getParameter("l_repay");
		String str_start_date = req.getParameter("l_start_date");
		Date l_start_date = null;
		if(str_start_date != null) {
			if(str_start_date.length() != 0) {
				l_start_date = Date.valueOf(req.getParameter("l_start_date"));
			}
		}
		int loan_rate = Integer.parseInt(req.getParameter("loan_rate"));
		
		// DTO 셋팅
		LoanJoinDTO dto = new LoanJoinDTO();
		dto.setId(id);
		dto.setName(name);
		if(social_num != null) dto.setSocial_num(social_num);
		if(social_etc != null) dto.setSocial_etc(social_etc);
		dto.setPostcode(postcode);
		dto.setAddress(address);
		dto.setAddress_detail(address_detail);
		dto.setPhone(phone);
		dto.setEmergency_phone(emergency_phone);
		dto.setAccount(account);
		dto.setLoan_num(loan_num);
		dto.setL_principal(l_principal);
		dto.setL_period(l_period);
		dto.setL_repay(l_repay);
		if(l_start_date != null) dto.setL_start_date(l_start_date);
		dto.setLoan_rate(loan_rate);
		
		// 데이터 입력
		int insertCnt = dao.loanJoin(dto);
		if(insertCnt == 1) {
			dao.getJoinNum(id);
		}
		
		model.addAttribute("dto", dto);
	}
	

	// 대출 신청 결과 조회 - 목록
	@Override
	public void loan_join_result(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 신청 결과 조회 - 목록");
		
		String id = (String) req.getSession().getAttribute("customerID");
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 상품 갯수 체크
		int joinCnt = dao.getJoinCnt(id);
		
		paging.setTotalCount(joinCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<LoanJoinDTO> list = dao.joinList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 대출 신청 결과 조회 - 상세
	@Override
	public void loan_join_result_detail(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 신청 결과 조회 - 상세");
		
		int l_join_num = Integer.parseInt(req.getParameter("l_join_num"));
		LoanJoinDTO dto = dao.joinDetail(l_join_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ACCOUNT", dto.getAccount());
		map.put("id", req.getSession().getAttribute("customerID"));
		SearchDTO accDto = accDao.SearchAccAllColumn(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("accDto", accDto);
	}
	
	// 대출 계좌 목록 조회
	@Override
	public void loan_account(HttpServletRequest req, Model model, String l_status) {
		logger.info("대출:서비스 - 대출 계좌 목록 조회");
		
		String id = (String) req.getSession().getAttribute("customerID");
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		
		// 상품 갯수 체크
		int accCnt = dao.onesAccCnt(id);
		
		paging.setTotalCount(accCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		if(l_status != null)	map.put("l_status", l_status);
		
		List<LoanAccountDTO> list = dao.onesAccList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 대출 상환시 계좌 상세 조회
	@Override
	public String loan_accDetail(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 계좌 목록 조회");
		
		String account = req.getParameter("account");
		
		LoanAccountDTO accDto = dao.accDetail(account);
		List<TransferDTO> transList = dao.transList(account);
		
		model.addAttribute("accDto", accDto);
		model.addAttribute("transList", transList);

		Calendar start = Calendar.getInstance();
		start.setTime(accDto.getL_start_date());
		
		Calendar end = Calendar.getInstance();
		end.setTime(accDto.getL_end_date());

		Calendar today = Calendar.getInstance();
		today.setTime(new java.util.Date());
		
		long sub = Math.abs(start.getTimeInMillis() - end.getTimeInMillis());
		long fulldays = TimeUnit.MILLISECONDS.toDays(sub);
		sub = Math.abs(today.getTimeInMillis() - end.getTimeInMillis());
		long nowdays = TimeUnit.MILLISECONDS.toDays(sub);
		double days = (double)nowdays/(double)fulldays;
		
		double feeRate = accDto.getL_termination_fee_rate()/100;
		
		int fee = (int)(accDto.getL_balance_principal() * feeRate * days);
		model.addAttribute("fee", fee);
		
		DecimalFormat df = new DecimalFormat("#,###");
		return "현재까지 상환 횟수 : " + df.format(transList.size())
			+ ", 잔여 기간 : " + Math.round(nowdays/30) + "개월"
			+ "<br><br>"
			+ "원금 잔액 : " + df.format(accDto.getL_balance_principal())
			+ "원, 이자 잔액 :" + df.format(-(accDto.getAccInfo().getBALANCE() + accDto.getL_balance_principal())) + "원"
			+ "<br><br>"
			+ "중도 상환 수수료 : " + df.format(fee)
			+ "원 <input type='hidden' name='account' value='" + account + "'>"
			+ "<input type='hidden' name='fee' value='" + fee + "'>";
	}
	
	// 대출 중도 상환 처리
	@Transactional
	@Override
	public String loan_terminate(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 대출 중도 상환 처리");
		
		// 화면 값 받기
		String fromAcc = req.getParameter("acc");
		String password = req.getParameter("ACCOUNT_PW");
		String loanAcc = req.getParameter("account");
		int fee = Integer.parseInt(req.getParameter("fee"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", req.getSession().getAttribute("customerID"));
		map.put("ACCOUNT", fromAcc);
		
		// 계좌 정보 받기
		SearchDTO fAcc = accDao.SearchAccAllColumn(map);
		if(fAcc.getACCOUNT_PW().equals(password)) {
			LoanAccountDTO lAcc = dao.accDetail(loanAcc);
			
			int amount = lAcc.getL_balance_principal() + fee;
			
			if(fAcc.getBALANCE()-amount < 0) {
				return "not enough balance";
			}
			
			// 입출금 계좌 이체 테이블에 금액 기록
			TransferDTO tDto = new TransferDTO();
			tDto.setACCOUNT(fromAcc);
			tDto.setTf_sender_acc(loanAcc);
			tDto.setTf_bank("UpBank");
			tDto.setTf_amount(amount);
			tDto.setTf_sender_comment(lAcc.getAccInfo().getPRODUCT_NAME() + " 중도 상환");
			tDto.setTf_deposit_comment(lAcc.getAccInfo().getPRODUCT_NAME() + " 중도 상환");
			tDto.setTf_acc_holder(fAcc.getACCOUNT_NAME());
			tDto.setTf_charges(0);
			int resultCnt = transDao.transferInfoInsert(tDto);
			
			// 입출금 계좌에서 잔액 감소
			fAcc.setBALANCE(fAcc.getBALANCE()-amount);
			map.put("ACCOUNT", fromAcc);
			map.put("BALANCE", fAcc.getBALANCE());
			resultCnt = transDao.transferBalanceSet(map);
			
			// 대출 계좌 잔액 증가 및 상환 완료로 상태 변경 - 업데이트
			lAcc.getAccInfo().setBALANCE(0);	// 계좌 잔고 0 설정
			lAcc.setL_balance_principal(0);	// 원금 잔액 0 설정
			lAcc.setL_status("완납");
			// 계좌 잔고 변경
			map.put("ACCOUNT", loanAcc);
			map.put("BALANCE", lAcc.getAccInfo().getBALANCE());
			resultCnt = transDao.transferBalanceSet(map);
			// 대출 상태 변경
			resultCnt = dao.loanTerminate(lAcc);
			
			// 은행 수익 테이블에 기록
			tDto.setACCOUNT(fromAcc);
			tDto.setTf_charges(fee);
			resultCnt = transDao.transferChargeInsert(tDto);
			
			return null;
		}
		return "incorrect password";
	}
	
	
	// 관리자 -----------------------------------------
	// 대출 상품 등록 처리
	@Override
	public void product_addAction(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 관리자:대출 상품 등록 처리");
		
		// 화면에서 넘긴 값 받기
		int rate_num = Integer.parseInt(req.getParameter("rate_num")); 
		
		String loan_name = req.getParameter("loan_name");	// 대출 상품명
		String loan_summary = req.getParameter("loan_summary");	// 대출 상품 요약
		String loan_status = req.getParameter("loan_status");	// 대출상품 판매상태
		String loan_rate_summary = req.getParameter("loan_rate_summary");	// 금리 설명
		
		List<LoanProductRateDTO> rate = new ArrayList<LoanProductRateDTO>();
		
		String rate_status = null;	// 변동금리, 고정금리
		String rate_name = null;	// 금리 구분명
		String rate_change = null;	// 금리 변동 주기
		String rate_basemoney = null;	// 기준 금리 / 기본 금리
		String rate_spread = null;	// 가산 금리
		String rate_prime = null;	// 우대 금리
		for(int i=0; i<rate_num; i++) {
			LoanProductRateDTO rateDTO = new LoanProductRateDTO();
			rate_status = req.getParameter("rate_status_" + i);
			
			rate_name = req.getParameter("rate_name_" + i);
			rate_change = req.getParameter("rate_change_" + i);
			rate_basemoney = req.getParameter("rate_basemoney_" + i);
			rate_spread = req.getParameter("rate_spread_" + i);
			rate_prime = req.getParameter("rate_prime_" + i);
			
			rateDTO.setRate_status(rate_status);
			rateDTO.setRate_name(rate_name);
			
			try {
				if(rate_change != null || rate_change.equals("") != true)
					rateDTO.setRate_change(Integer.parseInt(rate_change));
				rateDTO.setRate_basemoney(Double.parseDouble(rate_basemoney));
				if(rate_spread != null || rate_spread.length() > 0)
					rateDTO.setRate_spread(Double.parseDouble(rate_spread));
				if(rate_prime != null || rate_prime.length() > 0)
					rateDTO.setRate_prime(Double.parseDouble(rate_prime));
			} catch(NumberFormatException e) {
				e.printStackTrace();
			}
			rate.add(rateDTO);
		}
		
		double loan_limit = Double.parseDouble(req.getParameter("loan_limit"));	// 대출 한도
		String loan_period = req.getParameter("loan_period");	// 대출 기간
		String[] loan_repay = req.getParameterValues("loan_repay");	// 상환 방식
		String loan_repay_summary = req.getParameter("loan_repay_summary");	// 상환 방식 설명
		double loan_termination_fee = Double.parseDouble(req.getParameter("loan_termination_fee"));	// 중도 상환 해약금율
		String loan_note = req.getParameter("loan_note");	// 유의사항
		
		// dto 옮겨담기
		LoanProductDTO dto = new LoanProductDTO();
		dto.setLoan_name(loan_name);
		dto.setLoan_summary(loan_summary);
		dto.setLoan_status(loan_status);
		dto.setLoan_rate_summary(loan_rate_summary);
		dto.setLoan_limit(loan_limit);
		dto.setLoan_period(loan_period);
		
		String str_loan_repay = "";
		for(int i=0; i<loan_repay.length; i++) {
			if(str_loan_repay.length() == 0)	str_loan_repay += loan_repay[i];
			else if(str_loan_repay.length() > 0)	str_loan_repay += ", " + loan_repay[i];
		}
		dto.setLoan_repay(str_loan_repay);
		dto.setLoan_repay_summary(loan_repay_summary);
		dto.setLoan_termination_fee(loan_termination_fee);
		dto.setLoan_note(loan_note);
		dto.setRate(rate);
		
		// dao 소환 - INSERT
		int loan_num = dao.productInsert(dto);
		
		model.addAttribute("loan_num", loan_num);
	}
	
	// 대출 신청 목록 조회
	@Override
	public void admin_loan_join(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 관리자:대출 신청 목록 조회");
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 상품 갯수 체크
		int joinCnt = dao.getAllJoinCnt();
		
		paging.setTotalCount(joinCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<LoanJoinDTO> list = dao.AllJoinList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 대출 신청 상세 조회
	@Override
	public void admin_loan_join_detail(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 관리자:대출 신청 상세 조회");
		
		int l_join_num = Integer.parseInt(req.getParameter("l_join_num"));
		LoanJoinDTO dto = dao.joinDetail(l_join_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ACCOUNT", dto.getAccount());
		map.put("id", req.getSession().getAttribute("customerID"));
		SearchDTO accDto = accDao.SearchAccAllColumn(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("accDto", accDto);
	}

	// 대출 승인 처리
	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public void loan_accept(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 관리자:대출 승인 처리");
		
		// 화면값 받기
		int l_join_num = Integer.parseInt(req.getParameter("l_join_num"));
		LoanJoinDTO jDto = dao.joinDetail(l_join_num);
		
		// 신청 승인 처리
		int l_confirm = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("l_join_num", l_join_num);
		map.put("l_confirm", l_confirm);
		
		dao.joinConfirm(map);
		
		// 대출 계좌 개설
		// - 신규 계좌 인서트
		String account_name = jDto.getName();
		
		LoanProductDTO pDto = dao.productDetail(jDto.getLoan_num());
		String product_name = pDto.getLoan_name();
		String id = jDto.getId();
		String phone = jDto.getPhone();
		map.put("account_name", account_name);
		map.put("product_name", product_name);
		map.put("id", id);
		map.put("phone", phone);
		
		// - 대출 계좌 인서트
		LoanAccountDTO lAccDto = new LoanAccountDTO();
		
		// 날짜에 맞춘 계좌 상태 셋팅
		java.util.Date now = new java.util.Date();		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(now);
		String l_start_date = formatter.format(jDto.getL_start_date());
		if((jDto.getL_start_date()).compareTo(now) >= 0)	lAccDto.setL_status("대기");
		else	lAccDto.setL_status("상환중");
		
		lAccDto.setL_start_date(Date.valueOf(l_start_date));
		int l_period = jDto.getL_period();
		lAccDto.setL_period(l_period * 12);
		lAccDto.setL_repay(jDto.getL_repay());
		
		// 선택한 금리 가져오기 - 일단 기본 금리로 넣기
		LoanProductRateDTO rDto = dao.getLoanRate(jDto.getLoan_rate());
		lAccDto.setL_rate(rDto.getRate_basemoney());
		lAccDto.setL_principal(jDto.getL_principal());
		lAccDto.setL_balance_principal(jDto.getL_principal());
		
		// 이자 원금 계산
		String l_repay = jDto.getL_repay();
		Map<String, Object> rateMap = null;
		if(l_repay.equals("원리금균등분할상환")) {
			rateMap = amortization(jDto.getL_principal(), rDto.getRate_basemoney(), jDto.getL_period());
		} else if(l_repay.equals("원금균등분할상환")) {
			rateMap = even_repayment(jDto.getL_principal(), rDto.getRate_basemoney(), jDto.getL_period());
		} else if(l_repay.equals("원금만기일시상환")) {
			rateMap = repayment(jDto.getL_principal(), rDto.getRate_basemoney(), jDto.getL_period());
		}

		int l_interest = (Integer) rateMap.get("total_interest");
		lAccDto.setL_interest(l_interest);
		lAccDto.setL_termination_fee_rate(pDto.getLoan_termination_fee());
		
		// 총 대출 금액
		int balance = jDto.getL_principal() + l_interest;
		map.put("balance", 0-balance);

		int insertCnt = dao.accInsert(map);
		String account = dao.getaccNum();
		lAccDto.setAccount(account);
		
		if(insertCnt == 1) {
			insertCnt = dao.loanAccInsert(lAccDto);
		}
		
		lAccDto = dao.accDetail(account);
		Calendar cal = Calendar.getInstance();
		// 상환 예정 자동 이체 등록
		if(l_repay.equals("원리금균등분할상환")) {
			ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) rateMap.get("list");
			AutoTransferDTO dto = new AutoTransferDTO();
			Map<String, Object> rMap = list.get(0);
			
			dto.setACCOUNT(jDto.getAccount());
			dto.setAuto_senderBank("UpBank");
			dto.setAuto_senderAccount(account);
			dto.setAuto_type(3);	// 대출
			
			cal.setTime(jDto.getL_start_date());
			if(cal.get(Calendar.DATE) < 10) {
				dto.setAuto_outDate(7);		// 7일
			} else if(cal.get(Calendar.DATE) < 15) {
				dto.setAuto_outDate(10);	// 10일
			} else if(cal.get(Calendar.DATE) < 20) {
				dto.setAuto_outDate(15);	// 15일
			} else if(cal.get(Calendar.DATE) < 25) {
				dto.setAuto_outDate(20);	// 20일
			} else {
				dto.setAuto_outDate(25);	// 25일
			}
			dto.setAuto_balance((int)rMap.get("installment"));
			dto.setAuto_registDate(jDto.getL_start_date());
			dto.setAuto_expirationDate(lAccDto.getL_end_date());
			dto.setAuto_inPlace("UpBank");
			autoDao.insertAutoTransfer(dto);
			
		} else if(l_repay.equals("원금균등분할상환")) {
			ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) rateMap.get("list");
			AutoTransferDTO dto = new AutoTransferDTO();
			
			dto.setACCOUNT(jDto.getAccount());
			dto.setAuto_senderBank("UpBank");
			dto.setAuto_senderAccount(account);
			dto.setAuto_type(3);	// 대출
			
			cal.setTime(jDto.getL_start_date());
			if(cal.get(Calendar.DATE) < 10) {
				dto.setAuto_outDate(7);		// 7일
			} else if(cal.get(Calendar.DATE) < 15) {
				dto.setAuto_outDate(10);	// 10일
			} else if(cal.get(Calendar.DATE) < 20) {
				dto.setAuto_outDate(15);	// 15일
			} else if(cal.get(Calendar.DATE) < 25) {
				dto.setAuto_outDate(20);	// 20일
			} else {
				dto.setAuto_outDate(25);	// 25일
			}
			dto.setAuto_inPlace("UpBank");

			Date regDate = jDto.getL_start_date();
			for(int i=0; i<list.size(); i++) {
				cal.setTime(regDate);
				dto.setAuto_registDate(regDate);	// 이체 시작일 설정
				
				cal.add(Calendar.MONTH, 1);
				Date expDate = new Date(cal.getTimeInMillis());
				dto.setAuto_expirationDate(expDate);	// 이체 종료일 설정
				
				Map<String, Object> rMap = list.get(i);
				dto.setAuto_balance((int)rMap.get("installment"));	// 이체 금액 설정
				autoDao.insertAutoTransfer(dto);
				
				regDate = expDate;	// 시작일에 종료일 넣고 for문 종료
			}
			
			// 원금 만기시 상환
		} else {
			// 이자 상환
			ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) rateMap.get("list");
			AutoTransferDTO dto = new AutoTransferDTO();
			Map<String, Object> rMap = list.get(0);
			
			dto.setACCOUNT(jDto.getAccount());
			dto.setAuto_senderBank("UpBank");
			dto.setAuto_senderAccount(account);
			dto.setAuto_type(3);	// 대출
			
			cal.setTime(jDto.getL_start_date());
			if(cal.get(Calendar.DATE) < 10) {
				dto.setAuto_outDate(7);		// 7일
			} else if(cal.get(Calendar.DATE) < 15) {
				dto.setAuto_outDate(10);	// 10일
			} else if(cal.get(Calendar.DATE) < 20) {
				dto.setAuto_outDate(15);	// 15일
			} else if(cal.get(Calendar.DATE) < 25) {
				dto.setAuto_outDate(20);	// 20일
			} else {
				dto.setAuto_outDate(25);	// 25일
			}
			dto.setAuto_balance((int)rMap.get("repay_interest"));
			dto.setAuto_registDate(jDto.getL_start_date());
			
			cal.add(Calendar.MONTH, (int)rMap.get("month")-1);
			Date expDate = new Date(cal.getTimeInMillis());
			dto.setAuto_expirationDate(expDate);
			
			dto.setAuto_inPlace("UpBank");
			autoDao.insertAutoTransfer(dto);
			
			// 이자 + 원금 상환
			cal.add(Calendar.MONTH, (int)rMap.get("month"));
			expDate = new Date(cal.getTimeInMillis());
			dto.setAuto_expirationDate(expDate);
			dto.setAuto_balance((int)rMap.get("interest"));
			dto.setAuto_balance((int)rMap.get("principal"));
		}
	}

	// 대출 불가 처리
	@Override
	public void loan_denied(HttpServletRequest req, Model model) {
		logger.info("대출:서비스 - 관리자:대출 불가 처리");
		
		int l_join_num = Integer.parseInt(req.getParameter("l_join_num"));
		int l_confirm = -1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("l_join_num", l_join_num);
		map.put("l_confirm", l_confirm);
		
		dao.joinConfirm(map);
	}
	
	// 대출 이자 계산기 ---------------------------------------------
	// 대출 이자 계산기 - 원리금 균등 분할 상환
	public void amortization(HttpServletRequest req, Model model) {
		logger.info("=== 원리금 균등 상환 ===");
		double principal = Integer.parseInt(req.getParameter("amortization_principal")) * 10000;	// 대출 원금
		double rate = Double.parseDouble(req.getParameter("amortization_interest"));	// 대출 이율
		int month = Integer.parseInt(req.getParameter("amortization_year")) * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		double rn = Math.pow(1+r, month);	// 1+R의 (개월수) 거듭제곱
		double son = principal * r * rn;	// 분자
		double par = rn - 1;				// 분모
		int installment = (int) Math.round(son / par);	// 매회 상환해야하는 금액
		
		double interest = 0;	// 총 이자
		int balance = (int) principal;	// 잔액
		int total_interest = 0;	// 납부해야할 이자 총액
		
		// 값을 담을 리스트 생성
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(int i=1; i<=month; i++) {
			// 리스트에 담길 해쉬맵 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			interest = Math.round(balance * r);
			int repay = (int) Math.round(installment - interest);
			balance -= repay;
			total_interest += interest;
			
			// 맵에 해당값을 넣기
			map.put("count", i); // 회차
			map.put("installment_principal", repay);	// 각 회차당 납부 원금
			map.put("installment_interest", interest);	// 각 회차당 납부 이자
			map.put("installment", installment);	// 각 회차당 납부액
			
			
			// 리스트에 맵 넣기
			list.add(map);
		}

		model.addAttribute("list", list);
		model.addAttribute("total_interest", total_interest);	// 납부해야할 이자 총액
	}

	// 대출 이자 계산기 - 원금 균등 분할 상환
	public void even_repayment(HttpServletRequest req, Model model) {
		logger.info("=== 원금 균등 분할 상환 ===");
		double principal = Double.parseDouble(req.getParameter("even_repayment_principal")) * 10000;	// 대출 원금
		double rate = Double.parseDouble(req.getParameter("even_repayment_interest"));	// 대출 이율
		int month = Integer.parseInt(req.getParameter("even_repayment_year")) * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		int OncePriRepay = (int) Math.round(principal/month);	// 원금 분할 상환 금액
		int balance = (int) principal;	// 잔액
		double interest = 0;	// 총 이자
		int total_interest = 0;	// 납부해야할 이자 총액
		
		// 값을 담을 리스트 생성
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(int i=1; i<=month; i++) {
			// 리스트에 담길 해쉬맵 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			interest = balance * rate * 0.01;	// 현시점 납부해야할 이자 총액
			int repay_interest = (int) Math.round(balance * r);	// 납부해야할 1회분 이자 
			int repay = (int) Math.round(OncePriRepay + repay_interest);	// 납부해야할 1회분 전체 금액
			balance = balance - OncePriRepay;	// 남은 잔액
			total_interest += repay_interest;	// 이자 총액 계산
			
			// 맵에 해당값을 넣기
			map.put("count", i); // 회차
			map.put("installment_principal", OncePriRepay);	// 각 회차당 납부 원금
			map.put("installment_interest", repay_interest);	// 각 회차당 납부 이자
			map.put("installment", repay);	// 각 회차당 납부액
			
			
			// 리스트에 맵 넣기
			list.add(map);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("total_interest", total_interest);	// 납부해야할 이자 총액
	}
	
	// 대출 이자 계산기 - 원금 만기일시 상환
	public void repayment(HttpServletRequest req, Model model) {
		logger.info("=== 만기 일시 상환 ===");
		double principal = Integer.parseInt(req.getParameter("repayment_principal")) * 10000;	// 대출 원금
		double rate = Integer.parseInt(req.getParameter("repayment_interest"));	// 대출 이율
		int month = Integer.parseInt(req.getParameter("repayment_year")) * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		double interest = principal * r;
		int total_interest = (int) Math.round(interest * month);	// 납부해야할 이자 총액
		int repay_interest = (int) Math.round(interest);	// 납부해야할 1회분 이자 
		
		model.addAttribute("month", month);
		model.addAttribute("principal", (int)principal);
		model.addAttribute("repay_interest", repay_interest);
		model.addAttribute("total_interest", total_interest);
	}
	
	// 대출 이자 계산 - 실제 활용 ---------------------------------------------
	// 원리금 균등 분할 상환
	public Map<String, Object> amortization(int principal, double rate, int year) {
		logger.info("=== 원리금 균등 상환 ===");
		
		int month = year * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		double rn = Math.pow(1+r, month);	// 1+R의 (개월수) 거듭제곱
		double son = principal * r * rn;	// 분자
		double par = rn - 1;				// 분모
		int installment = (int) Math.round(son / par);	// 매회 상환해야하는 금액
		
		double interest = 0;	// 총 이자
		int balance = principal;	// 잔액
		int total_interest = 0;	// 납부해야할 이자 총액
		
		// 값을 담을 리스트 생성
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(int i=1; i<=month; i++) {
			// 리스트에 담길 해쉬맵 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			interest = Math.round(balance * r);
			int repay = (int) Math.round(installment - interest);
			balance -= repay;
			total_interest += interest;
			
			// 맵에 해당값을 넣기
			map.put("count", i); // 회차
			map.put("installment_principal", repay);	// 각 회차당 납부 원금
			map.put("installment_interest", interest);	// 각 회차당 납부 이자
			map.put("installment", installment);	// 각 회차당 납부액
			
			// 리스트에 맵 넣기
			list.add(map);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total_interest", total_interest);	// 납부해야할 이자 총액
		
		return map;
	}

	// 원금 균등 분할 상환
	public Map<String, Object> even_repayment(int principal, double rate, int year) {
		logger.info("=== 원금 균등 분할 상환 ===");
		int month = year * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		int OncePriRepay = Math.round(principal/month);	// 원금 분할 상환 금액
		int balance = principal;	// 잔액
		double interest = 0;	// 총 이자
		int total_interest = 0;	// 납부해야할 이자 총액
		
		// 값을 담을 리스트 생성
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(int i=1; i<=month; i++) {
			// 리스트에 담길 해쉬맵 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			interest = balance * rate * 0.01;	// 현시점 납부해야할 이자 총액
			int repay_interest = (int) Math.round(balance * r);	// 납부해야할 1회분 이자 
			int repay = (int) Math.round(OncePriRepay + repay_interest);	// 납부해야할 1회분 전체 금액
			balance = balance - OncePriRepay;	// 남은 잔액
			total_interest += repay_interest;	// 이자 총액 계산
			
			// 맵에 해당값을 넣기
			map.put("count", i); // 회차
			map.put("installment_principal", OncePriRepay);	// 각 회차당 납부 원금
			map.put("installment_interest", repay_interest);	// 각 회차당 납부 이자
			map.put("installment", repay);	// 각 회차당 납부액
			
			
			// 리스트에 맵 넣기
			list.add(map);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total_interest", total_interest);	// 납부해야할 이자 총액
		
		return map;
	}
	
	// 원금 만기일시 상환
	public Map<String, Object> repayment(int principal, double rate, int year) {
		logger.info("=== 만기 일시 상환 ===");
		int month = year * 12;	// 대출 기간
		
		double r = rate * 0.01 / 12;	// 월 이자율 = 이자율 * 0.01 / 개월수
		
		double interest = principal * r;
		int total_interest = (int) Math.round(interest * month);	// 납부해야할 이자 총액
		int repay_interest = (int) Math.round(interest);	// 납부해야할 1회분 이자 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		map.put("principal", principal);
		map.put("repay_interest", repay_interest);
		map.put("total_interest", total_interest);
		
		return map;
	}
}
