package spring.mvc.pj_117_csg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_csg.service.CartService;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	CartService service;
	  

	      
	//-----------------------------------------[장바구니 관리]-----------------------------------------
	        	  
	     //장바구니 목록
		@RequestMapping("cartList.cr")
		public String cartList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("[url => cartList.cr]");

	    	service.cartListAction(req, model);
	    	return "customer/mypage/cart/cartList";
		}
		//상품추가 처리
		@RequestMapping("cartAddAction.cr")
		public String cartAddAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("[url => cartAddAction.cr]");

	    	service.cartAddAction(req, model);
	    	return "customer/mypage/cart/cartAddAction";
		}       
		//상품추가 처리
		@RequestMapping("CartUpdateAction.cr")
		public String CartUpdateAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("[url => CartUpdateAction.cr]");

			service.cartUpdateAction(req, model);
			return "customer/mypage/cart/CartUpdateAction";
		}    
		//상품 개별/선택 삭제
		@RequestMapping("CartDeleteAction.cr")
		public String CartDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("[url => CartDeleteAction.cr]");

			service.cartDeleteAction(req, model);
			return "customer/mypage/cart/CartDeleteAction";
		}
		
		//장바구니 비우기
		@RequestMapping("CartAllDeleteAction.cr")
		public String CartAllDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("[url => CartAllDeleteAction.cr]");

			service.cartAllDeleteAction(req, model);
			return "customer/mypage/cart/CartAllDeleteAction";
		}	    	  



	}

