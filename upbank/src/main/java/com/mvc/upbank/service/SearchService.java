package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface SearchService {

	
	//전체계좌조회
	public void SearchEveryAcc(HttpServletRequest req, Model model);

	//기본 입출금계좌 개설
	public void AccDefaultInsert(HttpServletRequest req, Model model);
	
	//비대면 입출금계좌 개설
	public void AccAnonymInsert(HttpServletRequest req, Model model);
	
	//해지 및 휴면 계좌 조회
	public void SleepDisableAcc(HttpServletRequest req, Model model);

	//기간별 거래내역 조회 액션
	public void SearchRangeSelectAction(HttpServletRequest req, Model model);
	
	//계좌별 상세거래내역 조회 
	public void SearchDetailTransfer(HttpServletRequest req, Model model);

	// 대출 기간만기도래계좌 조회
	public void SoonEndLoanSearch(HttpServletRequest req, Model model);
	
	// 일별 수수료수익 조회
	public void dailyProfit(HttpServletRequest req, Model model);
	

	

}
