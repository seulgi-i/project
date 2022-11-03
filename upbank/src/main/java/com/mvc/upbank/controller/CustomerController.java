package com.mvc.upbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.upbank.service.AdminSearchServiceImpl;
import com.mvc.upbank.service.CustomerServiceImpl;
import com.mvc.upbank.service.TransferServiceImpl;

@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	CustomerServiceImpl service;
	
	@Autowired
	AdminSearchServiceImpl service2;
	
	@Autowired
	TransferServiceImpl service3;
	
	@RequestMapping("main.do")
	public String main() {
		logger.info("[url => /main.do]");
		
		return "index";
	}
	
	@RequestMapping("join.do")
	public String join() {
		logger.info("[url => /join.do]");
		
		return "chaey/joinInfo";
	}
	
	@RequestMapping("join_terms.do")
	public String join_terms() {
		logger.info("[url => /join_terms.do]");
		
		return "chaey/join_terms";
	}
	
	@RequestMapping("join_whether.do")
	public String join2() {
		logger.info("[url => /join_whether.do]");
		
		return "chaey/join_whether";
	}
	
	// 중복확인 처리
	@RequestMapping("confirmIdAction.do")
	public String confirmIdAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> confirmIdAction.do]");
	   
		service.confirmIdAction(req, model);
		
		return "chaey/confirmIdAction";
	}
	
	// 회원확인 - 계좌비번으로 계좌확인
	@RequestMapping("join_search.do")
	public String join_search(HttpServletRequest req, Model model) {
		logger.info("[url ==> join_search.do]");
	   
		service.join_search(req, model);
		return "chaey/join_search";
	}

	//회원정보입력 테이블로 이동 
	@RequestMapping("join_form.do")
	public String join_form(HttpServletRequest req, Model model) {
		logger.info("[url => /join_form.do]");
		
		service.join_form(req, model);
		return "chaey/join_form";
	}
	
	// 회원가입처리 - 시큐리티(비밀번호 암호화)
	@RequestMapping("joinAction.do")
	public String joinAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> joinAction.do]");
		      
		service.signInAction(req, model);
		
		return "chaey/joinAction";
	}
	
	//시큐리티 - 가입성공시 이메일 인증을 위한 이메일 전송
	//CustomerDAOImpl의 sendEmail(String email, String Key)에서 emailChkAction을 호출
	@RequestMapping("emailChkAction.do")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("[url ==> emailChk.do]");
		      
		service.emailChkAction(req, model);
		
		return "chaey/emailChkAction";
	}
	
	// 회원가입성공
	@RequestMapping("mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {
		logger.info("[url ==> mainSuccess.do]");
		      		
		return "chaey/login";
	}
	

	//-------------------------------------------------
	// 로그인창 이동
	@RequestMapping("login.do")
	public String login() {
		logger.info("[url => /login.do]");
		
		return "chaey/login";
	}
	
	// id 비번 틀릴시
	@RequestMapping("relogin.do")
	public String relogin() {
		logger.info("[url => /relogin.do]");
		
		return "chaey/relogin";
	}
	
	//로그아웃 처리 - 세션 삭제 - header에서 로그아웃만들기
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("[url ==> logout.do]");
		
		req.getSession().invalidate(); //세션삭제
		
		return "index";
	}

	//--------------------------------------------------
	
	
	//마이페이지 추가하고나서 회원 수정 버튼 누르면 수정페이지 -> modifyDetailAction.do로 수정할것
	@RequestMapping("mypage.do")
	public String modifyDetailAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> modifyCustomer.do]");
		
		service.modifyDetailAction(req, model);
		
		return "chaey/modifyDetailAction";
	}
	
	//회원 수정 처리 - 시큐리티(비밀번호 암호화)
	@RequestMapping("modifyCustomerAction.do")
	public String modifyCustomerAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> modifyCustomerAction.do]");
		
		service.modifyCustomerAction(req, model);
		
		return "chaey/modifyCustomerAction";
	}
	
	
	//거래중지계좌 복구 페이지
	@RequestMapping("memberAccountList_stopped.do")
	public String memberAccountStopped(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountStopped.do]");
		
		service2.memberAccountList_stopped(req, model);
		return "chaey/memberAccountStopped";
	}
	
	//거래중지계좌 정상화처리
	@RequestMapping("memberAccountNormal.do")
	public String memberAccountNormal(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountNormal.do]");
		
		service2.adminAccountChange_normal(req, model);
		
		return "chaey/memberAccountNormalAction";
	}
	
	//휴면계좌 해지 페이지
	@RequestMapping("memberAccountCancle.do")
	public String memberAccountCancle(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountCancle.do]");
		
		service2.memberAccountList_state(req, model);
		
		return "chaey/memberAccountCancle";
	}
	
	//휴면계좌 - 잔고정리 및 해지진행 페이지
	@RequestMapping("memberAccountCancleAction.do")
	public String memberAccountCancleAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountCancleAction.do]");
		
		service2.searchAccount(req, model);
		
		return "chaey/memberAccountCancleAction";
	}
	
	//휴면계좌 - 잔고 이체 처리
	@RequestMapping("memAccCancleTrsf.do")
	public String memAccCancleTrsf(HttpServletRequest req, Model model) {
	logger.info("[url => /memAccCancleTrsf.do]");
		service3.transfer2(req, model);
		return "chaey/cancleTransfer";
	}
	
	//휴면계좌 - 계좌 해지진행
	@RequestMapping("memberAccountCancleAction2.do")
	public String memberAccountCancleAction2(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountCancleAction2.do]");
		
		service2.adminAccountChange_cancle(req, model);
		
		return "chaey/memberAccountCancleAction2";
	}
	
	//해지계좌 목록 페이지
	@RequestMapping("memberAccountList_cancled.do")
	public String memberAccountcancled(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberAccountcancled.do]");
		
		service2.memberAccountList_cancled(req, model);
		return "chaey/memberAccountCancled";
	}
		
	//중지/휴면/해지계좌 전체목록
	//은진씨 지우라고하고 SleepDisableAcc.do 로 바꾸기
	@RequestMapping("SleepDisableAcc.do")
	public String sleepDisableAcc(HttpServletRequest req, Model model) {
		logger.info("[url ==> SleepDisableAcc.do]");
		
		service2.sleepDisableAcc(req, model);
		
		return "chaey/sleepDisableAcc";
	}
	
	
}
