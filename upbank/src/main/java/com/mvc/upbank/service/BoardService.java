package com.mvc.upbank.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {


	/*--------------------공지사항-----------------------*/
	//공지사항 작성처리
	public void noticeInsertAction(HttpServletRequest req, Model model);
	
	//공지사항 목록조회
	public void noticeAction(HttpServletRequest req, Model model);
	
	//공지사항 상세페이지
	//공지사항 수정페이지
	public void noticeDetailAction(HttpServletRequest req, Model model);
	
	//공지사항 수정처리
	public void noticeUpdateAction(HttpServletRequest req, Model model);
	
	//공지사항 삭제처리
	public void noticeDeleteAction(HttpServletRequest req, Model model);
	
	
	/*--------------------상담신청-----------------------*/
	//상담 작성처리
	public void cnsltInsertAction(HttpServletRequest req, Model model);
	
	//상담 목록조회
	public void cnsltAction(HttpServletRequest req, Model model);
	
	//상담 상세페이지
	//상담 수정페이지
	public void cnsltDetailAction(HttpServletRequest req, Model model);	
	
	//상담 수정처리
	public void cnsltUpdateAction(HttpServletRequest req, Model model);
	
	//상담 삭제처리
	public void cnsltDeleteAction(HttpServletRequest req, Model model);
	
	/*--------------------댓글-----------------------*/
	//댓글 목록조회
	public void commentListAction(HttpServletRequest req, Model model);
	
	//댓글 목록조회
	public void commentInsertAction(HttpServletRequest req, Model model);
	
}
