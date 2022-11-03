package com.mvc.upbank.dao;

import java.util.ArrayList;
import java.util.Map;

import com.mvc.upbank.dto.AutoTransferDTO;
import com.mvc.upbank.dto.TransferDTO;

public interface AutoTransferDAO {
		// 회원 자동이체 신청
		public int insertAutoTransfer(AutoTransferDTO dto); 
		
		// 회원 자동이체 조회
		public ArrayList<AutoTransferDTO> getMyAutoTransfer(String id);
		
		// 회원 자동이체 해지
		public int deleteAutoTransfer(int auto_id);
		
		// 자동이체 오늘날짜에 입금할거있는지 조회
		public ArrayList<AutoTransferDTO> selectByDay(int day);

		// 자동이체 후 최신납부내역 갱신
		public int updateAutoTransfer(int auto_id);
		
		// 자동이체 위해 내계좌에서 잔액조회
		public int selectAccountBalance(String account);

		// 자동이체 납부(transfer 테이블에 이체내역추가)
		public int insertTranferByAuto(TransferDTO dto);
		
		// 자동이체 납부(AutoTransfer_list 테이블에 내역추가)
		public int insertAutoTransferList(Map<String, Object> map);
		
		// 자동이체 실패 -> 자동이체리스트 테이블에 내역추가
		public int failAutoTransferList(int auto_id);
		
		// 자동이체 결과 내계좌에 반영
		public int updateAccountAutoTransfer(Map<String, Object> map);
		
		// 오늘날짜가 자동이체 만기일을 지났을시 자동으로 만기상태로 바꿔주기
		public int exitAutoTransfer();
}
