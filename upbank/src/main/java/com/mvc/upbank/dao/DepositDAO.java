package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.DepositDTO;
import com.mvc.upbank.dto.SearchDTO;

public interface DepositDAO {
	

	//예금목록
	public List<DepositDTO> depositList();

	
	
	//// 관리자 ////
	//예금상세페이지
	public DepositDTO depositDetailPage(String y_name);
	
	//이자상세페이지
	public List<DepositDTO> rateDetailPage(String y_name);
	
	//예금상품추가
	public int depositInsert(DepositDTO dto);
	
	//예금이자
	public int rateInsert(Map<String, Object> map);
	
	//예금상품수정
	public int depositUpdate(DepositDTO dto);
	public int rateUpdate(Map<String, Object> map);
	
	//예금상품삭제
	public int depositDelete(String y_name);
	public int rateDelete(String y_name);

	
	
	//// 고객 ////
	
	// step 1) 예금계좌추가
	public int depositDefaultInsert (SearchDTO dto);
	// step 2) 예금가입
		// 2-1) 상품이름 체크
		public List<SearchDTO> depositName (String id);
		// 2-2) 계좌체크
		public String depositAccount(Map<String, Object> map);
		// 2-3) 입출금통장 잔액 체크
		public int depositBalance(String id);
	
	// step 3) 가입
	public int depositJoin(DepositDTO dto);

	
	//해지하기
	public List<DepositDTO> terminateListPage (String id); 

	//만기전 해지처리
	//1-1 depoist 업데이트
	public int depositStateUpdate(Map<String, Object> map);
	//1-2 select 실행
	public DepositDTO depositCancle(Map<String, Object> map);
	//1-3 가입일-현재 비교
	public int depositCancleDate(Map<String, Object> map);
	//1-4 출금통장에 이자+원금 넣기
	public int depositMoneyPlus(Map<String, Object> map);
	//1-5 출금통장 상태 바꿔주기
	public int depositMoneyMinus(Map<String, Object> map);

	
}
