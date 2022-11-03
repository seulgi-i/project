package spring.mvc.pj_117_csg.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface OrderService {
	
	
	//주문페이지
	public void orderPageAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;
		
	//주문요청
	public void orderAddAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	//주문목록
	public void orderListAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;	
	
	//주문취소(개별취소)
	public void cancleAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;	
	
	//주문취소(선택취소)
	public void cancleOrderAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;	
	
	//환불요청(개별환불)
	public void refundAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//환불요청(선택환불)
	public void refundOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;		
	
	//구매확정(개별확정)
	public void buyAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	
	//구매확정(선택확정)
	public void buyOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;				
	
	//////////////// 관리자용  //////////////////
	
	//관리자컨펌목록(주문,환불승인처리)
	public void confirmListAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	//주문승인(관리자)
	public void confirmOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	
	//환불승인(관리자)
	public void confirmRefundAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;		
	
	//관리자 결산
	public void adminSoldViewAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;		
			
}
