package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.DepositDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.installmentSavingsDTO;


public interface installmentSavingsDAO {

	//적금목록
	public List<installmentSavingsDTO> inssvnList();
	
	//관리자
	//적금상세페이지
	public installmentSavingsDTO inssvnDetailPage(String i_name);
	
	//이자상세페이지
	public List<installmentSavingsDTO> rateDetailPage(String i_name);
	
	//적금상품추가
	public int inssvnInsert(installmentSavingsDTO dto);

	//적금이자
	public int rateInsert(Map<String, Object> map);	
	
	//적금상품수정
	public int inssvnUpdate(installmentSavingsDTO dto);
	public int rateUpdate(Map<String, Object> map);
	
	//적금상품삭제
	public int inssvnDelete(String i_name);
	public int rateDelete(String i_name);
	
	
	//// 고객 ////
	// step 1) 예금계좌추가
	public int inssvnDefaultInsert (SearchDTO dto);
	// step 2) 예금가입
	public List<SearchDTO> inssvnName (String id);
	// 2-2) 계좌체크
	public String inssvnAccount (Map<String, Object> map);
	// 2-3) 입출금통장 잔액 체크
	public int inssvnBalance(String id);
	// step 3) 가입
	public int inssvnJoin(installmentSavingsDTO dto);
	
	
	//해지
	public int inssvnStateUpdate(Map<String, Object> map);
	//1-2 select 실행
	public installmentSavingsDTO inssvnCancle(Map<String, Object> map);
	//1-3 가입일-현재 비교
	public int inssvnCancleDate(Map<String, Object> map);
	
	
	//자동이체 등록하기
		//1 가입한 상품 조회 (가입정보 페이지 불러오기)
		public installmentSavingsDTO selectMyinssvn(Map<String, Object> map);
	
}
