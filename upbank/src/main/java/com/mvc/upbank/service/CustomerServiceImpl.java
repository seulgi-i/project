package com.mvc.upbank.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.CustomerDAO;
import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.util.EmailChkHandler;


@Service
public class CustomerServiceImpl implements CustomerService {

	
	private static final Logger logger = LoggerFactory.getLogger(CustomerService.class);
	
	@Autowired
	CustomerDAO dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;	//비번 암호화 클래스
	
	//ID중복확인처리
	@Override
	public void confirmIdAction(HttpServletRequest req, Model model) {
		logger.info("서비스 => 중복확인처리");
		
		//3단계. 화면(join.jsp)으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");
			
		// 5단계. 중복 확인 처리.
		int selectCnt = dao.idCheck(strId);
				
		model.addAttribute("id", strId);
		model.addAttribute("selectCnt", selectCnt);
		
	}

	
	//회원가입 처리 + 시큐리티(암호화된 비번추가, 이메일 인증 키 추가, 가입성공시 이메일 검증추가)
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		logger.info("서비스 => 회원가입 처리");
		
		//DAO호출. 3단계. 화면(join.jsp)으로부터 입력받은 값을 받는다.
		//변수로 하나씩 담기엔 너무 번거로우니, dto의 멤버변수로 받자
		CustomerDTO dto = new CustomerDTO();
		dto.setId(req.getParameter("id"));
		
		// 비밀번호 암호화 - 시큐리티
		String password = req.getParameter("password");
		
		//BCryptPasswordEncoder.encode() : 비번 암호화 메서드
		
		String encryptPassword = passwordEncoder.encode(password);
		dto.setPassword(encryptPassword);
		
		dto.setAccount(req.getParameter("account"));
		dto.setName(req.getParameter("name"));
		dto.setAddress(req.getParameter("address"));
		dto.setAddress_detail(req.getParameter("address_detail"));
		
		//hp의경우 필수는 아닌데 sql에는 값이 저장되도록 되어있음(+3칸에 나눠서) 이런경우 널체크를 해줘야함
		//dto.setHp(req.getParameter("hp")); 이렇게 할게아니라,
//		String hp="";
//		String strHp1=req.getParameter("hp1");
//		String strHp2=req.getParameter("hp2");
//		String strHp3=req.getParameter("hp3");
//		
//		if(!strHp1.equals("")&&!strHp2.equals("")&&!strHp3.equals("")) {
//			hp = strHp1+"-"+strHp2+"-"+strHp3;
//		}
//		dto.setPhone("phone");
		dto.setPhone(req.getParameter("phone"));
		
		//email도 hp처럼 두개로 나뉘어있음. 그래서 바로setter를 못씀
		//dto.setEmail(req.getParameter("email"));
		String email="";
		String strEmail1=req.getParameter("email1");
		String strEmail2=req.getParameter("email2");
		email=strEmail1+"@"+strEmail2;
		dto.setEmail(email);
		
		//시큐리티
		String key = EmailChkHandler.getKey();
	    dto.setKey(key);
		
		//날짜형식의 자료는 아래의 과정을 거쳐야 하는듯.
		//String strDate = req.getParameter("birthday");
		//Date date = Date.valueOf(strDate);
		//dto.setBirthday(date) 이 과정을 아래의 한줄로 줄여서ㄱㄱ
		
	    dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		
		//타임스탬프 이용. 입력값이 없으면 dafault를 sysdate로 설정함.
		dto.setReg_date(new Date(System.currentTimeMillis()));	
		
		// 4단계. 싱글톤 방식으로 dao 객체생성  => 스프링은 @Repository쓰면 xml이 알아서해줌
		
		// 5단계. 회원가입처리.
		int insertCnt=dao.insertCustomer(dto);
		
		
		// 시큐리티
		// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
		if(insertCnt == 1) {
			dao.sendEmail(email, key);   // email은 반드시 가입한 구글계정 이메일
			
			//신규회원가입이므로 계좌에 ID등록
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("account", dto.getAccount());
			map.put("id", dto.getId());
			int updateCnt= dao.registerId(map);
			
		}
		
		// 6단계. jsp로 처리 결과 전달(성공/실패)
		model.addAttribute("insertCnt", insertCnt);
	}

	
	//시큐리티 - 이메일 인증 후 권한(enabled) update
	@Override
	public void emailChkAction(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		int selectCnt = dao.selectKey(key);
		
		if(selectCnt==1) {
			int insertCnt = dao.updateGrade(key);
			
			model.addAttribute("insertCnt", insertCnt);
		}
	}
	
	//계좌비번으로 정보 조회
	@Override
	public void join_search(HttpServletRequest req, Model model) {
		logger.info("cust서비스 => join_search");
		
		//계좌 조회를 위한 필수정보 - accountDTO
		SearchDTO dto;
		String ACCOUNT = req.getParameter("account");
		String ACCOUNT_PW = req.getParameter("account_pw");
		
		//가입폼으로 넘기기위한 부가정보 - customerDTO
		CustomerDTO dto2 = new CustomerDTO();
		dto2.setName(req.getParameter("name"));
		dto2.setBirthday(Date.valueOf(req.getParameter("birthday")));
		
		String phone="";
		String strHp1=req.getParameter("phone1");
		String strHp2=req.getParameter("phone2");
		String strHp3=req.getParameter("phone3");
		
		if(!strHp1.equals("")&&!strHp2.equals("")&&!strHp3.equals("")) {
			phone = strHp1+"-"+strHp2+"-"+strHp3;
		}
		dto2.setPhone(phone);
		dto2.setAccount(ACCOUNT);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ACCOUNT", ACCOUNT);
		map.put("ACCOUNT_PW", ACCOUNT_PW);
		map.put("name", dto2.getName());
		
		dto = dao.accountInfobyPw(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("dto2", dto2);
		
	}
	
	// 회원가입폼에 정보 자동기입
	@Override
	public void join_form(HttpServletRequest req, Model model) {
		logger.info("cust서비스 => join_search");
		CustomerDTO dto = new CustomerDTO();
		
		dto.setName(req.getParameter("name"));
		dto.setAccount(req.getParameter("account"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setPhone(req.getParameter("phone"));
		
		
		model.addAttribute("dto", dto);
	}
	
	//회원정보 인증 및 회원 수정 상세페이지
	@Override
   public void modifyDetailAction(HttpServletRequest req, Model model) {
      logger.info("서비스 => 회원정보 인증 및 상세페이지");
      
      //DAO호출. 3단계. 화면(login.jsp)으로부터 입력받은 값을 받는다.
      String strId = (String)req.getSession().getAttribute("customerID");
      
      CustomerDTO dto = dao.getCustomerDetail(strId);
      
      model.addAttribute("dto", dto);
   }
	
	//회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, Model model) {
		logger.info("서비스 => 회원정보 수정 처리");
		
		//DAO호출. 3단계. 화면(modifyDetailAction.jsp)으로부터 입력받은 값을 받는다.
		//변수로 하나씩 담기엔 너무 번거로우니, dto의 멤버변수로 받자
		CustomerDTO dto = new CustomerDTO();
		
		String id = (String)req.getSession().getAttribute("customerID");
		dto.setId(id);
		
		// 비밀번호 암호화 
		String password = req.getParameter("password");
		
		dto.setName(req.getParameter("name"));
		dto.setJob(req.getParameter("job"));
		dto.setAddress(req.getParameter("address"));
		dto.setAddress_detail(req.getParameter("address_detail"));
		
		//hp의경우 필수는 아닌데 sql에는 값이 저장되도록 되어있음(+3칸에 나눠서) 이런경우 널체크를 해줘야함
		//dto.setHp(req.getParameter("hp")); 이렇게 할게아니라,
//		String hp="";
//		String strHp1=req.getParameter("hp1");
//		String strHp2=req.getParameter("hp2");
//		String strHp3=req.getParameter("hp3");
//		
//		if(!strHp1.equals("")&&!strHp2.equals("")&&!strHp3.equals("")) {
//			hp = strHp1+"-"+strHp2+"-"+strHp3;
//		}
//		dto.setPhone("phone");
		dto.setPhone(req.getParameter("phone"));
		
		//email도 hp처럼 두개로 나뉘어있음. 그래서 바로setter를 못씀
		//dto.setEmail(req.getParameter("email"));
		String email="";
		String strEmail1=req.getParameter("email1");
		String strEmail2=req.getParameter("email2");
		email=strEmail1+"@"+strEmail2;
		dto.setEmail(email);
		
		//날짜형식의 자료는 아래의 과정을 거쳐야 하는듯.
		//String strDate = req.getParameter("birthday");
		//Date date = Date.valueOf(strDate);
		//dto.setBirthday(date) 이 과정을 아래의 한줄로 줄여서ㄱㄱ
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		
		// 4단계. 싱글톤 방식으로 dao 객체생성, 다형성적용 > 주소값으로 연결하기
		//CustomerDAO dao = CustomerDAOImpl.getInstance();
		//dao.insertCustomer(dto);	//위에서 값을 저장한 dto클래스를 넘김
		
		if(password=="") {
			// 5단계. 회원업뎃처리.(비번제외)
			int updateCnt=dao.updateCustomer2(dto);
			
			// 6단계. jsp로 처리 결과 전달(성공/실패)
			model.addAttribute("updateCnt", updateCnt);

			
		}else {
			String encryptPassword = passwordEncoder.encode(password);
			
			// 암호화된 비밀번호를 setter로 담는다.
			dto.setPassword(encryptPassword);
			
			// 5단계. 회원가입처리.
			int updateCnt=dao.updateCustomer(dto);
			
			// 6단계. jsp로 처리 결과 전달(성공/실패)
			model.addAttribute("updateCnt", updateCnt);
		}
		
	}
	
	
	
//
//	//회원정보 인증 및 탈퇴처리
//	@Override
//	public void deleteCustomerAction(HttpServletRequest req, Model model) {
//		logger.info("서비스 => 인증 및 탈퇴처리");
//		
//		// 3단계. 화면으로부터 입력받은 값을 받는다.
//	    String strId = (String)req.getSession().getAttribute("customerID");   // 세션ID
//	    
//	    int deleteCnt = dao.deleteCustomer(strId);
//	    logger.info("deleteCnt : " + deleteCnt);
//	    req.setAttribute("deleteCnt", deleteCnt);
//	}
//
//
	
}
