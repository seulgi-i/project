package spring.mvc.pj_117_csg.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_csg.service.CartServiceImpl;
import spring.mvc.pj_117_csg.service.OrderServiceImpl;

@Controller
public class OrderController {
	
private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	

	@Autowired
	OrderServiceImpl service;
	
	@Autowired
	CartServiceImpl service2;
	
	
	//주문페이지
	@RequestMapping("OrderPageAction.or")
	public String OrderPageAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => OrderPageAction.or]");
		
		service.orderPageAction(req, model);
		return "customer/mypage/order/orderPage";
	}
	
	//주문목록
	@RequestMapping("orderList.or")
	public String orderListAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => OrderPageAction.or]");
		
		service.orderListAction(req, model);
		return "customer/mypage/order/orderList";
	}	
	//주문요청
	@RequestMapping("OrderAddAction.or")
	public String OrderAddAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => OrderAddAction.or]");
		
		service.orderAddAction(req, model);
		service2.cartDeleteAction(req, model);
		return "customer/mypage/order/OrderAddAction";
	}	
	//주문취소(다건)
	@RequestMapping("CancleOrderAction.or")
	public String CancleOrderAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => CancleOrderAction.or]");
			
		service.cancleOrderAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}	
	
	//주문취소(1건)
	@RequestMapping("CancleAction.or")
	public String CancleAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => CancleAction.or]");
			
		service.cancleAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}	
	//환불요청(다건)
	@RequestMapping("RefundOrderAction.or")
	public String RefundAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => RefundOrderAction.or]");
			
		service.refundOrderAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}	
	//환불요청(1건)
	@RequestMapping("RefundAction.or")
	public String RefundOrderAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => RefundAction.or]");
			
		service.refundAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}	
	//구매확정(다건)
	@RequestMapping("BuyOrderAction.or")
	public String BuyOrderAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => BuyOrderAction.or]");
			
		service.buyOrderAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}
	//구매확정(1건)
	@RequestMapping("BuyAction.or")
	public String BuyAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => BuyAction.or]");
			
		service.buyAction(req, model);
		return "customer/mypage/order/UpdateOrderAction";
	}
	
	//관리자 컨펌 리스트
	@RequestMapping("ConfirmList.or")
	public String ConfirmList(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => ConfirmList.or]");
			
		service.confirmListAction(req, model);
		return "admin/total/ConfirmList";
	}
	
	//관리자 주문 승인 처리
	@RequestMapping("ConfirmOrderAction.or")
	public String ConfirmOrderAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => ConfirmOrderAction.or]");
			
		service.confirmOrderAction(req, model);
		return "admin/total/ConfirmAction";
	}
	
	//관리자 환불 승인 처리
	@RequestMapping("ConfirmRefundAction.or")
	public String ConfirmRefundAction(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => ConfirmRefundAction.or]");
			
		service.confirmRefundAction(req, model);
		return "admin/total/ConfirmAction";
	}
	
	//관리자 결산 목록
	@RequestMapping("AdminSoldView.or")
	public String AdminSoldView(HttpServletRequest req, Model model) 
		throws ServletException, IOException{
		logger.info("[url => AdminSoldView.or]");
			
		service.adminSoldViewAction(req, model);
		return "admin/total/AdminSoldView";
	}	
	
}
