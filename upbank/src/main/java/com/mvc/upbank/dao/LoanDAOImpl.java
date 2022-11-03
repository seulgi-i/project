package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.LoanAccountDTO;
import com.mvc.upbank.dto.LoanJoinDTO;
import com.mvc.upbank.dto.LoanProductDTO;
import com.mvc.upbank.dto.LoanProductRateDTO;
import com.mvc.upbank.dto.TransferDTO;

@Repository
public class LoanDAOImpl implements LoanDAO {
	private static final Logger logger = LoggerFactory.getLogger(LoanDAO.class);
	
	
	@Autowired
	SqlSession sqlSession;
	
	// 사용자 ----------------------------------
	// 대출 상품 갯수 구하기
	@Override
	public int productCnt() {
		logger.info("대출DAO - productCnt");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.productCnt();
	}

	// 대출 상품 리스트
	@Override
	public List<LoanProductDTO> productList(Map<String, Object> map) {
		logger.info("대출DAO - productList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.productList(map);
	}
	
	// 대출 상품 상세 조회
	@Override
	public LoanProductDTO productDetail(int loan_num) {
		logger.info("대출DAO - productDetail");
		
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.productDetail(loan_num);
	}

	// 대출 신청 처리
	@Override
	public int loanJoin(LoanJoinDTO dto) {
		logger.info("대출DAO - loanJoin");

		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.loanJoin(dto);
	}

	// 직전 대출 신청 넘버 가져오기
	@Override
	public int getJoinNum(String id) {
		logger.info("대출DAO - getJoinNum");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getJoinNum(id);
	}

	// 대출 신청 갯수 구하기
	@Override
	public int getJoinCnt(String id) {
		logger.info("대출DAO - getJoinCnt");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getJoinCnt(id);
	}

	// 대출 신청 목록 조회
	@Override
	public List<LoanJoinDTO> joinList(Map<String, Object> map) {
		logger.info("대출DAO - joinList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.joinList(map);
	}
	
	// 대출 신청 상세 조회
	@Override
	public LoanJoinDTO joinDetail(int join_num) {
		logger.info("대출DAO - joinDetail");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.joinDetail(join_num);
	}

	// 사용자 대출 계좌 갯수 구하기
	@Override
	public int onesAccCnt(String id) {
		logger.info("대출DAO - onesAccCnt");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.onesAccCnt(id);
	}
	
	// 사용자 대출 계좌(상환중) 목록 조회
	@Override
	public List<LoanAccountDTO> onesAccList(Map<String, Object> map) {
		logger.info("대출DAO - onesAccList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.onesAccList(map);
	}
	
	// 사용자 대출 계좌 상세 조회
	@Override
	public LoanAccountDTO accDetail(String account) {
		logger.info("대출DAO - accDetail");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.accDetail(account);
	}
	
	// 사용자 대출 계좌 이체 내역 조회
	@Override
	public List<TransferDTO> transList(String account) {
		logger.info("대출DAO - transList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.transList(account);
	}
	
	// 사용자 대출 계좌 중도 상환 처리
	@Override
	public int loanTerminate(LoanAccountDTO dto) {
		logger.info("대출DAO - transList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.loanTerminate(dto);
	}
	
	// 관리자 ----------------------------------
	// 대출 상품 등록
	@Override
	public synchronized int productInsert(LoanProductDTO dto) {
		logger.info("대출DAO - productInsert");
		
		int insertCnt = sqlSession.insert("com.mvc.upbank.dao.LoanDAO.productInsert", dto);
		int loan_num = 0;
		if(insertCnt == 1) {
			loan_num = sqlSession.selectOne("com.mvc.upbank.dao.LoanDAO.get_loan_num");
		}
		
		List<LoanProductRateDTO> list = dto.getRate();
		for(int i=0; i<list.size(); i++) {
			LoanProductRateDTO rateDTO = list.get(i);
			rateDTO.setLoan_num(loan_num);
			insertCnt = sqlSession.insert("com.mvc.upbank.dao.LoanDAO.productRateInsert", rateDTO);
		}
		
		return loan_num;
	}
	
	// - 대출 신청
	// 대출 신청 갯수 구하기
	@Override
	public int getAllJoinCnt() {
		logger.info("대출DAO - getJoinCnt");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getAllJoinCnt();
	}
	
	// 대출 신청 목록 조회
	@Override
	public List<LoanJoinDTO> AllJoinList(Map<String, Object> map) {
		logger.info("대출DAO - AllJoinList");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.AllJoinList(map);
	}

	// 대출 승인/불가 업데이트 처리
	@Override
	public int joinConfirm(Map<String, Object> map) {
		logger.info("대출DAO - joinConfirm");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.joinConfirm(map);
	}

	// - 대출 계좌 개설
	// 신규 계좌 개설
	@Override
	public int accInsert(Map<String, Object> map) {
		logger.info("대출DAO - accInsert");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.accInsert(map);
	}
	
	// 개설한 계좌 번호 받아오기
	@Override
	public String getaccNum() {
		logger.info("대출DAO - getaccNum");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getaccNum();
	}
	
	// 대출 계좌 개설
	@Override
	public int loanAccInsert(LoanAccountDTO dto) {
		logger.info("대출DAO - loanAccInsert");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.loanAccInsert(dto);
	}
	
	// 대출 상품 금리 가져오기
	@Override
	public LoanProductRateDTO getLoanRate(int loan_rate) {
		logger.info("대출DAO - getLoanRate");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getLoanRate(loan_rate);
	}
	
	// --------------------------------------------------------
	// 사용자 정보 조회
	@Override
	public CustomerDTO getCustomerInfo(String strId) {
		logger.info("대출DAO - getCustomerInfo");
		LoanDAO dao = sqlSession.getMapper(LoanDAO.class);
		return dao.getCustomerInfo(strId);
	}

}
