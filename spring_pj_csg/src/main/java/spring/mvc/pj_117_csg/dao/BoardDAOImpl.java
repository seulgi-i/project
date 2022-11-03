package spring.mvc.pj_117_csg.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_csg.dao.BoardDAO;
import spring.mvc.pj_117_csg.dto.BoardCommentDTO;
import spring.mvc.pj_117_csg.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	SqlSession sqlSession;

	// 게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("DAO - boardList");

		// 방법1.
		// List<BoardDTO> list =
		// sqlSession.selectList("spring.mvc.pj_117_csg.dao.BoardDAO.boardList", map);
		//
		// return list;

		// 방법2.
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.boardList(map);
		return list;
		// 댓글 + 게시글목록
		// 1. list 생성
		// 2. dto생성
		// 3. dto에 rs게시글 정보를 담는다
		// 4. list에 dto를 추가한다
		// 5. llist 리턴

	}

	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println("DAO - boardCnt");

		// 방법1.
		// int selectCnt =
		// sqlSession.selectOne("spring.mvc.pj_117_csg.dao.BoardDAO.boardCnt");
		// return selectCnt;

		// 방법2. sqlSession.getMapper(namespace명.class) 접근 후 메서드 호출하면 해당 mapper의 id가 실행;
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int selectCnt = dao.boardCnt();
		return selectCnt;

	}

	// 조회수 증가
	@Override
	public void plusReadCnt(int num) {
		System.out.println("DAO - plusReadCnt");

		// 방법2
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.plusReadCnt(num);
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int num) {
		System.out.println("DAO - getBoardDetail");

		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.getBoardDetail(num);

		return dto;
	}

	// 비밀번호 인증 - 비밀번호 리턴
	@Override
	public String password_chk(Map<String, Object> map) {
		System.out.println("DAO - password_chk");

		// 방법1.
		return sqlSession.selectOne("spring.mvc.pj_117_csg.dao.BoardDAO.password_chk", map);
	}

	// 게시글 작성처리
	@Override
	public void boardInsert(BoardDTO dto) {
		System.out.println("DAO - boardInsert");
		// 방법2.
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardInsert(dto);
	}

	// 게시글 수정처리
	@Override
	public void updateBoard(BoardDTO dto) {
		System.out.println("DAO - updateBoard");

		// 방법1.
		sqlSession.update("spring.mvc.pj_117_csg.dao.BoardDAO.updateBoard", dto);

	}

	// 게시글 삭제처리
	@Override
	public void deleteBoard(int num) {
		System.out.println("DAO - updateBoard");
		// 방법1
		sqlSession.update("spring.mvc.pj_117_csg.dao.BoardDAO.deleteBoard", num);
		// 방법2
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// dao.deleteBoard(num);
	}

	// 댓글목록처리
	@Override
	public List<BoardCommentDTO> commentList(int board_num) {
		System.out.println("댓글목록처리");
		// 방법1.
		List<BoardCommentDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.BoardDAO.commentList", board_num);

		return list;
	}

	// 댓글 추가처리
	@Override
	public void commentInsert(BoardCommentDTO dto) {
		System.out.println("DAO - commentInsert");

		sqlSession.insert("spring.mvc.pj_117_csg.dao.BoardDAO.commentInsert", dto);
	}

}