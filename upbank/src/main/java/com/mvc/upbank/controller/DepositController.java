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

import com.mvc.upbank.service.AutoTransferServiceImpl;
import com.mvc.upbank.service.DepositServiceImpl;
import com.mvc.upbank.service.TransferServiceImpl;
import com.mvc.upbank.service.installmentSavingsService;

@Controller
public class DepositController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	DepositServiceImpl service;
	
	@Autowired
	TransferServiceImpl service2;
	
	@Autowired
	installmentSavingsService service3;
	
	@Autowired
	AutoTransferServiceImpl service4;
	
	///////////// 슬기 - 예금, 적금 파트 ///////////////
	//예금적금메인
	@RequestMapping("depositMain.do")
	public String depositMain(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositMain.do]");
		
		return "seulki/depositMain";
	}	
	//관리자파트//
	
	
	//예금상품추가페이지
	@RequestMapping("depositAdd.do")
	public String depositAdd() {
		logger.info("[url => /depositAdd.do]");

		return "seulki/admin/depositAdd";
	}
	
	// 예금상품추가처리
	@RequestMapping("depositAddAction.do")
	public String depositAddAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => depositAddAction.st]");

		service.depositAddAction(req, model);
		return "seulki/admin/depositAddAction";
	}
	
	//예금상품목록 관리
	@RequestMapping("depositEdit.do")
	public String depositEdit(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => depositAddAction.st]");

		service.depositListAction(req, model);
		return "seulki/admin/depositEditList";
	}	
	
	//수정하기 클릭 > 예금상품 상세페이지
	@RequestMapping("depositDetail.do")
	public String depositDetail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositDetail.do]");
		
		service.depositDetailAction(req, model);
		service.rateDetailAction(req, model);
		return "seulki/admin/depositEditDetailPage";
	}
	
	//예금상품수정처리
	@RequestMapping("depositEditAction.do")
	public String depositEditAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => depositEditAction.st]");

		service.depositEditAction(req, model);
		return "seulki/admin/depositUpdateAction";
	}
	
	// 상품 삭제 처리	
	@RequestMapping("depositDeleteAction.do")
	public String depositDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => depositDeleteAction.st]");

		service.depositDeleteAction(req, model);
		service.rateDeleteAction(req, model);
		return "seulki/admin/depositDeleteAction";
	}	
	
	

	////////////////////////// 고객파트 ////////////////////////
	//예금상품 목록 -고객
	@RequestMapping("depositList.do")
	public String depositlist(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /depositList.do]");
		
		service.depositListAction(req, model);
		return "seulki/customer/depositList";
	}
	
	
	//예금상품 상세페이지
	@RequestMapping("depositDetailAction.do")
	public String depositDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositDetailAction.do]");
		
		service.depositDetailAction(req, model);
		service.rateDetailAction(req, model);
		return "seulki/customer/depositDetail";
	}
	
	//이자계산기
	@RequestMapping("depositcalculator_1.do")
	public String depositcalculator_1(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositcalculator_1.do]");
		
		service.depositCalcAction(req, model);
		return "seulki/customer/depositcalculator_1";
	}	
	
	//예금상품 해지/조회 페이지
	@RequestMapping("terminateList.do")
	public String terminateList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /terminateList.do]");
		
		service.terminateList(req, model);
		return "seulki/customer/terminateList";
	}	
	
	//예금상품 가입페이지
	@RequestMapping("depositJoinDetail.do")
	public String depositJoinDetail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositJoinDetail.do]");
		
		service.depositJoinDetail(req, model);
		service.rateDetailAction(req, model);
		return "seulki/customer/depositJoinDetail";
	}	

	//예금상품 가입처리
	@RequestMapping("depositJoinAction.do")
	public String depositJoin(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /depositJoinAction.do]");
		
		service.AccDefaultInsert(req, model);
		service.depositJoinAction(req, model);
		return "seulki/customer/depositJoinAction";
	}	
	
	//예금상품 해지처리
	@RequestMapping("terminateAction.do")
	public String terminateAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => /terminateAction.do]");
		String ACCOUNT_TYPE = req.getParameter("ACCOUNT_TYPE");
		logger.info("Controller - ACCOUNT_TYPE : " + ACCOUNT_TYPE);
		if(ACCOUNT_TYPE.equals("예금")) {
			service.terminateAction(req, model);
			return "seulki/customer/terminateAction";
		}else {
			service3.terminateAction2(req, model);
			return "seulki/customer/terminateAction";
		}
		
	}
	
}
