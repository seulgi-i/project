package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_csg.dto.BoardCommentDTO;
import spring.mvc.pj_117_csg.dto.BoardDTO;


public interface BoardDAO {
   //게시글 목록
   public List<BoardDTO> boardList(Map<String, Object> map);
   
   //게시글 갯수 구하기
   public int boardCnt();
   
   //게시글 작성처리
   public void boardInsert(BoardDTO dto);
   
   //조회수 증가
   public void plusReadCnt(int num);
   
   //게시글 상세페이지
   public BoardDTO getBoardDetail(int num);
   
   //비밀번호 인증
   public String password_chk(Map<String, Object> map);
   
   //게시글 수정처리
   public void updateBoard(BoardDTO dto);

   //게시글 삭제처리
   public void deleteBoard(int num);
   
   //댓글 추가처리
   public void commentInsert(BoardCommentDTO dto);
   
   //댓글목록처리
   public List<BoardCommentDTO> commentList(int board_num);
}