package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.AdminSearchServiceImpl;

@Controller
public class AdminSearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminSearchController.class);
	
	@Autowired
	AdminSearchServiceImpl service;
	
	//관리자 - 메인페이지
	@RequestMapping("main.ad")
	public String admin() {
		logger.info("[url => /main.ad]");
		
		return "chaey/admin";
	}
	
	//관리자 페이지
	@RequestMapping("admin.ad")
	public String main() {
		logger.info("[url => /admin.ad]");
		
		return "chaey/admin";
	}
	
	// 관리자 - 회원계좌조회 메인 - 이거 있는주소맞던가?
	@RequestMapping("adminSearchMain.do")
	public String adminSearchMain(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminSearchMain.do]");
		      		
		return "chaey/adminSearchMain";
	}
		
	
	// 관리자 - 회원계좌조회
	@RequestMapping("adminSearchAccount.ad")
	public String adminSearchAccount(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminSearchAccount.ad]");
		
		service.adminSearchAccountInfo(req, model);
		
		return "chaey/adminSearchAccount";
	}
	
	// 관리자 - 회원계좌조회 ajx페이지에 띄울 정보들
	@RequestMapping("adminSearchAction.ad")
	public String adminSearchAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminSearchAction.ad]");
		
		service.adminSearchAccount(req, model);
		
		return "chaey/adminSearchAction";
	}
	
	// 관리자 - 회원계좌변경 메인
	@RequestMapping("adminChangeAccount.ad")
	public String adminChangeAccount(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminChangeAccount.ad]");
		      		
		service.adminChangeAccount(req, model);
		return "chaey/adminChangeAccount";
	}
	
	// 관리자 - 회원계좌변경 - 중지대상계좌
	@RequestMapping("accountList_1year.ad")
	public String accountList_1year(HttpServletRequest req, Model model) {
		logger.info("[url ==> accountList_1year.ad]");
		      		
		service.adminAccountList_last_1year(req, model);
		return "chaey/accountList_1year";
	}
	
	// 관리자 - 회원계좌변경 - 휴면대상계좌
	@RequestMapping("accountList_5year.ad")
	public String accountList_5year(HttpServletRequest req, Model model) {
		logger.info("[url ==> accountList_5year.ad]");
		
		service.adminAccountList_last_5year(req, model);
		return "chaey/accountList_5year";
	}
	
	// 관리자 - 회원계좌변경 - 일괄중지처리
	@RequestMapping("adminAccountChange_stop.ad")
	public String adminAccountChange_stop(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminAccountChange_stop.ad]");
		      		
		service.adminAccountChange_stop(req, model);
		return "chaey/accountList_1year";
	}
	
	// 관리자 - 회원계좌변경 - 일괄휴면처리
	@RequestMapping("adminAccountChange_sleep.ad")
	public String adminAccountChange_sleep(HttpServletRequest req, Model model) {
		logger.info("[url ==> adminAccountChange_sleep.ad]");
		
		service.adminAccountChange_sleep(req, model);
		return "chaey/accountList_5year";
	}
	
}
