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
import pj.mvc.jsp.util.ImageUploadHandler;

@WebServlet("*.cr")
@MultipartConfig(location="D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload",
fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class CartController extends HttpServlet {
	   private static final long serialVersionUID = 1L;
	   private static final String IMG_UPLOAD_DIR="D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload";
	   public CartController() {
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

	      // http://localhost/jsp_pj_117/*.do
	      // http://localhost/jsp_pj_117/join.do
	      String uri = req.getRequestURI(); // /jsp_pj_117/*.do
	      String contextPath = req.getContextPath(); // /jsp_pj_117
	      String url = uri.substring(contextPath.length()); // /*.do

	      CartServiceImpl service = new CartServiceImpl();


	      
	//-----------------------------------------[장바구니 관리]-----------------------------------------
	        	  
	        //장바구니 목록
	       if(url.equals("/cartList.cr")){
	    	  System.out.println("[url => cartList.cr]");
	    	  
	    	  service.cartListAction(req, res);
	    	  viewPage = "customer/mypage/cart/cartList.jsp";
	    	 
	           
	         //상품추가 처리
	       }else if (url.equals("/cartAddAction.cr")) {
	           System.out.println("[url => cartAddAction.cr]");
	           
	           service.cartAddAction(req, res);
	           viewPage ="customer/mypage/cart/cartAddAction.jsp";
	           
	    	 
	    	 //장바구니 수정 처리
	       }else if(url.equals("/CartUpdateAction.cr")){
	    	  System.out.println("[url => cartUpdateAction.cr]");
	    	  
	    	  service.cartUpdateAction(req, res);
	    	  viewPage = "customer/mypage/cart/CartUpdateAction.jsp";
	    	  
	    	  
	    	 //상품 개별/선택 삭제 
	       }else if(url.equals("/CartDeleteAction.cr")){
	    	  System.out.println("[url => CartDeleteAction.cr]");
	    	  
	    	  service.cartDeleteAction(req, res);
	    	  viewPage = "customer/mypage/cart/CartDeleteAction.jsp";
	       
	       
	        //장바구니 비우기
	       }else if(url.equals("/CartAllDeleteAction.cr")){
	    	  System.out.println("[url => CartAllDeleteAction.cr]");
	    	  
	    	  service.cartAllDeleteAction(req, res);
	    	  viewPage = "customer/mypage/cart/CartAllDeleteAction.jsp";
	      }
	       RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		   dispatcher.forward(req, res); // 해당 viewPage로 forward
	   }
	}

