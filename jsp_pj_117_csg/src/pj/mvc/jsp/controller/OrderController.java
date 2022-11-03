package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.CartServiceImpl;
import pj.mvc.jsp.service.OrderServiceImpl;
import pj.mvc.jsp.util.ImageUploadHandler;

@WebServlet("*.or")
@MultipartConfig(location = "D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload", fileSizeThreshold = 1024
		* 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String IMG_UPLOAD_DIR = "D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload";

	public OrderController() {
		super();
	}

	private ImageUploadHandler uploader;

	// 1단계. 웹브라우저가 전송한 HTTP 요청 받음
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		action(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	public void action(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 한글 안 깨지게 처리
		req.setCharacterEncoding("UTF-8");
		String viewPage = "";

		// 2단계. 요청 분석

		String uri = req.getRequestURI(); // /jsp_pj_117_csg/*.or
		String contextPath = req.getContextPath(); // /jsp_pj_117_csg
		String url = uri.substring(contextPath.length()); // /*.or

		OrderServiceImpl service = new OrderServiceImpl();
		CartServiceImpl service2 = new CartServiceImpl();
		// -----------------------------------------[주문]----------------------------------------------
		// 주문목록
		if (url.equals("/orderList.or")) {
			System.out.println("[url => orderList.or]");

			service.orderListAction(req, res);
			viewPage = "customer/mypage/order/orderList.jsp";

		}
		// 주문페이지
		else if (url.equals("/OrderPageAction.or")) {
			System.out.println("[url => OrderPageAction.or]");

			service.orderPageAction(res, req);
			viewPage = "customer/mypage/order/orderPage.jsp";

		// 주문요청
		} else if (url.equals("/OrderAddAction.or")) {
			System.out.println("[url => OrderAddAction.or]");

			service.orderAddAction(res, req);
			service2.cartDeleteAction(req, res);
			viewPage = "customer/mypage/order/OrderAddAction.jsp";
		}

		// 주문취소(다건)
		else if (url.equals("/CancleOrderAction.or")) {
			System.out.println("[url => CancleOrderAction.or]");

			service.cancleOrderAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";

		}
		// 주문취소(1건)
		else if (url.equals("/CancleAction.or")) {
			System.out.println("[url => CancleAction.or]");

			service.cancleAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";
		}
		
		// 환불요청(다건)
		else if (url.equals("/RefundOrderAction.or")) {
			System.out.println("[url => RefundOrderAction.or]");

			service.refundOrderAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";
		}
		
		// 환불요청(1건)
		else if (url.equals("/RefundAction.or")) {
			System.out.println("[url => RefundAction.or]");

			service.refundAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";
		}
		
		// 구매확정(다건)
		else if (url.equals("/BuyOrderAction.or")) {
			System.out.println("[url => BuyOrderAction.or]");

			service.buyOrderAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";
		}
		
		// 구매확정(1건)
		else if (url.equals("/BuyAction.or")) {
			System.out.println("[url => BuyAction.or]");

			service.buyAction(req, res);
			viewPage = "customer/mypage/order/UpdateOrderAction.jsp";
		}

		// 관리자 컨펌 리스트
		else if (url.equals("/ConfirmList.or")) {
			System.out.println("[url => ConfirmList.or]");

			service.confirmListAction(req, res);
			viewPage = "admin/total/ConfirmList.jsp";
		}

		// 관리자 주문 승인 처리
		else if (url.equals("/ConfirmOrderAction.or")) {
			System.out.println("[url => ConfirmOrderAction.or]");

			service.confirmOrderAction(req, res);
			viewPage = "admin/total/ConfirmAction.jsp";
		}
		// 관리자 환불 승인 처리
		else if (url.equals("/ConfirmRefundAction.or")) {
			System.out.println("[url => ConfirmRefundAction.or]");

			service.confirmRefundAction(req, res);
			viewPage = "admin/total/ConfirmAction.jsp";
		}
		
		// 관리자 결산 목록
		else if (url.equals("/AdminSoldView.or")) {
			System.out.println("[url => AdminSoldView.or]");

			service.adminSoldViewAction(req, res);
			viewPage = "admin/total/AdminSoldView.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res); // 해당 viewPage로 forward
	}
}
