package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.FundDTO;
import com.mvc.upbank.dto.SearchDTO;

@Repository
public class FundDAOImpl implements FundDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(FundDAO.class);
	
	
	@Autowired
	SqlSession sqlSession;
	
	//펀드 계좌 개설
	@Override
	public int fundAccountInsert (SearchDTO dto) {
		logger.info("펀드DAO - 펀드 계좌 개설");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundAccountInsert(dto);
	}
	
	//펀드 계좌 조회
	@Override
	public SearchDTO SearcFundName(String id) {
		logger.info("펀드DAO - 펀드 계좌 조회");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.SearcFundName(id);
	}
	
	//펀드 구매
	@Override
	public int fundBuy(FundDTO dto) {
		logger.info("펀드DAO - 펀드 구매");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundBuy(dto);
	}

	//펀드 보유내역
	@Override
	public List<FundDTO> fundMypage(Map<String, Object> map) {
		logger.info("펀드DAO - 펀드 보유내역");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundMypage(map);
	}

	//펀드 잔고업데이트
	@Override
	public int fundBalanceUpdate(Map<String, Object> map) {
		logger.info("펀드DAO - 잔고업데이트");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundBalanceUpdate(map);
	}

	//펀드 수량 조회
	@Override
	public int fundCnt(Map<String, Object> cnt) {
		logger.info("펀드DAO - 펀드 수량 조회");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundCnt(cnt);
	}

	//펀드 거래내역 조회
	@Override
	public List<FundDTO> fundSearch(Map<String, Object> map) {
		logger.info("펀드DAO - 펀드 거래내역");
		FundDAO dao = sqlSession.getMapper(FundDAO.class);
		return dao.fundSearch(map);
	}


}
