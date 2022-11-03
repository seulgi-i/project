package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.dto.ProductDTO;

//데이터를 억세스 하는 오브젝트
public interface CustomerDAO {
	
	//ID중복확인 처리
	public int idCheck(String strId);
	
	
	//회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	
	//로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(String strId, String strPassword);
	
	
	//회원정보 인증 및 탈퇴처리
	public int deleteCustomer(String strID);
	
	
	//회원정보 인증 및 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	
	//회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
	
	//회원목록
	public List<CustomerDTO> customerList();
}
