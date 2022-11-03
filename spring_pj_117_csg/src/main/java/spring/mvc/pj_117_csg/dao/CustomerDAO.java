package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_csg.dto.CustomerDTO;

//데이터를 억세스 하는 오브젝트

public interface CustomerDAO {
	
//ID중복확인 처리
	public int idCheck(String strId);
	
	//회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 시큐리티 - 가입성공시 이메일인증을 위한 이메일 전송
	public void sendEmail(String email, String key);
	
	//시큐리티 - 로그인 전 이메일 인증을 해야 한다.
	public int selectKey(String key);
	
	//시큐리티 - 등급변경
	public int updateGrade(String key);
	
	//로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);

	//회원정보 인증 및 탈퇴처리
	public int deleteCustomer(String strId);
	
	//회원정보 인증 및 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	//회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
	//회원목록
	public List<CustomerDTO> customerList();
	
}
