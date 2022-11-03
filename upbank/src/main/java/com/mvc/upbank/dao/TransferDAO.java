package com.mvc.upbank.dao;


import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.TransferDTO;

public interface TransferDAO {

	//신규 1건이체 등록
	public int transferInfoInsert (TransferDTO dto);
	
	//신규 1건이체 계좌별조회 위한 insert
	public int transferBalanceSet (Map<String,Object> map);

	//신규 1건이체 계좌별조회 위한 insert
	public int transferChargeInsert (TransferDTO dto);

	//회원 이체 내역 조회
	public List<TransferDTO> transferList(Map<String, Object> map);

}
