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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.pj_117_csg.service.CustomerService;
import spring.mvc.pj_117_csg.service.ProductService;

@Controller
public class StockController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	ProductService service;

	@Autowired
	CustomerService service2;
//-----------------------------------------[상품관리]-----------------------------------------
	// 상품 목록
	@RequestMapping("productList.st")
	public String productList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => productList.st]");

		service.productListAction(req, model);
		return "admin/stock/productList";
	}

	// 상품 등록
	@RequestMapping("productAdd.st")
	public String productAdd() {
		logger.info("[url => productAdd.st]");
		return "admin/stock/productAdd";
	}

	// 상품 등록 처리
	@RequestMapping("productAddAction.st")
	public String productAddAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => productAddAction.st]");

		service.productAddAction(req, model);
		return "admin/stock/productAddAction";
	}
	

	// 상품 상세페이지
	@RequestMapping("productDetailAction.st")
	public String productDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => productDetailAction.st]");

		service.productDetailAction(req, model);
		return "admin/stock/productDetailAction";
	}

	// 상품 수정 처리
	@RequestMapping("productUpdateAction.st")
	public String productUpdateAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => productUpdateAction.st]");

		service.productUpdateAction(req, model);
		return "admin/stock/productUpdateAction";
	}

	// 상품 삭제 처리
	@RequestMapping("productDeleteAction.st")
	public String productDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => productDeleteAction.st]");

		service.productDeleteAction(req, model);
		return "admin/stock/productDeleteAction";
	}
	//회원목록
	@RequestMapping("customerInfo.st")
	public String customerInfo(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => customerInfo.do]");

		service2.customerListAction(req, model);
		return "admin/Customer/customerInfo";
	}	

	
}
