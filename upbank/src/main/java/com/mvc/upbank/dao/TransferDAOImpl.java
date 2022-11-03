package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.TransferDTO;


@Repository
public class TransferDAOImpl implements TransferDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(TransferDAO.class);
	
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int transferInfoInsert(TransferDTO dto) {
		logger.info("TransferDAOImpl - transferInfoInsert");
		TransferDAO dao = sqlSession.getMapper(TransferDAO.class);
		return dao.transferInfoInsert(dto);
	}

	@Override
	public int transferBalanceSet(Map<String,Object> map) {
		logger.info("TransferDAOImpl - transferBalanceSet");
		TransferDAO dao = sqlSession.getMapper(TransferDAO.class);
		return dao.transferBalanceSet(map);
	}

	@Override
	public int transferChargeInsert(TransferDTO dto) {
		logger.info("TransferDAOImpl - transferChargeInsert");
		TransferDAO dao = sqlSession.getMapper(TransferDAO.class);
		return dao.transferChargeInsert(dto);
	}

	@Override
	public List<TransferDTO> transferList(Map<String, Object> map) {
		logger.info("TransferDAOImpl - transferList");
		
		TransferDAO dao = sqlSession.getMapper(TransferDAO.class);
		return dao.transferList(map);
	}


}
