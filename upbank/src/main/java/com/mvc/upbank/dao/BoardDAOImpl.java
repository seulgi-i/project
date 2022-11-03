package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.BoardDTO;
import com.mvc.upbank.dto.CommentDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
//DAO : jdbc.. db관련 업무처리
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	@Autowired
	SqlSession sqlSession;	
	//dataSource-config.xml - 컨넥션풀+마이바티스(mapper부분, pom.xml에도 설정되어있어야함)
	
	

	/*-----------------------공지사항--------------------*/
	//공지사항 작성 처리
	@Override
	public void noticeInsert(BoardDTO dto) {
		logger.info("DAO - noticeInsert");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.noticeInsert(dto);
	}

	//공지사항 목록 조회
	@Override
	public List<BoardDTO> noticeList(Map<String, Object> map) {
		logger.info("DAO - noticeList");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.noticeList(map);
		return list;
	}


	// 공지사항 갯수 구하기
	@Override
	public int noticeCnt() {
		logger.info("DAO - noticeCnt");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int selectCnt = dao.noticeCnt();
		return selectCnt;
	}


    //공지사항 상세조회
	@Override
	public BoardDTO noticeDetail(int n_No) {
		logger.info("DAO - noticeDetail");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.noticeDetail(n_No);
		return dto;
	}

	//조회수 증가
	@Override
	public void plusReadCnt(int n_No) {
		logger.info("DAO - plusReadCnt");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.plusReadCnt(n_No);
	}
	
	//공지사항 수정처리
	@Override
	public void noticeUpdate(BoardDTO dto) {
		logger.info("DAO - noticeUpdate");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.noticeUpdate(dto);
	}

	//공지사항 삭제처리
	@Override
	public void noticeDelete(int n_No) {
		logger.info("DAO - noticeDelete");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.noticeDelete(n_No);
	}

	
	/*---------------상담게시판-----------------*/
	//상담 신청처리
	@Override
	public void cnsltInsert(BoardDTO dto) {
		logger.info("DAO - noticeInsert");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.cnsltInsert(dto);
	}

	//상담 목록조회
	@Override
	public List<BoardDTO> cnsltList(Map<String, Object> map) {
		logger.info("DAO - cnsltList");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.cnsltList(map);
		return list;
	}

	//상담 갯수조회
	@Override
	public int cnsltCnt(Map<String, Object> map) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int selectCnt = dao.cnsltCnt(map);
		return selectCnt;
	}

	//상담 상세조회
	@Override
	public BoardDTO cnsltDetail(int c_No) {
		logger.info("DAO - cnsltDetail");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.cnsltDetail(c_No);
		return dto;
	}

	//상담 수정처리
	@Override
	public void cnsltUpdate(BoardDTO dto) {
		logger.info("DAO - cnsltUpdate");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.cnsltUpdate(dto);
	}

	//상담 삭제처리
	@Override
	public void cnsltDelete(int c_No) {
		logger.info("DAO - cnsltDelete");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.cnsltDelete(c_No);
	}

	/*---------------댓글-----------------*/
	
	//댓글 목록조회
	@Override
	public List<CommentDTO> commentList(int c_No) {
		logger.info("DAO - commentList");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<CommentDTO> list = dao.commentList(c_No);
		return list;
	}

	//댓글 추가처리
	@Override
	public void commentInsert(CommentDTO dto) {
		logger.info("DAO - commentInsert");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.commentInsert(dto);
	}

	//답변완료 처리
	@Override
	public void cnsltCommentUpdate(int c_No) {
		logger.info("DAO - cnsltCommentUpdate");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.cnsltCommentUpdate(c_No);
	}
	
	
	
}
