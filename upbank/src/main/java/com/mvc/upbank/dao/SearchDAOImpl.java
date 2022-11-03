package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(SearchDAO.class);
	
	@Autowired
	SqlSession sqlSession;

	@Override
	//해당 유저의 모든 계좌 조회
	public List<SearchDTO> SearchEveryAcc(String id) {
		logger.info("SearchDAOImpl - SearchEveryAcc");
		
		List<SearchDTO> list = sqlSession.selectList("com.mvc.upbank.dao.SearchDAO.SearchEveryAcc", id);

		return list;
	}

	//신규 입출금계좌 개설
	@Override
	public int AccDefaultInsert(SearchDTO dto) {
		logger.info("SearchDAOImpl - AccDefaultInsert");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.AccDefaultInsert(dto);
	}
	
	//예금주명 조회
	@Override
	public String SearchAccName(String id) {
		logger.info("SearchDAOImpl - SearchAccName");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchAccName(id);
	}

	//신규입출금계좌 개설성공여부
	@Override
	public int AccDefaultInsertChk(Map<String, Object> map) {
		logger.info("SearchDAOImpl - AccDefaultInsertChk");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.AccDefaultInsertChk(map);
	}

	//계좌의 종류별 조회 (예금, 적금, 입출금, 대출)
	@Override
	public List<SearchDTO> SearchProductName(Map<String, Object> map) {
		logger.info("SearchDAOImpl - SearchProductName");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchProductName(map);
	}

	//계좌의 상태별 조회 (정상, 휴면, 해지)
	@Override
	public List<SearchDTO> SleepDisableAcc(String id) {
		logger.info("SearchDAOImpl - SleepDisableAcc");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SleepDisableAcc(id);
	}
	
	//계좌 1개의 잔액 조회
	@Override
	public int SearchOneAccBalance(Map<String, Object> map) {
		logger.info("SearchDAOImpl - SearchOneAccBalance");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchOneAccBalance(map);
	}

	@Override
	public SearchDTO SearchAccAllColumn(Map<String, Object> map) {
		logger.info("SearchDAOImpl - SearchAccAllColumn");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchAccAllColumn(map);
	}

	@Override
	public SearchDTO SearchAccAllColumn2(Map<String, Object> map) {
		logger.info("SearchDAOImpl - SearchAccAllColumn2");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchAccAllColumn2(map);
	}
	
	@Override
	public int AccAnonymInsert(SearchDTO dto) {
		logger.info("SearchDAOImpl - AccAnonymInsert");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.AccAnonymInsert(dto);
	}

	@Override
	public int AccAnonymInsertChk(Map<String, Object> map) {
		logger.info("SearchDAOImpl - AccAnonymInsertChk");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.AccAnonymInsertChk(map);
	}

	@Override
	public int BeAccount(String ACCOUNT) {
		logger.info("SearchDAOImpl - BeAccount");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.BeAccount(ACCOUNT);
	}
	
	@Override
	public SearchDTO SearchAll(String ACCOUNT) {
		logger.info("SearchDAOImpl - SearchAll");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchAll(ACCOUNT);
	}

	@Override
	public List<TransferDTO> SearchRangeSelectAction(Map<String, Object> map) {
		logger.info("SearchDAOImpl - SearchRangeSelectAction");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchRangeSelectAction(map);
	}

	@Override
	public List<TransferDTO> SearchDetailTransfer(String ACCOUNT) {
		logger.info("SearchDAOImpl - SearchDetailTransfer");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SearchDetailTransfer(ACCOUNT);
	}

	@Override
	public List<LoanAccountDTO> SoonEndLoanSearch(String id) {
		logger.info("SearchDAOImpl - SoonEndLoanSearch");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.SoonEndLoanSearch(id);
	}

	@Override
	public int dailyProfit(String date) {
		logger.info("SearchDAOImpl - dailyProfit");
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		return dao.dailyProfit(date);
	}

}
