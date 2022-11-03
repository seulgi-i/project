package com.mvc.upbank.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.upbank.service.LoanServiceImpl;
import com.mvc.upbank.service.SearchServiceImpl;
import com.mvc.upbank.service.TransferServiceImpl;

@Controller
public class LoanController {
   private static final Logger logger = LoggerFactory.getLogger(LoanController.class);
   
   @Autowired
   LoanServiceImpl service;
   
   @Autowired
   TransferServiceImpl transService;
   
   // 고객 페이지 ------------------------------------------------
   // 대출 메인
   @RequestMapping("loan_main.lo")
   public String loan_main(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_main.lo >>>");
      return "aram/customer/loan_main";
   }
   
   // 대출 이자 계산기
   @RequestMapping("intrest_cal.lo")
   public String intrest_cal(HttpServletRequest req, Model model) {
      logger.info("<<< url => intrest_cal.lo >>>");
      service.loan_cal(req, model);
      return "aram/customer/loan_cal";
   }
   
   // 대출 상품 리스트
   @RequestMapping("loan_product.lo")
   public String loan_product(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_product.lo >>>");
      service.loan_product_list(req, model);
      return "aram/customer/product/loan_product";
   }
   
   // 대출 상품 상세 페이지
   @RequestMapping("loan_product_detail.lo")
   public String loan_product_detail(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_product_detail.lo >>>");
      service.product_detail(req, model);
      return "aram/customer/product/loan_product_detail";	// JSP 아직 없음
   }
   
   // 대출 신청
   @RequestMapping("loan_join.lo")
   public String loan_join(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_join.lo >>>");
      service.loan_join(req, model);
      return "aram/customer/join/loan_join";
   }

   // 대출 신청 확인
   @RequestMapping("loan_join_confirm.lo")
   public String loan_join_confirm(HttpServletRequest req, Model model) throws IOException {
      logger.info("<<< url => loan_join_confirm.lo >>>");
      return "aram/customer/join/loan_join_confirm";
   }
   
   // 대출 신청 처리
   @RequestMapping("loan_join_action.lo")
   public void loan_join_action(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
      logger.info("<<< url => loan_join_action.lo >>>");
      service.loan_join_action(req, model);
      String viewPage = req.getContextPath() + "/loan_join_result.lo?id=" + req.getSession().getAttribute("customerID");
      res.sendRedirect(viewPage);
   }
   
   // 대출 계좌 조회
   @RequestMapping("loan_account.lo")
   public String loan_account(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_account.lo >>>");
      
      service.loan_account(req, model, null);
      return "aram/customer/account/loan_account";
   }
   
   // 대출 계좌 상세 조회
   @RequestMapping(value="loan_accDetail.lo", method=RequestMethod.POST, produces = "application/text; charset=utf8")
   public @ResponseBody String loan_accDetail(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_accDetail.lo >>>");
      
      return service.loan_accDetail(req, model);
   }
   
   // 대출 중도 상환
   @RequestMapping("loan_repay.lo")
   public String loan_repay(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_repay.lo >>>");
      transService.transfer(req, model);
      service.loan_account(req, model, "상환중");
      return "aram/customer/repay/loan_repay";
   }
   
   // 대출 중도 상환 처리
   @RequestMapping("loan_terminate.lo")
   public void loan_terminate(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
      logger.info("<<< url => loan_terminate.lo >>>");
      String msg = service.loan_terminate(req, model);
      System.out.println("메세지 : " + msg);
      String viewPage = req.getContextPath() + "/loan_account.lo?msg=" + msg;
      res.sendRedirect(viewPage);
   }
   
   // 대출 신청 결과 조회
   @RequestMapping("loan_join_result.lo")
   public String loan_join_result(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_join_result.lo >>>");
      service.loan_join_result(req, model);
      return "aram/customer/join/loan_join_result";
   }
   
   // 대출 신청 결과 상세 조회
   @RequestMapping("loan_join_result_detail.lo")
   public String loan_join_result_detail(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_join_result_detail.lo >>>");
      service.loan_join_result_detail(req, model);
      return "aram/customer/join/loan_join_result_detail";
   }
   
   // 관리자 페이지 ------------------------------------------------
   // 대출 상품 등록
   @RequestMapping("loan_product_add.lo")
   public String loan_product_add(HttpServletRequest req, Model model) {
      logger.info("<<< url => loan_product_add.lo >>>");
      return "aram/admin/loan_product_add";
   }
   
   // 대출 상품 등록 처리
   @RequestMapping("product_addAction.lo")
   public void product_addAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
      logger.info("<<< url => product_addAction.lo >>>");
      service.product_addAction(req, model);
      
      String viewPage = "http://localhost:8022/loan_product.lo";
      res.sendRedirect(viewPage);
   }
   
   // 대출 신청 목록 조회
   @RequestMapping("admin_loan_join.lo")
   public String admin_loan_join(HttpServletRequest req, Model model) {
      logger.info("<<< url => admin_loan_join.lo >>>");
      service.admin_loan_join(req, model);
      return "aram/admin/loan_join_result";
   }

   // 대출 신청 상세 조회
   @RequestMapping("admin_loan_join_detail.lo")
   public String admin_loan_join_detail(HttpServletRequest req, Model model) {
      logger.info("<<< url => admin_loan_join_detail.lo >>>");
      service.admin_loan_join_detail(req, model);
      return "aram/admin/loan_join_result_detail";
   }
   
   // 대출 승인 처리
   @RequestMapping("admin_loan_accept.lo")
   public void admin_loan_accept(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
      logger.info("<<< url => admin_loan_accept.lo >>>");
      service.loan_accept(req, model);
      
      String viewPage = req.getContextPath() + "/admin_loan_join.lo";
      res.sendRedirect(viewPage);
   }
   
   // 대출 불가 처리
   @RequestMapping("admin_loan_denied.lo")
   public void admin_loan_denied(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
      logger.info("<<< url => admin_loan_denied.lo >>>");
      service.loan_denied(req, model);
      
      String viewPage = req.getContextPath() + "/admin_loan_join.lo";
      res.sendRedirect(viewPage);
   }
}