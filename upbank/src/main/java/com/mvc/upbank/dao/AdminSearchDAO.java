package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.AdminSearchDTO;

public interface AdminSearchDAO {

	
	//종합정보 조회
	public AdminSearchDTO adminSearchAccountInfo();
	
	//연도별상태별 계좌생성수
	public List<AdminSearchDTO> cntAccountYearState();
	
	//계좌 1건 조회
	public AdminSearchDTO searchAccount(String account);

	//계좌조회 페이징을 위한 count
	public int cntAdminSearchAccount(Map<String,Object> map);
	
	//계좌조회 페이징을 위한 count
	public int cntAdminSearchAccount_endday(Map<String,Object> map);
	
	//개별 계좌조회
	public List<AdminSearchDTO> adminSearchAccount(Map<String, Object> map);
	
	//개별 계좌조회
	public List<AdminSearchDTO> adminSearchAccount_endday(Map<String, Object> map);
	
	//중지대상 계좌조회
	public List<AdminSearchDTO> adminAccountList_last_1year(Map<String, Object> map);
	public int cntAccountList_last_1year();
	public List<AdminSearchDTO> adminAccountList_last_5year(Map<String, Object> map);
	public int cntAccountList_last_5year();
	
	//상태에 따른 계좌List조회
	public List<AdminSearchDTO> adminAccountList_state(String account_state);
	public int cntAccountList_state(String account_state);
	
	//계좌 상태 변경-일괄중지처리
	public int adminAccountChange_stop();
	
	//계좌 상태 변경-일괄휴면처리
	public int adminAccountChange_sleep();
	
	//본인의 중지/휴면/해지 상태의 계좌조회
	public List<AdminSearchDTO> sleepDisableAcc(String id);
	public List<AdminSearchDTO> memberAccountList_stopped(String id);
	public List<AdminSearchDTO> memberAccountList_state(String id);
	public List<AdminSearchDTO> memberAccountList_cancled(String id);
	
	//계좌 상태 변경-정상화
	public int adminAccountChange_normal(String account);
	
	//일단 보류 계좌 상태 변경-해지 
	public int adminAccountChange_cancle(String account);
	
	
}
