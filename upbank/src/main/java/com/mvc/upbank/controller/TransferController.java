package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.TransferService;


@Controller
public class TransferController {
	private static final Logger logger = LoggerFactory.getLogger(TransferController.class);
	
	@Autowired
	TransferService service;

	//////////////인준 : 이체 //////////////////
	
	//기본 계좌이체
	@RequestMapping("transfer.do")
	public String transfer(HttpServletRequest req, Model model) {
	logger.info("[url => /transfer.do]");
		service.transfer(req, model);
		return "injune/transfer";
	}
	
	//기본 계좌이체 처리
	@RequestMapping("transfer2.do")
	public String transfer2(HttpServletRequest req, Model model) {
	logger.info("[url => /transfer2.do]");
		service.transfer2(req, model);
		return "injune/transfer2";
	}
	
	//기본 다건 계좌이체
	@RequestMapping("manyTransfer.do")
	public String manyTransfer(HttpServletRequest req, Model model) {
		logger.info("[url => /manyTransfer.do]");
		
		return "injune/manyTransfer";
	}
	
	//이체결과조회
	@RequestMapping("transferList.do")
	public String transferList(HttpServletRequest req, Model model) {
		logger.info("[url => /transferList.do]");
		service.transferList(req, model);
		return "injune/transferList";
	}
	
}
