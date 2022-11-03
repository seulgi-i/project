package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.LoanJoinDTO;
import com.mvc.upbank.dto.LoanProductDTO;
import com.mvc.upbank.dto.LoanProductRateDTO;
import com.mvc.upbank.dto.TransferDTO;

public interface LoanDAO {
	// 사용자 ----------------------------------
	// 대출 상품 갯수 구하기
	public int productCnt();
	
	// 대출 상품 리스트
	public List<LoanProductDTO> productList(Map<String, Object> map);
	
	// 대출 상품 상세 조회
	public LoanProductDTO productDetail(int loan_num);
	
	// 대출 신청 처리
	public int loanJoin(LoanJoinDTO dto);
	
	// 직전 대출 신청 넘버 가져오기
	public int getJoinNum(String id);

	// 대출 신청 갯수 구하기
	public int getJoinCnt(String id);
	
	// 대출 신청 목록 조회
	public List<LoanJoinDTO> joinList(Map<String, Object> map);
	
	// 대출 신청 상세 조회
	public LoanJoinDTO joinDetail(int join_num);
	
	// 사용자 대출 계좌 갯수 구하기
	public int onesAccCnt(String id);
	
	// 사용자 대출 계좌 목록 조회
	public List<LoanAccountDTO> onesAccList(Map<String, Object> map);
	
	// 사용자 대출 계좌 상세 조회
	public LoanAccountDTO accDetail(String account);
	
	// 사용자 대출 계좌 이체 내역 조회
	public List<TransferDTO> transList(String account);
	
	// 사용자 대출 계좌 중도 상환 처리
	public int loanTerminate(LoanAccountDTO dto);
	
	// 관리자 ----------------------------------
	// 대출 상품 등록
	public int productInsert(LoanProductDTO dto);
	
	// - 대출 신청
	// 대출 신청 갯수 구하기
	public int getAllJoinCnt();
	
	// 대출 신청 목록 조회
	public List<LoanJoinDTO> AllJoinList(Map<String, Object> map);
	
	// 대출 승인/불가 업데이트 처리
	public int joinConfirm(Map<String, Object> map);

	// - 대출 계좌 개설
	// 신규 계좌 개설
	public int accInsert(Map<String, Object> map);
	
	// 개설한 계좌 번호 받아오기
	public String getaccNum();
	
	// 대출 계좌 개설
	public int loanAccInsert(LoanAccountDTO dto);
	
	// 대출 상품 금리 가져오기
	public LoanProductRateDTO getLoanRate(int loan_rate);
	// ---------------------------------------
	// 사용자 정보 조회
	public CustomerDTO getCustomerInfo(String strId);
	
}
