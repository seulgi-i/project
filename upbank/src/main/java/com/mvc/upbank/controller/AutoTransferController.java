package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.AutoTransferServiceImpl;
import com.mvc.upbank.service.CustomerServiceImpl;
import com.mvc.upbank.service.SearchServiceImpl;
import com.mvc.upbank.service.TransferService;
import com.mvc.upbank.service.TransferServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
public class AutoTransferController {
	
		private static final Logger logger = LoggerFactory.getLogger(AutoTransferController.class);
		
		@Autowired 
		SearchServiceImpl searchService;
		@Autowired 
		AutoTransferServiceImpl autoService;
		@Autowired
		TransferServiceImpl transferService;
		
		
		// 회원 - 자동이체 페이지
	/*
	 * @RequestMapping("autoTransfer.do") public String
	 * autoTransfer(HttpServletRequest req, Model model) {
	 * logger.info("url ==> autoTransfer"); searchService.SearchEveryAcc(req,
	 * model); return "injune/autoTransfer"; }
	 */

		
		// 회원 - 자동이체 신청 페이지
		@RequestMapping("autoTransferInsert.do")
		public String autoTransferInsert(HttpServletRequest req, Model model) {
			logger.info("url ==> autoTransferInsert");
		//	searchService.SearchEveryAcc(req, model);
			transferService.transfer(req, model);
			return "injune/autoTransferInsert";
		}

		// 회원 - 자동이체 신청 액션
		@RequestMapping("autoTransferInsertAction.do")
		public String autoTransferInsertAction(HttpServletRequest req, Model model) {
			logger.info("url ==> autoTransferInsertAction");
			autoService.insertAutoTransfer(req, model);
			return "injune/autoTransferInsertAction";
		}
			
		// 회원 - 자동이체 내역조회
		@RequestMapping("autoTransferList.do")
		public String autoTransferList(HttpServletRequest req, Model model) {
			logger.info("url ==> autoTransferList");
			autoService.getMyAutoTransfer(req, model);
			return "injune/autoTransferList";
		}
		
		// 회원 - 자동이체 해지
		@RequestMapping("autoTransferDelete.do")
		public String autoTransferDelete(HttpServletRequest req, Model model) {
			logger.info("url ==> autoTransferDelete");
			autoService.deleteAutoTransfer(req, model);
			return "injune/autoTransferDelete";
		}
}
