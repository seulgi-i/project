package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface CustomerService {

	
	//중복확인 처리
	public void confirmIdAction(HttpServletRequest req, Model model);
	
	//회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
	
	//이메일 인증
	public void emailChkAction(HttpServletRequest req, Model model);

	//계좌,비번으로 계좌정보 조회
	public void join_search(HttpServletRequest req, Model model);
	
	//회원가입폼에 정보 자동기입
	public void join_form(HttpServletRequest req, Model model);
	
	//회원정보 수정페이지
	public void modifyDetailAction(HttpServletRequest req, Model model);
	
	//회원정보 수정처리
	public void modifyCustomerAction(HttpServletRequest req, Model model);
}
