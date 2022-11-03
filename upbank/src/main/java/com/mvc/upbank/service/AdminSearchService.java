package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface AdminSearchService {

	//계좌조회 -종합
	public void adminSearchAccountInfo(HttpServletRequest req, Model model);

	public void cntAccountYearState(HttpServletRequest req, Model model);
	
	//계좌조회
	public void adminSearchAccount(HttpServletRequest req, Model model);
	
	//계좌번호 1건 조회
	public void searchAccount(HttpServletRequest req, Model model);
	
	//계좌조회-1년이상 미거래&정상
	public void adminAccountList_last_1year(HttpServletRequest req, Model model);
	//5년이상 미거래&중지상태
	public void adminAccountList_last_5year(HttpServletRequest req, Model model);
	//상태에따른 계좌List
	public void adminAccountList_state(HttpServletRequest req, Model model);
	
	//계좌수정-일괄중지처리
	public void adminAccountChange_stop(HttpServletRequest req, Model model);
	//일괄휴면처리
	public void adminAccountChange_sleep(HttpServletRequest req, Model model);
	
	//본인의 중지/휴면/해지상태 계좌조회
	public void sleepDisableAcc(HttpServletRequest req, Model model);
	public void memberAccountList_stopped(HttpServletRequest req, Model model);
	public void memberAccountList_state(HttpServletRequest req, Model model);
	public void memberAccountList_cancled(HttpServletRequest req, Model model);
	
	//정상화
	public void adminAccountChange_normal(HttpServletRequest req, Model model);
	//해지 
	public void adminAccountChange_cancle(HttpServletRequest req, Model model);
	
	
}
