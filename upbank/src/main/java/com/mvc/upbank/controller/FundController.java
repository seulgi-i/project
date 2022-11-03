package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.FundServiceImpl;



@Controller
public class FundController {
	
	private static final Logger logger = LoggerFactory.getLogger(FundController.class);
	
	@Autowired
	FundServiceImpl service;
	
	//etf 목록조회
	@RequestMapping("etf.do")
	public String eft(HttpServletRequest req, Model model) {
		logger.info("[url => /etf.do]");
		
		return "seula/fund/etf";
	}
	
	//etn 목록조회
	@RequestMapping("etn.do")
	public String etn(HttpServletRequest req, Model model) {
		logger.info("[url => /etn.do]");
		service.etn(req, model);
		return "seula/fund/etn";
	}
	
	//fund 상세조회
	@RequestMapping("fundDetail.do")
	public String eftDetail(HttpServletRequest req, Model model) {
		logger.info("[url => /fundDetail.do]");
		service.fundDetailAction(req, model);
		service.fundChartAction(req, model);
		return "seula/fund/fundDetail";
	}
	
	//fund 구매페이지
	@RequestMapping("fundBuy.do")
	public String etfBuy(HttpServletRequest req, Model model) {
		logger.info("[url => /fundBuy.do]");
		service.fundTrading(req, model);
		return "seula/fund/fundBuy";
	}
	
	//fund 구매처리
	@RequestMapping("fundBuyAction.do")
	public String etfBuyAction(HttpServletRequest req, Model model) {
		logger.info("[url => /fundBuyAction.do]");
		service.fundBuyAction(req, model);
		return "seula/fund/fundBuyAction";
	}
	
	//fund 판매페이지
	@RequestMapping("fundSell.do")
	public String fundSell(HttpServletRequest req, Model model) {
		logger.info("[url => /fundSell.do]");
		service.fundTrading(req, model);
		return "seula/fund/fundSell";
	}
	
	//fund 판매처리
	@RequestMapping("fundSellAction.do")
	public String fundSellAction(HttpServletRequest req, Model model) {
		logger.info("[url => /fundBuyAction.do]");
		service.fundSellAction(req, model);
		return "seula/fund/fundBuyAction";
	}
	
	//fund 보유내역 조회
	@RequestMapping("fundMypage.do")
	public String fundMypage(HttpServletRequest req, Model model) {
		logger.info("[url => /fundMypage.do]");
		service.fundMypage(req, model);
		return "seula/fund/fundMypage";
	}
	
	//fund 거래내역 조회
	@RequestMapping("fundSearch.do")
	public String fundSearch(HttpServletRequest req, Model model) {
		logger.info("[url => /fundSearch.do]");
		service.fundSearch(req, model);
		return "seula/fund/fundSearch";
	}
	
	/* ============펀드 계좌 개설 ============*/
	//fund 계좌 개설 화면
	  @RequestMapping("fundAccountInsert.do")
	  public String fundAccountInsert(HttpServletRequest req, Model model) {
	     logger.info("[url => /fundAccountInsert.do]");
	     return "seula/fund/fundAccountInsert";
	  }
	  
	  //fund 계좌 개설 처리
	  @RequestMapping("fundAccountInsertAction.do")
	  public String fundAccountInsertAction(HttpServletRequest req, Model model) {
	     logger.info("[url => /fundAccountInsertAction.do]");
	     service.fundAccountInsertAction(req, model);
	     return "seula/fund/fundAccountInsertAction";
	  }
	  
	
}
