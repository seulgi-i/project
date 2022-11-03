package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.AdminSearchDTO;

@Repository
public class AdminSearchDAOImpl implements AdminSearchDAO{
	private static final Logger logger = LoggerFactory.getLogger(AdminSearchDAO.class);
	
	@Autowired
	SqlSession sqlSession;	
	
	//종합정보 조회
	@Override
	public AdminSearchDTO adminSearchAccountInfo() {
		logger.info("DAO-adminSearchAccountInfo");
		AdminSearchDTO dto=sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.adminSearchAccountInfo");
		
		return dto;
	}
	
	//연도별상태별 계좌생성수
	@Override
	public List<AdminSearchDTO> cntAccountYearState() {
		System.out.println("DAO-cntAccountYearState");
		List<AdminSearchDTO> list=sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.cntAccountYearState");
		
		return list;
	}
	
	//계좌 1건 조회
	@Override
	public AdminSearchDTO searchAccount(String account) {
		logger.info("DAO-searchAccount");
		AdminSearchDTO dto=sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.searchAccount", account);
		
		return dto;
	}
	
	//계좌조회 페이징을 위한 count1
	@Override
	public int cntAdminSearchAccount(Map<String,Object> map) {
		logger.info("DAO-cntAdminSearchAccount");
		
		int cnt=sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.cntAdminSearchAccount", map);
		return cnt;
	}
	
	//계좌조회 페이징을 위한 count2
	@Override
	public int cntAdminSearchAccount_endday(Map<String,Object> map) {
		logger.info("DAO-cntAdminSearchAccount_endday");
		
		int cnt=sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.cntAdminSearchAccount_endday", map);
		return cnt;
	}
		
	//개별 계좌조회1
	@Override
	public List<AdminSearchDTO> adminSearchAccount(Map<String, Object> map){
		logger.info("DAO-adminSearchAccount");
		
		List<AdminSearchDTO> list = sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.adminSearchAccount", map);
		return list;
	}
		
	//개별 계좌조회2
	@Override
	public List<AdminSearchDTO> adminSearchAccount_endday(Map<String, Object> map){
		logger.info("DAO-adminSearchAccount_endday");
		
		List<AdminSearchDTO> list = sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.adminSearchAccount_endday", map);
		return list;
	}
	
	//계좌조회 - 1년이상 미거래&정상
	@Override
	public List<AdminSearchDTO> adminAccountList_last_1year(Map<String, Object> map) {
		logger.info("DAO-adminAccountList_last_1year");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.adminAccountList_last_1year",map);
		return list;
	}
	//CNT 1년이상 미거래&정상
	@Override
	public int cntAccountList_last_1year() {
		logger.info("DAO-cntAccountList_last_1year");
		
		int result =sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.cntAccountList_last_1year");
		return result;
	}
	
	//계좌조회 - 5년이상 미거래&거래중지
	@Override
	public List<AdminSearchDTO> adminAccountList_last_5year(Map<String, Object> map) {
		logger.info("DAO-adminAccountList_last_5year");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.adminAccountList_last_5year", map);
		return list;
	}
	//CNT 5년이상 미거래&정상
	@Override
	public int cntAccountList_last_5year() {
		logger.info("DAO-cntAccountList_last_5year");
		
		int result =sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.cntAccountList_last_5year");
		return result;
	}
	
	//상태에 따른 계좌List 조회
	@Override
	public List<AdminSearchDTO> adminAccountList_state(String account_state) {
		logger.info("DAO-adminAccountList_state");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.adminAccountList_state", account_state);
		return list;
	}
	//CNT 상태에 따른 갯수
	@Override
	public int cntAccountList_state(String account_state) {
		logger.info("DAO-cntAccountList_state");
		
		int result =sqlSession.selectOne("com.mvc.upbank.dao.AdminSearchDAO.cntAccountList_state", account_state);
		return result;
	}

	//계좌 상태 변경-일괄중지처리
	@Override
	public int adminAccountChange_stop() {
		logger.info("DAO-adminAccountChange_stop");
		
		int result=sqlSession.update("com.mvc.upbank.dao.AdminSearchDAO.adminAccountChange_stop");
		return result;
	}
	
	//계좌 상태 변경-일괄휴면처리
	@Override
	public int adminAccountChange_sleep() {
		logger.info("DAO-adminAccountChange_sleep");
		
		int result=sqlSession.update("com.mvc.upbank.dao.AdminSearchDAO.adminAccountChange_sleep");
		return result;
	}
	
	
	//본인의 거래중지/휴면/해지상태계좌 조회
	@Override
	public List<AdminSearchDTO> sleepDisableAcc(String id) {
		logger.info("DAO-sleepDisableAcc");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.sleepDisableAcc", id);
		return list;
	}
	//본인의 거래중지상태 계좌조회
	@Override
	public List<AdminSearchDTO> memberAccountList_stopped(String id) {
		logger.info("DAO-memberAccountList_stopped");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.memberAccountList_stopped", id);
		return list;
	}
	//본인의 휴면상태 계좌조회
	@Override
	public List<AdminSearchDTO> memberAccountList_state(String id) {
		logger.info("DAO-memberAccountList_state");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.memberAccountList_state", id);
		return list;
	}
	//본인의 해지상태 계좌조회
	@Override
	public List<AdminSearchDTO> memberAccountList_cancled(String id) {
		logger.info("DAO-memberAccountList_cancled");
		
		List<AdminSearchDTO> list =sqlSession.selectList("com.mvc.upbank.dao.AdminSearchDAO.memberAccountList_cancled", id);
		return list;
	}
	
	//계좌 상태 변경-정상화
	@Override
	public int adminAccountChange_normal(String account) {
		logger.info("DAO-adminAccountChange_normal");
		
		int result=sqlSession.update("com.mvc.upbank.dao.AdminSearchDAO.adminAccountChange_normal", account);
		return result;
	}
	
	//계좌 상태 변경-해지 일단보류
	@Override
	public int adminAccountChange_cancle(String account) {
		logger.info("DAO-adminAccountChange_cancle");
		
		int result=sqlSession.update("com.mvc.upbank.dao.AdminSearchDAO.adminAccountChange_cancle", account);
		return result;
	}
	
}
