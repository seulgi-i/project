package com.mvc.upbank.dao;


import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.ChartDTO;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

public interface SearchDAO {

	// 해당 유저의 모든 계좌 조회
	public List<SearchDTO> SearchEveryAcc(String id);

	//신규 입출금계좌 개설
	public int AccDefaultInsert (SearchDTO dto);
	
	//신규 입출금계좌 개설
	public int AccAnonymInsert (SearchDTO dto);
	
	//예금주명 조회
	public String SearchAccName (String id);
	
	//신규입출금계좌 개설성공여부
	public int AccDefaultInsertChk (Map<String, Object> map);
	
	//비대면 신규입출금계좌 개설여부
	public int AccAnonymInsertChk (Map<String, Object> map);
	
	//계좌의 종류별 조회 (예금, 적금, 입출금, 대출)
	public List<SearchDTO> SearchProductName(Map<String, Object> map); 
	
	//계좌 1개의 잔액 조회(상품명으로)
	public int SearchOneAccBalance(Map<String, Object> map);
	
	//계좌의 상태별 조회 (정상, 휴면, 해지)
	public List<SearchDTO> SleepDisableAcc(String id);
	
	//계좌 1개의 존재여부 조회(계좌번호로)
	public int BeAccount(String ACCOUNT);
	
	//계좌 1개의 모든 정보 조회(계좌번호, id)
	public SearchDTO SearchAccAllColumn(Map<String, Object> map);
	
	//계좌 1개의 모든 정보 조회(상품명, 휴대폰)
	public SearchDTO SearchAccAllColumn2(Map<String, Object> map);

	//계좌번호만 넣으면 모든 정보를 알려드립니다~!!
	public SearchDTO SearchAll(String ACCOUNT);
	
	//기간별 거래내역조회
	public List<TransferDTO> SearchRangeSelectAction(Map<String, Object> map);
	
	//계좌별 거래내역조회
	public List<TransferDTO> SearchDetailTransfer(String ACCOUNT);
	
	//대출기일만기도래계좌 조회
	public List<LoanAccountDTO> SoonEndLoanSearch(String id);
	
	//대출기일만기도래계좌 조회
	public int dailyProfit(String date);
}
