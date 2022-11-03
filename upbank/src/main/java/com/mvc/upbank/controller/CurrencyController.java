package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.upbank.service.CurrencyService;


@Controller
public class CurrencyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CurrencyController.class);
	
	@Autowired
	CurrencyService service;
	
	
	////////////// 은진 - 외환 조회 //////////////////

  
//  환율 메인
  @RequestMapping("CurrencyInfo.cr")
  public String CurrencyInfo(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyInfo.cr]");
     service.CurrencyInfo(req, model);
     return "eunjin/Currency/CurrencyInfo";
  }
  
//환율 날짜별조회
@RequestMapping("CurrencyInfoDate.cr")
public String CurrencyInfoDate(HttpServletRequest req, Model model) {
   logger.info("[url => /CurrencyInfoDate.cr]");
   service.CurrencyInfoDate(req, model);
   return "eunjin/Currency/CurrencyInfoDate";
}
  
//  환율계산기
  @RequestMapping("CurrencyCalc.cr")
  public String CurrencyCalc(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyCalc.cr]");
     service.CurrencyInfo(req, model);
     return "eunjin/Currency/CurrencyCalc";
  }
  
//환율계산기 결과
  @RequestMapping("CurrencyCalcResult.cr")
  public String CurrencyCalcResult(HttpServletRequest req, Model model) {
	 logger.info("[url => /CurrencyCalcResult.cr]");
	 service.CurrencyCalc(req, model);
	 return "eunjin/Currency/CurrencyCalcResult";
  }
  
//  환전신청 , 들어가자마자 보이는 페이지
  @RequestMapping("CurrencyExchangeMain.cr")
  public String CurrencyExchangeMain(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeMain.cr]");
     service.CurrencyExchangeMain(req, model);
     return "eunjin/Currency/CurrencyExchangeMain";
  }
  
  	//환전신청, 환전할 원화 값을 입력하면 보여주는 메소드 
  @RequestMapping("CurrencyExchangeMain2.cr")
  public String CurrencyExchangeMain2(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeMain2.cr]");
     service.CurrencyExchangeMain2(req, model);
     return "eunjin/Currency/CurrencyExchangeMain2";
  }
  
	//환전신청, 환전할 원화 값을 입력하면 보여주는 메소드 
	@RequestMapping("CurrencyExchangeMain3.cr")
	public String CurrencyExchangeMain3(HttpServletRequest req, Model model) {
	   logger.info("[url => /CurrencyExchangeMain3.cr]");
	   service.CurrencyExchangeMain3(req, model);
	   return "eunjin/Currency/CurrencyExchangeMain3";
	}
  
	//환전신청, 환전신청인 정보 받아서 입력하는 메소드
	@RequestMapping("CurrencyExchangeMain4.cr")
	public String CurrencyExchangeMain4(HttpServletRequest req, Model model) {
	   logger.info("[url => /CurrencyExchangeMain4.cr]");
	   service.CurrencyExchangeMain4(req, model);
	   return "eunjin/Currency/CurrencyExchangeMain4";
	}
	
	//환전신청, 환전신청 성공 페이지로 이동
	@RequestMapping("CurrencyExchangeMain5.cr")
	public String CurrencyExchangeMain5(HttpServletRequest req, Model model) {
	   logger.info("[url => /CurrencyExchangeMain5.cr]");
	   return "eunjin/Currency/CurrencyExchangeMain5";
	}
	
	//환전신청, 환전신청내역 조회 (별도로 진입시)
  @RequestMapping("CurrencyExchangeSearch.cr")
  public String CurrencyExchangeSearch(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeSearch.cr]");
     return "eunjin/Currency/CurrencyExchangeSearch";
  }
  
	//환전신청, 환전신청내역 조회 (신청후 바로 진입시)
  @RequestMapping("CurrencyExchangeSearch2.cr")
  public String CurrencyExchangeSearch2(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeSearch2.cr]");
     service.CurrencyExchangeSearch(req, model);
     return "eunjin/Currency/CurrencyExchangeSearch2";
  }
	
  
  //관리자 : 환전신청, 수령내역 업데이트 (수령대기 -> 수령완료)
  @RequestMapping("CurrencyExchangeAdmin.ad")
  public String CurrencyExchangeAdmin(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeAdmin.ad]");
     return "eunjin/Currency/CurrencyExchangeAdmin";
  }
  
  //관리자 : 환전신청, 수령내역 업데이트 (수령대기 -> 수령완료)
  @RequestMapping("CurrencyExchangeAdmin2.ad")
  public String CurrencyExchangeAdmin2(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeAdmin2.ad]");
     service.CurrencyExchangeAdmin(req, model);
     return "eunjin/Currency/CurrencyExchangeAdmin2";
  }
  
  //관리자 : 환전신청, 수령내역 업데이트 (수령대기 -> 수령완료)
  @RequestMapping("CurrencyExchangeAdmin3.ad")
  public String CurrencyExchangeAdmin3(HttpServletRequest req, Model model) {
     logger.info("[url => /CurrencyExchangeAdmin3.ad]");
     service.CurrencyExchangeAdmin2(req, model);
     return "eunjin/Currency/CurrencyExchangeAdmin2";
  }
  
	
	
}
