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
import com.mvc.upbank.dto.installmentSavingsDTO;

@Repository
public class installmentSavingsDAOImpl implements installmentSavingsDAO{

	private static final Logger logger = LoggerFactory.getLogger(installmentSavingsDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	//적금목록
	@Override
	public List<installmentSavingsDTO> inssvnList() {
		
		List<installmentSavingsDTO> list = sqlSession.selectList("com.mvc.upbank.dao.installmentSavingsDAO.inssvnList");

		return list;
	}
	//적금상세페이지
	@Override
	public installmentSavingsDTO inssvnDetailPage(String i_name) {
		logger.info("DAO - inssvnDetailPage");
		
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		installmentSavingsDTO dto = dao.inssvnDetailPage(i_name);

		return dto;
	}
	//이자상세페이지
	@Override
	public List<installmentSavingsDTO> rateDetailPage(String i_name) {
		logger.info("DAO - installmentSavingsDTO");
		
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		List<installmentSavingsDTO> list = dao.rateDetailPage(i_name);

		return list;
	}	

	//적금추가
	@Override
	public int inssvnInsert(installmentSavingsDTO dto) {
		logger.info("dao - 상품 추가 처리");

		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		int insertCnt = dao.inssvnInsert(dto);
		return insertCnt;
	}
	@Override
	public int rateInsert(Map<String, Object> map)  {
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		int insertCnt2 = dao.rateInsert(map);
		return insertCnt2;
	}
	//적금수정
	@Override
	public int inssvnUpdate(installmentSavingsDTO dto) {
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.installmentSavingsDAO.inssvnUpdate", dto);

		return updateCnt;
	}
	//이자수정
	@Override
	public int rateUpdate(Map<String, Object> map) {
		int updateCnt2 = sqlSession.update("com.mvc.upbank.dao.installmentSavingsDAO.rateUpdate", map);

		return updateCnt2;
	}	
	
	//적금삭제
	@Override
	public int inssvnDelete(String i_name) { 
		int deleteCnt = sqlSession.delete("com.mvc.upbank.dao.installmentSavingsDAO.inssvnDelete", i_name);

		return deleteCnt;
	}	
	//이자삭제
	@Override
	public int rateDelete(String i_name) {
		int deleteCnt2 = sqlSession.delete("com.mvc.upbank.dao.installmentSavingsDAO.rateDelete", i_name);

		return deleteCnt2;
	}
	@Override
	public int inssvnDefaultInsert(SearchDTO dto) {
		logger.info("적금DAO - inssvnDefaultInsert");
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		return dao.inssvnDefaultInsert(dto);
	}
	@Override
	public List<SearchDTO> inssvnName(String id) {
		logger.info("적금dao - inssvnName");
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		return dao.inssvnName(id);
	}

	@Override
	public int inssvnJoin(installmentSavingsDTO dto) {
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		int insertCnt = dao.inssvnJoin(dto);
		return insertCnt;
	}
	//적금계좌
	@Override
	public String inssvnAccount(Map<String, Object> map) {
		logger.info("installmentSavingsDAO - installmentSavingsDAO");
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		return dao.inssvnAccount(map);
	}
	@Override
	public int inssvnBalance(String id) {
		installmentSavingsDAO dao =  sqlSession.getMapper(installmentSavingsDAO.class);
		return dao.inssvnBalance(id);
	}
	@Override
	public int inssvnStateUpdate(Map<String, Object> map) {
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.installmentSavingsDAO.inssvnStateUpdate", map);

		return updateCnt;
	}
	@Override
	public installmentSavingsDTO inssvnCancle(Map<String, Object> map) {
		installmentSavingsDAO dao = sqlSession.getMapper(installmentSavingsDAO.class);
		installmentSavingsDTO dto = dao.inssvnCancle(map);
		return dto;
	}
	@Override
	public int inssvnCancleDate(Map<String, Object> map) {
		installmentSavingsDAO dao =  sqlSession.getMapper(installmentSavingsDAO.class);
		
		return dao.inssvnCancleDate(map);
	}
	@Override
	public installmentSavingsDTO selectMyinssvn(Map<String, Object> map) {
		installmentSavingsDAO dao =  sqlSession.getMapper(installmentSavingsDAO.class);
			installmentSavingsDTO dto =dao.selectMyinssvn(map);
			return dto;
		}
}
