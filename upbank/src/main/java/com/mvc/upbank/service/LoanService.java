package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LoanService {
	
	// 대출 이자 계산기
	public void loan_cal(HttpServletRequest req, Model model);

	// 대출 상품 리스트
	public void loan_product_list(HttpServletRequest req, Model model);
	
	// 대출 상품 상세 페이지
	public void product_detail(HttpServletRequest req, Model model);
	
	// 고객 ------------------------------------------
	// 대출 상품 가입
	public void loan_join(HttpServletRequest req, Model model);
	
	// 대출 상품 가입 처리
	public void loan_join_action(HttpServletRequest req, Model model);
	
	// 대출 신청 결과 조회 - 목록
	public void loan_join_result(HttpServletRequest req, Model model);
	
	// 대출 신청 결과 조회 - 상세
	public void loan_join_result_detail(HttpServletRequest req, Model model);
	
	// 대출 계좌 목록 조회
	public void loan_account(HttpServletRequest req, Model model, String l_status);
	
	// 대출 상환시 계좌 상세 조회
	public String loan_accDetail(HttpServletRequest req, Model model);
	
	// 대출 중도 상환 처리
	public String loan_terminate(HttpServletRequest req, Model model);
	
	// 관리자 -----------------------------------------
	// 대출 상품 등록 처리
	public void product_addAction(HttpServletRequest req, Model model);
	
	// 대출 신청 목록 조회
	public void admin_loan_join(HttpServletRequest req, Model model);
	
	// 대출 신청 상세 조회
	public void admin_loan_join_detail(HttpServletRequest req, Model model);

	// 대출 승인 처리
	void loan_accept(HttpServletRequest req, Model model);
	
	// 대출 불가 처리
	public void loan_denied(HttpServletRequest req, Model model);
}
