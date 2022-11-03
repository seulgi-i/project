package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.CustomerServiceImpl;

@WebServlet("*.do")
public class CustomerController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public CustomerController() {
      super();
   }

   // 1단계. 웹브라우저가 전송한 Http 요청 받음
   protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      action(req, res);
   }

   protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      doGet(req, res);
   }

   public void action(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

      // 한글 안깨지게 처리
      req.setCharacterEncoding("UTF-8");
      String viewPage = "";
      CustomerServiceImpl service = new CustomerServiceImpl();

      // 2단계 요청분석
      // http://localhost/jsp_pj_117/*.do
      	String uri = req.getRequestURI();	// /jsp_pj_117/*.do
		String contextPath = req.getContextPath();	// /jsp_pj_117
		String url = uri.substring(contextPath.length()); // /*.do

		// 첫페이지
		if(url.equals("/*.do") || url.equals("/main.do")) {
			System.out.println("[url => main.do]");
			viewPage = "common/main.jsp";

         // --------------- [회원가입] ----------------
         // 회원가입 화면
      } else if (url.equals("/join.do")) { // http://localhost/jsp_pj_117/join.do
         System.out.println("[url => /join.do]");
         viewPage = "customer/join/join.jsp";

         // id 중복확인 처리
      } else if (url.equals("/confirmIdAction.do")) {
         System.out.println("[url => /confirmIdAction.do]");
         service.confirmIdAction(req, res);

         viewPage = "customer/join/confirmIdAction.jsp";

         // 회원가입 처리
      } else if (url.equals("/joinAction.do")) {
         System.out.println("[url =>/joinAction.do]");

         // 서비스 호출
         service.signInAction(req, res);
         viewPage = "customer/join/joinAction.jsp";

         // 회원가입 성공

      } else if (url.equals("/mainSuccess.do")) {
         System.out.println("[url => /mainSuccess.do]");
         // joinAction
         // response.sendRedirect("/jsp_pj_117/mainSuccess.do?insertCnt="+ insertCnt);
         int cnt = Integer.parseInt(req.getParameter("insertCnt"));
         req.setAttribute("cnt", cnt);

         viewPage = "customer/login/login.jsp";

      // -------------로그인---------------------
      } else if (url.equals("/login.do")) {
         System.out.println("[url => /login.do]");
         viewPage = "customer/login/login.jsp";

      // 로그인 처리
      } else if (url.equals("/loginAction.do")) {
         System.out.println("[url => /loginAction.do]");

         //서비스 호출
         service.loginAction(req, res);
         viewPage = "customer/login/loginAction.jsp";
         
      
      
      //로그아웃 페이지
      } else if(url.equals("/logout.do")) {
         System.out.println("[url => /logout.do]");
         req.getSession().invalidate(); //모든세션 삭제
         viewPage = "common/main.jsp";
      
      
      
      //------------------ [회원탈퇴] ---------------------
       //회원탈퇴 - 인증화면
      } else if(url.equals("/deleteCustomer.do")) {
         System.out.println("[url => /deleteCustomer.do]");
       
         viewPage = "customer/mypage/customerInfo/deleteCustomer.jsp";
         
      //회원탈퇴 - 처리화면     
      }else if(url.equals("/deleteCustomerAction.do")) {
         System.out.println("[url => /deleteCustomerAction.do]");
         
         service.deleteCustomerAction(req, res); 
         viewPage = "customer/mypage/customerInfo/deleteCustomerAction.jsp";
      //-----------------------------------------------   
       
         
       //마이페이지
      }else if(url.equals("/Mypage.do")) {
         System.out.println("[url => /Mypage.do]");
             
         viewPage = "customer/mypage/customerInfo/Mypage.jsp";
            
      // ------------------[회원수정]-----------------
      
      //회원수정 - 인증화면
      }else if (url.equals("/modifyCustomer.do")) {
         System.out.println("[url => /modifyCustomer.do]");
         
         viewPage = "customer/mypage/customerInfo/modifyCustomer.jsp";
      
      //회원수정 - 상세페이지 
      } else if (url.equals("/modifyDetailAcion.do")) {
         System.out.println("[url => /modifyDetailAcion.do]");
         
         service.modifyDetailAction(req, res);
         viewPage = "customer/mypage/customerInfo/modifyDetailAcion.jsp";
         
         
      //회원수정 처리
      } else if (url.equals("/modifyCustomerAction.do")) {
         System.out.println("[url => /modifyCustomerAction.do]");
         
         service.modifyCustomerAction(req, res);
         viewPage = "customer/mypage/customerInfo/modifyCustomerAction.jsp";
      }
      //회원목록
      else if (url.equals("/customerInfo.do")) { 
          System.out.println("[url => /customerInfo.do]");
          
          service.customerListAction(req, res);
          viewPage = "admin/Customer/customerInfo.jsp";
       }
         // url은 변경하지 않고 viewPage로 이동해라(현재화면에 띄우기)
         // RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다. '파견'
         RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
         dispatcher.forward(req, res);// 해당 viewPage로 forward(이동해라)
   }
}