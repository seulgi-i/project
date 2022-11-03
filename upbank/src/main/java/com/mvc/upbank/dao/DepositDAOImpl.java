package com.mvc.upbank.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.DepositDTO;
import com.mvc.upbank.dto.SearchDTO;

@Repository
public class DepositDAOImpl implements DepositDAO {
	private static final Logger logger = LoggerFactory.getLogger(DepositDAO.class);
	
	
	@Autowired
	SqlSession sqlSession;

	//예금목록
	@Override
	public List<DepositDTO> depositList() {
	
		List<DepositDTO> list = sqlSession.selectList("com.mvc.upbank.dao.DepositDAO.depositList");

		return list;
	}
	
	//상품상세페이지
	@Override
	public DepositDTO depositDetailPage(String y_name) {
		logger.info("DAO - depositDetailPage");
		
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		DepositDTO dto = dao.depositDetailPage(y_name);

		return dto;
	}
	
	//이자상세페이지
	@Override
	public List<DepositDTO> rateDetailPage(String y_name) {
		logger.info("DAO - rateDetailPage");
		
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		List<DepositDTO> list = dao.rateDetailPage(y_name);

		return list;
	}	
	//예금상품추가
	@Override
	public int depositInsert(DepositDTO dto) {
		logger.info("dao - 상품 추가 처리");

		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		int insertCnt = dao.depositInsert(dto);
		return insertCnt;
	}//+이자
	@Override
	public int rateInsert(Map<String, Object> map)  {
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		int insertCnt2 = dao.rateInsert(map);
		return insertCnt2;
	}

	//예금상품수정
	@Override
	public int depositUpdate(DepositDTO dto) {
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.DepositDAO.depositUpdate", dto);

		return updateCnt;
	}
	//이자수정
	@Override
	public int rateUpdate(Map<String, Object> map) {
		int updateCnt2 = sqlSession.update("com.mvc.upbank.dao.DepositDAO.rateUpdate", map);

		return updateCnt2;
	}	
	
	
	//예금상품삭제
	@Override
	public int depositDelete(String y_name) {
		int deleteCnt = sqlSession.delete("com.mvc.upbank.dao.DepositDAO.depositDelete", y_name);

		return deleteCnt;
	}
	
	//이자삭제
	@Override
	public int rateDelete(String y_name) {
		int deleteCnt2 = sqlSession.delete("com.mvc.upbank.dao.DepositDAO.rateDelete", y_name);

		return deleteCnt2;
	}
   //가입계좌생성
	@Override
	public int depositDefaultInsert(SearchDTO dto) {
		logger.info("DepositDAO - DepositDefaultInsert");
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		return dao.depositDefaultInsert(dto);
	}
	
	@Override
	public List<SearchDTO> depositName(String id) {
		logger.info("DepositDAO - DepositName");
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		return dao.depositName(id);
	}

	@Override
	public String depositAccount(Map<String, Object> map) {
		logger.info("DepositDAOImpl - depositAccount");
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		return dao.depositAccount(map);
	}	

	//가입하기
	@Override
	public int depositJoin(DepositDTO dto) {
		
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		int insertCnt = dao.depositJoin(dto);
		return insertCnt;
	}

	@Override
	public int depositBalance(String id) {
		
		DepositDAO dao =  sqlSession.getMapper(DepositDAO.class);
		return dao.depositBalance(id);
	}

	@Override
	public List<DepositDTO> terminateListPage(String id) {
		logger.info("DAO - terminateListPage");
		
		List<DepositDTO> list = sqlSession.selectList("com.mvc.upbank.dao.DepositDAO.terminateListPage", id);

		return list;
	}

	//deposit테이블 해지 업데이트
	@Override
	public int depositStateUpdate(Map<String, Object> map) {
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.DepositDAO.depositStateUpdate", map);

		return updateCnt;
	}
	//이자지급처리
	@Override
	public DepositDTO depositCancle(Map<String, Object> map) {
		DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		DepositDTO dto = dao.depositCancle(map);
		return dto;
	}

	@Override
	public int depositCancleDate(Map<String, Object> map) {
		DepositDAO dao =  sqlSession.getMapper(DepositDAO.class);
		
		return dao.depositCancleDate(map);
	}

	@Override
	public int depositMoneyPlus(Map<String, Object> map) {
		DepositDAO dao =  sqlSession.getMapper(DepositDAO.class);
		int updateCnt = dao.depositMoneyPlus(map);
		return updateCnt;
	}

	@Override
	public int depositMoneyMinus(Map<String, Object> map) {
		DepositDAO dao =  sqlSession.getMapper(DepositDAO.class);
		int updateCnt =dao.depositMoneyMinus(map);
		
		return updateCnt;
	}




}
