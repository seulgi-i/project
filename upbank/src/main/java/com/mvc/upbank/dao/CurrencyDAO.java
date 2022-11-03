package com.mvc.upbank.dao;


import java.util.List;

import com.mvc.upbank.dto.CurExchangeDTO;
import com.mvc.upbank.dto.CurrencyDTO;

public interface CurrencyDAO {

	//환율정보 SQL 입력
	public int CurrencyInsert(CurrencyDTO dto);
	
	//환율정보 SQL 조회
	public CurrencyDTO CurrencySelect(String CUR_DATE);

	//환율정보 SQL 등록여부 조회
	public int CurrencySelectDate(String CUR_DATE);
	
	//그날의 환율 가져오기
	public double CurrencyCalc(String CUR_UNIT);
	
	//환전신청정보 insert
	public int CurrencyExcInsert(CurExchangeDTO dto);
	
	//환전신청정보 select
	public List<CurExchangeDTO> CurrencyExchangeSearch(String usercp);
	
	//환전정보 SQL 등록여부 조회
	public int CurrencyExcSearchCnt(String usercp);
	
	//관리자 : 환전수령여부 업데이트
	public int CurrencyExchangeAdmin(int num);
	
	
}
