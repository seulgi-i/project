package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CartService {
	
	
	//장바구니 목록
	public void cartListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	//장바구니 추가
	public void cartAddAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;	
	
	//장바구니 수정
	public void cartUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	//장바구니 개별/선택 삭제
	public void cartDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	//장바구니 비우기
	public void cartAllDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;	
	
	
}
