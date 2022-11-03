package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface CurrencyService {

	
	//환율정보메인
	public void CurrencyInfo(HttpServletRequest req, Model model);
	
	//환율정보 날짜별조회
	public void CurrencyInfoDate(HttpServletRequest req, Model model);

	//환율계산기
	public void CurrencyCalc(HttpServletRequest req, Model model);
	
	//환전신청 1 : 우대율 계산해서 표에 띄우기
	public void CurrencyExchangeMain(HttpServletRequest req, Model model);
	
	//환전신청 2 : 출금예상금액 계산해서 표에 띄우기
	public void CurrencyExchangeMain2(HttpServletRequest req, Model model);
	
	//환전신청 3 : 환전신청인정보 입력
	public void CurrencyExchangeMain3(HttpServletRequest req, Model model);
	
	//환전신청 4 : 환전신청인정보 처리
	public void CurrencyExchangeMain4(HttpServletRequest req, Model model);
	
	//환전신청조회 : 실제 정보 조회
	public void CurrencyExchangeSearch(HttpServletRequest req, Model model);

	//관리자 : 환전신청 - 수령여부 변경 업데이트
	public void CurrencyExchangeAdmin(HttpServletRequest req, Model model);

	//관리자 : 환전신청 - 수령여부 변경 업데이트
	public void CurrencyExchangeAdmin2(HttpServletRequest req, Model model);

	


	

}
