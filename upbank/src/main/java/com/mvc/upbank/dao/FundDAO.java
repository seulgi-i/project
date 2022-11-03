package com.mvc.upbank.dao;


import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.FundDTO;
import com.mvc.upbank.dto.SearchDTO;

public interface FundDAO {

	//신규 입출금계좌 개설
	public int fundAccountInsert(SearchDTO dto);
	
	//계좌의 종류별 조회 (예금, 적금, 입출금, 대출)
	public SearchDTO SearcFundName(String id); 
	
	//펀드 구매
	public int fundBuy (FundDTO dto);
	
	//펀드 판매
	public int fundCnt (Map<String, Object> cnt);
	
	//펀드 잔고 수정
	public int fundBalanceUpdate(Map<String, Object> map);
	
	//펀드 보유내역
	public List<FundDTO> fundMypage (Map<String, Object> map);
	
	//펀드 거래내역
	public List<FundDTO> fundSearch (Map<String, Object> map);
}
