package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.SearchService;


@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	SearchService service;
	
	////////////// 은진 : 조회 //////////////////

	//기본 입출금계좌 개설
  @RequestMapping("AccDefaultInsert.do")
  public String AccDefaultInsert(HttpServletRequest req, Model model) {
     logger.info("[url => /AccDefaultInsert.do]");
     return "eunjin/Search/AccDefaultInsert";
  }
  
	//기본 입출금계좌 개설 액션
  @RequestMapping("AccDefaultInsertAction.do")
  public String AccDefaultInsertAction(HttpServletRequest req, Model model) {
     logger.info("[url => /AccDefaultInsertAction.do]");
     service.AccDefaultInsert(req, model);
     return "eunjin/Search/AccDefaultInsertAction";
  }
  
	//비대면 입출금계좌 개설
  @RequestMapping("AccAnonymInsert.do")
  public String AccAnonymInsert(HttpServletRequest req, Model model) {
     logger.info("[url => /AccAnonymInsert.do]");
     return "eunjin/Search/AccAnonymInsert";
  }
  
	//비대면 입출금계좌 개설 액션
  @RequestMapping("AccAnonymInsertAction.do")
  public String AccAnonymInsertAction(HttpServletRequest req, Model model) {
     logger.info("[url => /AccAnonymInsertAction.do]");
     service.AccAnonymInsert(req, model);
     return "eunjin/Search/AccAnonymInsertAction";
  }
	
	//계좌조회 메인
  @RequestMapping("SearchMain.do")
  public String SearchMain(HttpServletRequest req, Model model) {
     logger.info("[url => /SearchMain.do]");
     service.SearchEveryAcc(req, model);
     return "eunjin/Search/SearchMain";
  }
  
//	//해지 및 휴면 계좌 조회
//  @RequestMapping("SleepDisableAcc.do")
//  public String SleepDisableAcc(HttpServletRequest req, Model model) {
//     logger.info("[url => /SleepDisableAcc.do]");
//     service.SleepDisableAcc(req, model);
//     return "eunjin/Search/SleepDisableAcc";
//  }
  
	//거래내역조회(기간별조회) 페이지이동
  @RequestMapping("SearchRangeSelect.do")
  public String SearchRangeSelect(HttpServletRequest req, Model model) {
     logger.info("[url => /SearchRangeSelect.do]");
     return "eunjin/Search/SearchRangeSelect";
  }
  
	//거래내역조회(기간별조회) 실제 조회 페이지
  @RequestMapping("SearchRangeSelectAction.do")
  public String SearchRangeSelectAction(HttpServletRequest req, Model model) {
     logger.info("[url => /SearchRangeSelectAction.do]");
     service.SearchRangeSelectAction(req, model);
     return "eunjin/Search/SearchRangeSelectAction";
  }
  
	//거래내역조회(계좌별 상세조회)
  @RequestMapping("SearchDetailTransfer.do")
  public String SearchDetailTransfer(HttpServletRequest req, Model model) {
     logger.info("[url => /SearchDetailTransfer.do]");
     service.SearchDetailTransfer(req, model);
     return "eunjin/Search/SearchDetailTransfer";
  }

	//대출 기일만기도래계좌 조회
  @RequestMapping("SoonEndLoanSearch.do")
  public String SoonEndLoanSearch(HttpServletRequest req, Model model) {
     logger.info("[url => /SoonEndLoanSearch.do]");
     service.SoonEndLoanSearch(req, model);
     return "eunjin/Search/SoonEndLoanSearch";
  }
  
	//차트 예시 조회
  @RequestMapping("Chart.ad")
  public String dailyProfit(HttpServletRequest req, Model model) {
     logger.info("[url => /Chart.ad]");
     service.dailyProfit(req, model);
     return "eunjin/Search/Chart";
  }
	
	
}
