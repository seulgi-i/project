package spring.mvc.pj_117_csg.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_117_csg.dao.CustomerDAO;
import spring.mvc.pj_117_csg.dto.CustomerDTO;
import util.EmailChkHandler;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	CustomerDAO dao;
	
	 @Autowired
	   BCryptPasswordEncoder passwordEncoder;   // 비밀번호 암호화 클래스
	    
	// 회원가입 처리  - 암호화된 비밀번호 추가, 이메일인증 키, 가입성공시 이미엘 검증 추가 ===>매우~중용~
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 회원가입 처리");

		// 3단계. 화면으로부터 입력받은 값을 받는다.
		// dto생성(바구니로 담아 한번에 옮긴다)
		CustomerDTO dto = new CustomerDTO();

		// join의 input의 name명(input태그명)
		// String strId = req.getParameter("id");
		dto.setId(req.getParameter("id"));
	    // 비밀번호 암호화 - 시큐리티
	      String password = req.getParameter("password");
	      System.out.println("암호화 전의 비밀번호 : " + password);
	      
	      // BCryptPasswordEncoder.encode() : 비밀번호 암호화 메서드
	      String encryptPassword = passwordEncoder.encode(password);
	      System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
	      dto.setPassword(encryptPassword);	//dto.setPassword(암호화된 비밀번호)
		
		
		dto.setName(req.getParameter("name"));
		// String strDate = req.getParameter("birthday");
		// Date date = Date.valueOf(strDate);
		// dto.setBirthday(date);
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));

		dto.setAddress(req.getParameter("address"));
		// hp은 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재할때만 처리
		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		if (!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		dto.setHp(hp);

		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		dto.setEmail(email);

		// regDate는 입력값이 없으면 default를 sysdate로 설정했음. 아래문장은 직접 값을 설정하는 방법
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));

		// 비스니스 로직 : 4,5
		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		// CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		 // 시큐리티
	      String key = EmailChkHandler.getKey();
	      dto.setKey(key);
	      
		// 5단계. 회원가입 처리 호출
		int insertCnt = dao.insertCustomer(dto);
		System.out.println("서비스 insert : " + insertCnt);
		

	      
		// 시큐리티 - 가입성공시 이메일 검증
		if(insertCnt == 1 ) {
			 dao.sendEmail(email, key);   // email은 반드시 가입한 네이버계정 이메일  
		}
		
		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		// 원래 req.setAttribute("insertCnt", insertCnt); 였는데 이젠 model이 대신 함.
		model.addAttribute("insertCnt", insertCnt);
	}

	   // 이메일 인증 - 시큐리티
		@Override
		public void emailChkAction(HttpServletRequest req, Model model) {
			String key = req.getParameter("key");
			int selectCnt = dao.selectKey(key);
			
			if(selectCnt == 1) {
				int insertCnt = dao.updateGrade(key);
				model.addAttribute("insertCnt", insertCnt);
			}
		} 
	

	// ID중복확인 처리
	@Override
	public void confirmIdAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 중복확인 처리");

		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		// -> 마이바티스로 바뀌었음. 4단계는 이제 지워야함.

		// 5단계. 회원가입 처리 호출
		int selectCnt = dao.idCheck(strId);

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		model.addAttribute("id", strId);
		model.addAttribute("selectCnt", selectCnt);

	}

	// 로그인 처리
	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용

		// 5단계. 회원가입 처리 호출
		// int selectCnt = dao.idPasswordChk(strId, strPassword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		int selectCnt = dao.idPasswordChk(map);

		// 로그인 성공
		if (selectCnt == 1) {
			// 로그인 성공시 세션 ID를 설정
			HttpSession session = req.getSession();
			session.setAttribute("customerID", strId);
			// req.getSession().setAttribute("customerID",strId);
		}

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		model.addAttribute("selectCnt", selectCnt);
	}

	// 회원정보 인증 및 탈퇴처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		
		int deleteCnt = dao.deleteCustomer(strId);
		String strPassword = req.getParameter("password");
		req.setAttribute("deleteCnt", deleteCnt);

		// 5단계. 회원가입 처리 호출
		// 5-1단계. 회원탈퇴를 위한 인증처리
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		int selectCnt = dao.idPasswordChk(map);
//		
//		int deleteCnt = 0;
//		// 인증 성공하면 삭제해라
//		if (selectCnt == 1) {
//			// 5-2단계 회원탈퇴처리
//			deleteCnt = dao.deleteCustomer(strId);
//			System.out.println("deleteCnt : " + deleteCnt);
//		}
//
//		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
//		model.addAttribute("selectCnt", selectCnt);
//		model.addAttribute("deleteCnt", deleteCnt);

	}

   // 회원정보 인증 및 상세페이지
   @Override
   public void modifyDetailAction(HttpServletRequest req, Model model) {
      System.out.println("서비스 => 회원정보 인증 및 상세페이지");
      
      // 3단계. 화면으로부터 입력받은 값을 받는다.
      String strId = (String) req.getSession().getAttribute("customerID");

      CustomerDTO dto = dao.getCustomerDetail(strId);
      // 6단계. jsp로 처리 결과 전달(setAttribute) 
      model.addAttribute("dto", dto);
      
  }

   // 회원정보 수정 처리
   @Override
   public void modifyCustomerAction(HttpServletRequest req, Model model) {
      System.out.println("서비스 => 회원정보 수정 처리");
      // 3-1단계. dto 생성
      CustomerDTO dto = new CustomerDTO();
      // 3-2단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
      dto.setId((String) req.getSession().getAttribute("customerID"));
      dto.setPassword(req.getParameter("password"));
      
      // 비밀번호 암호화 
      String password = req.getParameter("password");
      System.out.println("암호화 전의 비밀번호 : " + password);
      
      String encryptPassword = passwordEncoder.encode(password);
      System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
      
      // 암호화된 비밀번호를 setter로 담는다.
      dto.setPassword(encryptPassword);
      dto.setName(req.getParameter("name"));
      dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
      dto.setAddress(req.getParameter("address"));
      
      // hp은 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재할때만 처리
      String hp = "";
      String strHp1 = req.getParameter("hp1");
      String strHp2 = req.getParameter("hp2");
      String strHp3 = req.getParameter("hp3");
      if (!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
         hp = strHp1 + "-" + strHp2 + "-" + strHp3;
      }
      dto.setHp(hp);

      String email = "";
      String strEmail1 = req.getParameter("email1");
      String strEmail2 = req.getParameter("email2");
      email = strEmail1 + "@" + strEmail2;
      dto.setEmail(email);
      dto.setRegDate(new Timestamp(System.currentTimeMillis()));


      // 5단계. 회원정보 수정 처리
      int updateCnt = dao.updateCustomer(dto);

      if (updateCnt == 1) {
      
      }
      // 6단계. jsp로 처리 결과 전달(setAttribute)
      model.addAttribute("updateCnt", updateCnt);
   }
   
   //고객목록
	@Override
	public void customerListAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 회원목록");

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		// CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5-2단계. 상품목록 조회
		List<CustomerDTO> list = dao.customerList();

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("list", list);
	}


}