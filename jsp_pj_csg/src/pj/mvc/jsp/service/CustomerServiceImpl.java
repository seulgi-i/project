package pj.mvc.jsp.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import page.Paging;
import pj.mvc.jsp.dao.CustomerDAO;
import pj.mvc.jsp.dao.CustomerDAOImpl;
import pj.mvc.jsp.dao.ProductDAO;
import pj.mvc.jsp.dao.ProductDAOImpl;
import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.dto.ProductDTO;

public class CustomerServiceImpl implements CustomerService {

	// ID중복확인 처리
	@Override
	public void confirmIdAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 중복확인 처리");

		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 회원가입 처리 호출
		int selectCnt = dao.idCheck(strId);

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("id", strId);
		req.setAttribute("selectCnt", selectCnt);

	}

	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 회원가입 처리");

		// DAO 호출
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		// dto생성(바구니로 담아 한번에 옮긴다)
		CustomerDTO dto = new CustomerDTO();

		// join의 input의 name명(input태그명)
		// String strId = req.getParameter("id");
		dto.setId(req.getParameter("id"));
		dto.setPassword(req.getParameter("password"));
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

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 회원가입 처리 호출
		int insertCnt = dao.insertCustomer(dto);

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("insertCnt", insertCnt);

	}

	// 로그인 처리
	@Override
	public void loginAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 회원가입 처리 호출
		int selectCnt = dao.idPasswordChk(strId, strPassword);

		// 로그인 성공
		if (selectCnt == 1) {
			// 로그인 성공시 세션 ID를 설정
			HttpSession session = req.getSession();
			session.setAttribute("customerID", strId);
			// req.getSession().setAttribute("customerID",strId);
		}

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("selectCnt", selectCnt);
	}

	// 회원정보 인증 및 탈퇴처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res) {
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		String strPassword = req.getParameter("password");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 회원가입 처리 호출
		// 5-1단계. 회원탈퇴를 위한 인증처리
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		int deleteCnt = 0;
		// 인증 성공하면 삭제해라
		if (selectCnt == 1) {
			// 5-2단계 회원탈퇴처리
			deleteCnt = dao.deleteCustomer(strId);
			System.out.println("deleteCnt : " + deleteCnt);
		}

		// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("deleteCnt", deleteCnt);

	}

	// 회원정보 인증 및 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 회원정보 인증 및 상세페이지");
		// 3단계. 화면으로부터 입력받은 값을 받는다. 받는 값이 2개 이상이면 DTO에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		String strPassword = req.getParameter("password");

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5.1단계 회원정보 인증
		int selectCnt = dao.idPasswordChk(strId, strPassword);

		CustomerDTO dto = null;
		// 5.2단계 상세페이지
		if (selectCnt == 1) {
			dto = dao.getCustomerDetail(strId);
		}
		// 6단계. jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("dto", dto);
	}

	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 회원정보 수정 처리");

		// 3-1단계. dto 생성
		CustomerDTO dto = new CustomerDTO();

		// 3-2단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		dto.setId((String) req.getSession().getAttribute("customerID"));
		dto.setPassword(req.getParameter("password"));
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

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 회원정보 수정 처리
		int updateCnt = dao.updateCustomer(dto);

		if (updateCnt == 1) {

		}
		// 6단계. jsp로 처리 결과 전달(setAttribute)
		req.setAttribute("updateCnt", updateCnt);
	}

	// 이메일 인증(각자 알아서)
	@Override
	public void emailChkAction(HttpServletRequest req, HttpServletResponse res) {

	}

	//회원목록 리스트
	@Override
	public void customerListAction(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("서비스 => 회원목록");

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5-2단계. 상품목록 조회
		List<CustomerDTO> list = dao.customerList();
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("list", list);
	}

}