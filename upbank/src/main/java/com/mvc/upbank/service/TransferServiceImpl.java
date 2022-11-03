package com.mvc.upbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dao.TransferDAO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

@Service
public class TransferServiceImpl implements TransferService{
	
	private static final Logger logger = LoggerFactory.getLogger(TransferService.class);
	
	
	@Autowired
	TransferDAO dao;
	@Autowired
	SearchDAO sdao;

	@Override
	//계좌이체 첫화면에 소지한 입출금계좌 띄워주는 메소드.
	public void transfer(HttpServletRequest req, Model model) {
		logger.info("서비스 = TransferService : transfer");
		Map<String, Object> map = new HashMap<String, Object>();
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		String ACCOUNT_TYPE = "입출금";
		map.put("id", id);
		map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
		
		List<SearchDTO> sList = sdao.SearchProductName(map);
		model.addAttribute("sList", sList);
	}

	@Override
	//계좌이체단에서 입력한 정보 처리단.
	public void manyTransfer(HttpServletRequest req, Model model) {
		
	}

	// 계좌 이체 내역 조회
	@Override
	public List<TransferDTO> transferList(HttpServletRequest req, Model model) {
		logger.info("서비스= transferService : transferList");
		String id = (String) req.getSession().getAttribute("customerID");
//		List<SearchDTO> list = sdao.SearchEveryAcc(id);
//		
//		//한 ID가 보유한 모든 계좌 정보를 가져온다 
//		String[] account = null;
//		for(int i=0; i<list.size(); i++) {
//			account[i]=list.get(i).getACCOUNT();
//		}
//		
		//각 계좌별로 이체내역 테이블을 조회한다(for)
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		List<TransferDTO> list = dao.transferList(map);
		model.addAttribute("list", list);
		
		return dao.transferList(map);
	}

	@Override
	@Transactional
	public void transfer2(HttpServletRequest req, Model model) {
		logger.info("서비스 = TransferService : transfer2");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = String.valueOf(req.getSession().getAttribute("customerID"));
		String ACCOUNT = req.getParameter("acctype");
		String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
		String tf_bank = req.getParameter("tf_bank");
		String tf_sender_acc = req.getParameter("tf_sender_acc");
		int tf_amount = Integer.parseInt(req.getParameter("tf_amount"));
		String tf_deposit_comment = req.getParameter("tf_deposit_comment");
		String tf_sender_comment = req.getParameter("tf_sender_comment");
		int BALANCE;
		
		int insertCnt = 0; //이체 테이블에 이체정보 인서트
		int balSetCnt = 0; //어카운트 테이블에 잔고변경 인서트(돈 빠져나가는 계좌)
		int balSetUpCnt = 0; //어카운트 테이블에 잔고변경 인서트(돈 들어오는 업뱅크계좌)
		int chargeCnt = 0; //수수료(수익) 테이블에 인서트 
		
		map.put("ACCOUNT",ACCOUNT);
		map.put("id", id);
		map.put("tf_sender_acc",tf_sender_acc);
		SearchDTO sdto = sdao.SearchAccAllColumn(map);
		String tf_acc_holder = sdto.getACCOUNT_NAME();
		if(ACCOUNT_PW.equals(sdto.getACCOUNT_PW()) && tf_amount!=0) {
			TransferDTO dto = new TransferDTO();
			dto.setACCOUNT(ACCOUNT);
			dto.setTf_sender_acc(tf_sender_acc);
			dto.setTf_bank(tf_bank);
			dto.setTf_amount(tf_amount);
			dto.setTf_sender_comment(tf_sender_comment);
			dto.setTf_deposit_comment(tf_deposit_comment);
			dto.setTf_acc_holder(tf_acc_holder);
			if (tf_bank.equals("UpBank")) { //당행이체
				dto.setTf_charges(0);
				BALANCE = sdto.getBALANCE() - tf_amount;
				map.put("BALANCE", BALANCE);
				if (sdao.BeAccount(tf_sender_acc) == 0) {
					insertCnt = -3; //UpBank에 당행이체하려는데 계좌가 없는 경우

					model.addAttribute("insertCnt", insertCnt);
					return;
					
				} else if(sdao.BeAccount(tf_sender_acc) == 1) {
					balSetCnt = dao.transferBalanceSet(map);//잔고변경됨(-)
					ACCOUNT = req.getParameter("tf_sender_acc");
					
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("ACCOUNT", ACCOUNT);
					map2.put("id", id);
					
					SearchDTO sdto2 = sdao.SearchAll(ACCOUNT);
					BALANCE = sdto2.getBALANCE() + tf_amount;
					map2.put("BALANCE", BALANCE);
					balSetUpCnt = dao.transferBalanceSet(map2); //잔고변경됨(+)
				}
			} else {
				dto.setTf_charges(500);
				BALANCE = sdto.getBALANCE() - tf_amount - 500;
				map.put("BALANCE", BALANCE);
				balSetCnt = dao.transferBalanceSet(map); //잔고변경됨
				chargeCnt= dao.transferChargeInsert(dto); //수수료 수익 인서트함
			}
			insertCnt = dao.transferInfoInsert(dto); //이체테이블에 인서트함
		} else if(ACCOUNT_PW != sdto.getACCOUNT_PW()) {
			insertCnt = -1; //비번틀려서 이체x
		} else if(tf_amount==0) {
			insertCnt = -2; //0원이체시도라 이체x
		} 
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

	
}
