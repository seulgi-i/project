package com.mvc.upbank.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.AutoTransferDAOImpl;
import com.mvc.upbank.dao.CustomerDAOImpl;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class SchedulerService {
	
	private static final Logger logger = LoggerFactory.getLogger(SchedulerService.class);
	
	
	@Autowired
	CustomerServiceImpl service;
	@Autowired
	CustomerDAOImpl dao;
	@Autowired
	AutoTransferServiceImpl autoService;
	@Autowired
	AutoTransferDAOImpl autoDao;
	
	
	// cron = 초 분 시 일 월 요일 년(생략가능)
	// 매일 18시 30분마다 실행
	@Scheduled(cron = "0 30 18 * * * ")
	public void autoUpdate() throws Exception{
		int updateCnt = 0;
		updateCnt= autoDao.exitAutoTransfer();
		autoService.AutoTransferAction();
	}
}
