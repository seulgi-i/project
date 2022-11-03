package com.mvc.upbank.service;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface FundService {
	
    //etn 목록
    public void etn(HttpServletRequest req, Model model);
    
	//차트
	public void fundChartAction(HttpServletRequest req, Model model) throws ParseException;
	
	//차트 디테일 페이지
	public void fundDetailAction(HttpServletRequest req, Model model);
	
	//펀드 계좌 개설
	public void fundAccountInsertAction(HttpServletRequest req, Model model);
	
	//펀드 매매페이지
	public void fundTrading(HttpServletRequest req, Model model);
	
	//펀드 구매처리
	public void fundBuyAction(HttpServletRequest req, Model model);
	
	//펀드 판매처리
	public void fundSellAction(HttpServletRequest req, Model model);
	
	//펀드 보유내역
	public void fundMypage(HttpServletRequest req, Model model);
	
	//펀드 거래내역
	public void fundSearch(HttpServletRequest req, Model model);
	
	//펀드 현재가 
    public Map<String, Object> getNowVal(String itemcode, Model model);
    
	
}
