package com.mvc.upbank.dao;

import java.util.Map;

import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.SearchDTO;

public interface CustomerDAO {

	
	//ID중복확인처리
	public int idCheck(String strId);
	
	//회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	//시큐리티 - 가입성공시 이메일인증을 위한 이메일 전송
	public void sendEmail(String email, String key);
	
	//시큐리티 - 로그인 전 이메일 인증을 해야 한다.
	public int selectKey(String key);
	
	//시큐리티 - 등급 변경
	public int updateGrade(String key);
	
	//로그인 처리
	public int idPasswordChk(Map<String, Object> map);

	//계좌,비번 확인
	public SearchDTO accountInfobyPw(Map<String, Object> map);
	
	//Account테이블 ID등록
	public int registerId(Map<String, Object> map);
	
	//회원정보 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	//회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
	//회원정보 수정 처리(비번제외)
	public int updateCustomer2(CustomerDTO dto);
	
//	//회원정보 인증 및 탈퇴처리
//	public int deleteCustomer(String strId);
//	
	
	
	
}
