 package com.mvc.upbank.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.upbank.service.DepositServiceImpl;
import com.mvc.upbank.service.installmentSavingsServiceImpl;

@Controller
public class installmentSavingsController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	installmentSavingsServiceImpl service;
	@Autowired
	DepositServiceImpl service2;
	

	////////관리자파트///////
	
	
	//적금상품추가페이지
	@RequestMapping("inssvnAdd.do")
	public String inssvnAdd() {
		logger.info("[url => /inssvnAdd.do]");

		return "seulki/admin/inssvnAdd";
	}
	// 적금상품추가처리
	@RequestMapping("inssvnAddAction.do")
	public String inssvnAddAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => inssvnAddAction.st]");

		service.inssvnAddAction(req, model);
		return "seulki/admin/inssvnAddAction";
	}
	
	//적금상품목록 관리
	@RequestMapping("inssvnEdit.do")
	public String inssvnEdit(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => inssvnEdit.do]");

		service.inssvnListAction(req, model);
		return "seulki/admin/inssvnEditList";
	}	
	//수정하기 클릭 > 적금상품 상세페이지
	@RequestMapping("inssvnEditDetail.do")
	public String inssvnEditDetail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /inssvnEditDetail.do]");
		
		service.inssvnDetailAction(req, model);
		service.rateDetailAction(req, model);
		return "seulki/admin/inssvnEditDetailPage";
	}	
	//적금상품수정처리
	@RequestMapping("inssvnEditAction.do")
	public String inssvnEditAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => inssvnEditAction.st]");

		service.inssvnEditAction(req, model);
		return "seulki/admin/inssvnUpdateAction";
	}
	// 상품 삭제 처리
	@RequestMapping("inssvnDeleteAction.do")
	public String inssvnDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => inssvnDeleteAction.st]");

		service.inssvnDeleteAction(req, model);
		service.inssvnDeleteAction(req, model);
		return "seulki/admin/inssvnDeleteAction";
	}	
	
	

	////////////////////////// 고객파트 ////////////////////////
	//적금상품 목록 -고객
	@RequestMapping("inssvnList.do")
	public String inssvnList(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /inssvnList.do]");
		
		service.inssvnListAction(req, model);
		return "seulki/customer/inssvnList";
	}
	
	
	//적금상품 상세페이지
	@RequestMapping("inssvnDetailAction.do")
	public String inssvnDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /inssvnDetailAction.do]");
		
		service.inssvnDetailAction(req, model);
		service.rateDetailAction(req, model);
		return "seulki/customer/inssvnDetail";
	}
	//이자계산기
	@RequestMapping("inssvnculator_1.do")
	public String inssvnculator_1(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /inssvnculator_1.do]");
			
		service.inssvnCalcAction(req, model);
		return "seulki/customer/inssvnculator_1";
	}	
	//적금상품 가입페이지
	@RequestMapping("inssvnJoinDetail.do")
	public String inssvnJoinDetail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /inssvnJoinDetail.do]");
				
		service.inssvnJoinDetail(req, model);
		service.rateDetailAction(req, model);
		return "seulki/customer/inssvnJoinDetail";
		}			
	//적금상품 가입처리
	@RequestMapping("inssvnJoin.do")
	public String inssvnJoin(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /inssvnJoin.do]");
		
		service.AccDefaultInsert(req, model);
		service.inssvnJoinAction(req, model);
		return "seulki/customer/inssvnJoinAction";
	}	
	
	// 회원 - 정기적금 자동이체 신청 페이지
	@RequestMapping("transferPage.do")
	public String transferPage(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("url ==> transferPage");
		service.transferPage(req, model);
		return "seulki/customer/transferPage";
	}

	
}
