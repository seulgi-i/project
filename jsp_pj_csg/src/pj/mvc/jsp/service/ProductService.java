package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProductService {
	//상품등록
	public void productAddAction(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException;
	
	//상품목록
	public void productListAction(HttpServletResponse res, HttpServletRequest req)
		throws ServletException, IOException;
	

	//상세페이지
	public void productDetailAction(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException;
	
	//상품수정
	public void productUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	
	//상품삭제
	public void productDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
}
