package com.mvc.upbank.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.AutoTransferDAO;
import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dto.AutoTransferDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

import lombok.RequiredArgsConstructor;

@Service
public class AutoTransferServiceImpl implements AutoTransferService {

	
	private static final Logger logger = LoggerFactory.getLogger(AutoTransferService.class);
	
	@Autowired
	AutoTransferDAO dao;
	@Autowired
	SearchDAO sdao;
	
	@Override
	public void insertAutoTransfer(HttpServletRequest req, Model model) {
		logger.info("서비스 - insertAutoTransfer");
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) req.getSession().getAttribute("customerID");
		String ACCOUNT = req.getParameter("ACCOUNT");
		String auto_senderBank = req.getParameter("auto_senderBank");
		int auto_balance = Integer.parseInt(req.getParameter("auto_balance"));
		map.put("id", id);
		map.put("ACCOUNT", ACCOUNT);
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		SearchDTO sdto = sdao.SearchAccAllColumn(map);
		
		
		int insertCnt = 0;
		if(ACCOUNT_PW.equals(sdto.getACCOUNT_PW())) {
			AutoTransferDTO dto = new AutoTransferDTO();
			dto.setId(id);
			dto.setACCOUNT(ACCOUNT);
			dto.setAuto_senderBank(auto_senderBank);
			dto.setAuto_senderAccount(req.getParameter("auto_senderAccount"));
			dto.setAuto_balance(auto_balance);
			dto.setAuto_outDate(Integer.parseInt(req.getParameter("auto_outDate")));
			dto.setAuto_registDate(Date.valueOf(req.getParameter("auto_registDate")));
			dto.setAuto_expirationDate(Date.valueOf(req.getParameter("auto_expirationDate")));
			dto.setAuto_type(Integer.parseInt(req.getParameter("auto_type")));
			dto.setAuto_inPlace(req.getParameter("auto_inPlace"));
			
			insertCnt = dao.insertAutoTransfer(dto);
			
		}else {
			insertCnt = -1; // 비밀번호 틀려서 자동이체신청불가
		}
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void getMyAutoTransfer(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("customerID");

		ArrayList<AutoTransferDTO> dtos = new ArrayList<AutoTransferDTO>();
		dtos = dao.getMyAutoTransfer(id);

		model.addAttribute("dtos", dtos);
	}
	
	@Override
	public void deleteAutoTransfer(HttpServletRequest req, Model model) {
		int auto_id = Integer.parseInt(req.getParameter("auto_id"));
		int deleteCnt = 0;
		deleteCnt = dao.deleteAutoTransfer(auto_id);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void AutoTransferAction() {
		// 오늘날짜(해당일자) 구하기
		SimpleDateFormat format = new SimpleDateFormat("dd");
		java.util.Date date = new java.util.Date();
		String days = format.format(date);


		// 자동이체 조건
		int auto_id = 0;
		String account = "";
		String auto_senderAccount = "";
		int auto_balance = 0;
		String auto_inPlace = "";
		String id = "";
		
		//int auto_status=0;
		int day = Integer.parseInt(days);

		// 오늘날짜로 자동이체조회해서 오늘납부할리스트들 가져오기
		ArrayList<AutoTransferDTO> transferInfo = dao.selectByDay(day);
		// 자동이체설정
		if (transferInfo.size() != 0) {
			int account_balance = 0; // 잔액
			for (int i = 0; i < transferInfo.size(); i++) {
				auto_id = transferInfo.get(i).getAuto_id();
				account = transferInfo.get(i).getACCOUNT(); // 내 계좌번호
				auto_senderAccount = transferInfo.get(i).getAuto_senderAccount(); // 받는사람계좌번호
				auto_balance = transferInfo.get(i).getAuto_balance();
				auto_inPlace = transferInfo.get(i).getAuto_inPlace();
				id = transferInfo.get(i).getId();

				// 내 계좌 잔액조회
				account_balance = dao.selectAccountBalance(account);

				if (account_balance >= auto_balance) {
					// 이체시작
					// 1.이체테이블에 내역 추가
					TransferDTO dto = new TransferDTO();
					dto.setACCOUNT(account);
					dto.setTf_sender_acc(auto_senderAccount);
					dto.setTf_amount(auto_balance);
					dto.setTf_sender_comment(auto_inPlace);
					dao.insertTranferByAuto(dto);

					// 2.자동이체내역테이블에 내역추가
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("auto_id", auto_id);
					map.put("id", id);
					map.put("auto_balance", auto_balance);
					map.put("auto_inplace", auto_inPlace);
					dao.insertAutoTransferList(map);

					// 3.납부한거 계좌반영(내 계좌 잔액감소)
					Map<String, Object> map1 = new HashMap<String, Object>();
					map1.put("account_balance", (account_balance - auto_balance));
					map1.put("account", account);
					dao.updateAccountAutoTransfer(map1);

					// 자동이체 테이블에 최신납부내역 갱신
					logger.info("자동이체 성공");
					// 4.자동이체 테이블에 납부내역 갱신
					dao.updateAutoTransfer(auto_id);
				} else {
					logger.info("자동이체 실패 : 계좌잔액이 부족합니다.");
					// 자동이체내역리스트에 실패내역 추가
					dao.failAutoTransferList(auto_id);
				}
			}
		} else {
			logger.info("자동이체할 데이터가 없습니다.");

		}
	}
	
}
