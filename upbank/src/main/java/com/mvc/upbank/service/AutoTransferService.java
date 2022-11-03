package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AutoTransferService {
	// 회원 자동이체 신청
    public void insertAutoTransfer(HttpServletRequest req, Model model);
    
    // 회원 자동이체 목록
    public void getMyAutoTransfer(HttpServletRequest req, Model model);
    
    // 회원 자동이체 해지
    public void deleteAutoTransfer(HttpServletRequest req, Model model);
    
    // 자동이체 실행
    public void AutoTransferAction();
}
