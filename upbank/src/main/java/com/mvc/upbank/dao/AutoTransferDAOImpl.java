package com.mvc.upbank.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.AutoTransferDTO;
import com.mvc.upbank.dto.TransferDTO;

import lombok.RequiredArgsConstructor;

@Repository
public class AutoTransferDAOImpl implements AutoTransferDAO {
	private static final Logger logger = LoggerFactory.getLogger(AutoTransferDAO.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public int insertAutoTransfer(AutoTransferDTO dto) {
		logger.info("자동이체dao - insertAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).insertAutoTransfer(dto);
	}

	@Override
	public ArrayList<AutoTransferDTO> getMyAutoTransfer(String id) {
		logger.info("자동이체dao - getMyAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).getMyAutoTransfer(id);
	}

	@Override
	public int deleteAutoTransfer(int auto_id) {
		logger.info("자동이체dao - deleteAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).deleteAutoTransfer(auto_id);
	}

	@Override
	public ArrayList<AutoTransferDTO> selectByDay(int day) {
		logger.info("자동이체dao - selectByDay");
		return sqlsession.getMapper(AutoTransferDAO.class).selectByDay(day);
	}

	@Override
	public int updateAutoTransfer(int auto_id) {
		logger.info("자동이체dao - updateAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).updateAutoTransfer(auto_id);
	}

	@Override
	public int selectAccountBalance(String ACCOUNT) {
		logger.info("자동이체dao - selectAccountBalance");
		return sqlsession.getMapper(AutoTransferDAO.class).selectAccountBalance(ACCOUNT);
	}

	@Override
	public int insertTranferByAuto(TransferDTO dto) {
		logger.info("자동이체dao - insertTranferByAuto");
		return sqlsession.getMapper(AutoTransferDAO.class).insertTranferByAuto(dto);
	}

	@Override
	public int insertAutoTransferList(Map<String, Object> map) {
		logger.info("자동이체dao - insertAutoTransferList");
		return sqlsession.getMapper(AutoTransferDAO.class).insertAutoTransferList(map);
	}

	@Override
	public int failAutoTransferList(int auto_transfer_id) {
		logger.info("자동이체dao - failAutoTransferList");
		return sqlsession.getMapper(AutoTransferDAO.class).failAutoTransferList(auto_transfer_id);
	}

	@Override
	public int updateAccountAutoTransfer(Map<String, Object> map) {
		logger.info("자동이체dao - updateAccountAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).updateAccountAutoTransfer(map);
	}

	@Override
	public int exitAutoTransfer() {
		logger.info("자동이체dao - exitAutoTransfer");
		return sqlsession.getMapper(AutoTransferDAO.class).exitAutoTransfer();
	}

}
