package pj.mvc.jsp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {

	//ID중복확인 처리
	public void confirmIdAction(HttpServletRequest rea, HttpServletResponse res);
	
	//회원가입 처리
	public void signInAction(HttpServletRequest req, HttpServletResponse res);
	
	//로그인 처리
	public void loginAction(HttpServletRequest req, HttpServletResponse res);
	
	//회원정보 인증 및 탈퇴처리
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res);
	
	//회원정보 인증 및 상세페이지
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res);
	
	//회원정보 수정 처리
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res);
	
	//이메일 인증(각자 알아서)
	public void emailChkAction(HttpServletRequest req, HttpServletResponse res);
	
	//회원목록 처리
	public void customerListAction(HttpServletRequest req, HttpServletResponse res);
	
}
