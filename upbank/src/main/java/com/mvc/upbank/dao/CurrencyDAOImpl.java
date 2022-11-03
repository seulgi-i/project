package com.mvc.upbank.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.CurExchangeDTO;
import com.mvc.upbank.dto.CurrencyDTO;

@Repository
public class CurrencyDAOImpl implements CurrencyDAO{
	private static final Logger logger = LoggerFactory.getLogger(CurrencyDAO.class);
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int CurrencyInsert(CurrencyDTO dto) {
		logger.info("dao-CurrencyInsert");
		int insertCnt = sqlSession.insert("com.mvc.upbank.dao.CurrencyDAO.CurrencyInsert", dto);
		logger.info("CurrencyInsertCnt ->" + insertCnt);
		return insertCnt;
	}

	@Override
	public CurrencyDTO CurrencySelect(String CUR_DATE) {
		logger.info("dao-CurrencySelect");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		return dao.CurrencySelect(CUR_DATE);
	}

	@Override
	public int CurrencySelectDate(String CUR_DATE) {
		logger.info("dao-CurrencySelectDate");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		int selectCnt = dao.CurrencySelectDate(CUR_DATE);
		logger.info("CurrencySelectDateCnt ->" + selectCnt);
		return selectCnt;
	}

	@Override
	public double CurrencyCalc(String CUR_UNIT) {
		logger.info("dao-CurrencyCalc");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		double todayCurrency = dao.CurrencyCalc(CUR_UNIT);
		logger.info("CurrencyCalc : todayCurrency->" + todayCurrency);
		return todayCurrency;
	}

	@Override
	public int CurrencyExcInsert(CurExchangeDTO dto) {
		logger.info("dao-CurrencyExcInsert");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		int incertCnt = dao.CurrencyExcInsert(dto);
		return incertCnt;
	}

	@Override
	public List<CurExchangeDTO> CurrencyExchangeSearch(String usercp) {
		logger.info("dao-CurrencyExcSelect");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		List<CurExchangeDTO> list = dao.CurrencyExchangeSearch(usercp);
		return list;
	}

	@Override
	public int CurrencyExcSearchCnt(String usercp) {
		logger.info("dao-CurrencyExcSearchCnt");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		int selectCnt = dao.CurrencyExcSearchCnt(usercp);
		return selectCnt;
	}

	@Override
	public int CurrencyExchangeAdmin(int num) {
		logger.info("dao-CurrencyExchangeAdmin");
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		int updateCnt = dao.CurrencyExchangeAdmin(num);
		return updateCnt;
	}

}
