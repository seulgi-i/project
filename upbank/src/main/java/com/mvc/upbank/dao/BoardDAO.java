package com.mvc.upbank.dao;

import java.util.List;
import java.util.Map;

import com.mvc.upbank.dto.BoardDTO;
import com.mvc.upbank.dto.CommentDTO;

public interface BoardDAO {

	/*---------------공지사항-----------------*/
	//공지사항 작성 처리
	public void noticeInsert(BoardDTO dto);
	
   //공지사항 목록
   public List<BoardDTO> noticeList(Map<String, Object> map);
	
   //공지사항 갯수 구하기
   public int noticeCnt();
   
   //공지사항 상세조회
   public BoardDTO noticeDetail(int n_No);
   
   //조회수 증가
   public void plusReadCnt(int n_No);
   
   //공지사항 수정처리
   public void noticeUpdate(BoardDTO dto);
   
   //공지사항 수정처리
   public void noticeDelete(int n_No);
   
   /*---------------상담게시판-----------------*/
	//상담 신청처리
	public void cnsltInsert(BoardDTO dto);
   
	//상담 목록조회
	public List<BoardDTO> cnsltList(Map<String, Object> map);
	
	//상담 갯수 구하기
	public int cnsltCnt(Map<String, Object> map);
	
    //상담 상세조회
    public BoardDTO cnsltDetail(int c_No);
   
    //상담 수정처리
    public void cnsltUpdate(BoardDTO dto);
   
    //상담 삭제처리
    public void cnsltDelete(int c_No);
    
    /*---------------댓글-----------------*/
    //댓글목록처리
    public List<CommentDTO> commentList(int c_No);
    
   //댓글 추가처리
    public void commentInsert(CommentDTO dto);
    
    //댓글 추가처리2
    public void cnsltCommentUpdate(int c_No);
   
}
