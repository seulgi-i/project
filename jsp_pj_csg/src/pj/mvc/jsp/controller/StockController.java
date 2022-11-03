package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.ProductServiceImpl;
import pj.mvc.jsp.util.ImageUploadHandler;

@WebServlet("*.st")
@MultipartConfig(location = "D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload", fileSizeThreshold = 1024
		* 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String IMG_UPLOAD_DIR = "D:\\Dev117\\workspace\\jsp_pj_117_csg\\WebContent\\resources\\upload";

	public StockController() {
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

		ProductServiceImpl service = new ProductServiceImpl();

//-----------------------------------------[상품관리]-----------------------------------------
		// 상품등록
		if (url.equals("/*.st") || url.equals("/productAdd.st")) {
			System.out.println("[url => productAdd.st]");

			viewPage = "admin/stock/productAdd.jsp";

		} else if (url.equals("/productAddAction.st")) {
			System.out.println("[url => productAddAction.st]");
			String contentType = req.getContentType();
			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				uploader = new ImageUploadHandler();
				uploader.setUploadPath(IMG_UPLOAD_DIR); // img경로
				uploader.imageUpload(req, res);
			}
			service.productAddAction(req, res);
			viewPage = "admin/stock/productAddAction.jsp";
			
			
		// 상품목록
		} else if (url.equals("/productList.st")) {
			System.out.println("[url => productList.st]");
			service.productListAction(res, req);
			viewPage = "admin/stock/productList.jsp";

		// 고객이 보는 상품목록
		} else if (url.equals("/product_flower.st")) {
			System.out.println("[url => product_flower.st]");

			service.productListAction(res, req);
			viewPage = "customer/product/product_flower.jsp";

		// 고객이 누른 상품 상세페이지
		} else if (url.equals("/product_Detail.st")) {
			System.out.println("[url => product_Detail.st]");

			service.productDetailAction(req, res);

			viewPage = "customer/product/product_Detail.jsp";

		// 상품 상세페이지
		} else if (url.equals("/productDetailAction.st")) {
			System.out.println("[url => productDetailAction.st]");

			service.productDetailAction(req, res);
			viewPage = "admin/stock/productDetailAction.jsp";

		// 상품수정 처리 
		} else if (url.equals("/productUpdateAction.st")) {
			System.out.println("[url => productUpdateAction.st]");
			String contentType = req.getContentType();

			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				uploader = new ImageUploadHandler();
				uploader.setUploadPath(IMG_UPLOAD_DIR); // img경로
				uploader.imageUpload(req, res);
			}

			service.productUpdateAction(req, res);
			viewPage = "admin/stock/productUpdateAction.jsp";

		// 상품삭제 
		} else if (url.equals("/productDeleteAction.st")) {
			System.out.println("[url => productDeleteAction.st]");

			service.productDeleteAction(req, res);
			viewPage = "admin/stock/productDeleteAction.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res); // 해당 viewPage로 forward
	}
}
