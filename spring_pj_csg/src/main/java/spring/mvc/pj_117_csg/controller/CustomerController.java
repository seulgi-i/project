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

import spring.mvc.pj_117_csg.service.BoardServiceImpl;
import spring.mvc.pj_117_csg.service.CustomerServiceImpl;
import spring.mvc.pj_117_csg.service.ProductServiceImpl;

@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	CustomerServiceImpl service;

	@Autowired
	ProductServiceImpl service2;

	@Autowired
	BoardServiceImpl service3;

	// 첫 페이지
	@RequestMapping("main.do")
	public String main() {
		logger.info("[url => main.do]");

		return "common/main";
	}

	// -------------- [회원 가입] -------------
	@RequestMapping("join.do")
	public String join() {
		logger.info("[url => join.do]");

		return "customer/join/join";
	}

	// 아이디 중복 확인
	@RequestMapping("confirmIdAction.do")
	public String confirmIdAction(HttpServletRequest req, Model model) {
		logger.info("[url => confirmIdAction.do]");

		service.confirmIdAction(req, model);
		return "customer/join/confirmIdAction";
	}

	// 회원 가입 처리 - 시큐리티 (비밀번호 암호화)
	@RequestMapping("joinAction.do")
	public String joinAction(HttpServletRequest req, Model model) {
		logger.info("[url => joinAction.do]");

		service.signInAction(req, model);
		return "customer/join/joinAction";
	}

	// 시큐리티 - 가입 성공시 이메일 인증을 위해 이메일 인증 후 enable 권한을 1로 update
	// CustomerDAOImpl의 sendEmail(String email, String key)에서 호출
	@RequestMapping("emailChkAction.do")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("[url => emailChkAction.do]");

		service.emailChkAction(req, model);
		return "customer/join/emailChkAction";
	}

	// 회원 가입 성공
	@RequestMapping("mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {
		logger.info("[url => mainSuccess.do]");

		int cnt = Integer.parseInt(req.getParameter("insertCnt"));
		model.addAttribute("selectCnt", cnt);
		return "customer/login/login";
	}

	// -------------- [로그인] -------------
	@RequestMapping("login.do")
	public String login() {
		logger.info("[url => login.do]");

		return "customer/login/login";
	}

	// 로그인 처리
	// loginAction.do => 시큐리티에서 처리하므로 구현 불필요, login.jsp => <form
	// action="${path}/loginAction.do">
	// UserAuthenticationService에서 처리(성공/실패/거부)하므로

//	// 로그인 성공
//	@RequestMapping("loginAction.do")
//	public String loginAction(HttpServletRequest req, Model model) {
//		logger.info("[url => loginAction.do]");
//		
//		service.loginAction(req, model);
//		return "customer/login/loginAction";
//	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("[url => logout.do]");

		req.getSession().invalidate();
		return "common/main";
	}

	
    //마이페이지
	@RequestMapping("Mypage.do")
	public String Mypage(HttpServletRequest req, Model model) {
		logger.info("[url => logout.do]");

		return "customer/mypage/customerInfo/Mypage";
	}	
	
	
	// ---------------- [회원 수정] ----------------
//	// 회원 수정 - 인증화면		: 주석 및 jsp 삭제
//	@RequestMapping("modifyCustomer.do")
//	public String modifyCustomer() {
//		logger.info("[url => modifyCustomer.do]");
//		
//		return "customer/mypage/customerInfo/modifyCustomer";
//	}

	// 회원 수정 - 상세 페이지
	@RequestMapping("modifyDetailAction.do")
	public String modifyDetailAction(HttpServletRequest req, Model model) {
		logger.info("[url => modifyDetailAction.do]");

		service.modifyDetailAction(req, model);
		return "customer/mypage/customerInfo/modifyDetailAction";
	}

	// 회원 수정 처리 - 시큐리티(비밀번호 암호화)
	@RequestMapping("modifyCustomerAction.do")
	public String modifyCustomerAction(HttpServletRequest req, Model model) {
		logger.info("[url => modifyCustomerAction.do]");

		service.modifyCustomerAction(req, model);
		return "customer/mypage/customerInfo/modifyCustomerAction";
	}

	// ---------------- [회원 탈퇴] ----------------
//	// 회원 탈퇴 - 인증 화면
//	@RequestMapping("deleteCustomer.do")
//	public String deleteCustomer() {
//		logger.info("[url => logout.do]");
//		
//		return "customer/mypage/customerInfo/deleteCustomer";
//	}
//	
	// 회원 탈퇴 - 처리 화면
	@RequestMapping("deleteCustomerAction.do")
	public String deleteCustomerAction(HttpServletRequest req, Model model) {
		logger.info("[url => deleteCustomerAction.do]");

		service.deleteCustomerAction(req, model);
		return "customer/mypage/customerInfo/deleteCustomerAction";
	}

	// 고객이 보는 상품목록
	@RequestMapping("product_flower.do")
	public String product_flower(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => product_flower.do]");

		service2.productListAction(req, model);
		return "customer/product/product_flower";
	}

	// 고객이 보는 상품 상세페이지
	@RequestMapping("product_Detail.do")
	public String product_Detail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => product_Detail.do]");

		service2.productDetailAction(req, model);
		return "customer/product/product_Detail";
	}

	// 고객이 보는 공지 게시판
	@RequestMapping("Customerboard.do")
	public String Customerboard(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => Customerboard.do]");

		service3.boardListAction(req, model);
		return "customer/board/Customerboard";
	}

	// 고객이 보는 상세페이지
	@RequestMapping("BoardDetailAction.do")
	public String BoardDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => BoardDetailAction.do]");

		service3.boardDetailAction(req, model);
		return "customer/board/BoardDetailAction";
	}

	
	

}
