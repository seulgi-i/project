package spring.mvc.pj_117_csg.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardService {

	// 게시글 목록
	public void boardListAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 게시글 작성처리
	public void boardInsertAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 게시글 상세페이지
	public void boardDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 비밀번호 인증
	public String password_chkAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 게시글 수정처리
	public void boardUpdateAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 게시글 삭제처리
	public void boardDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 댓글 추가처리
	public void commentAddAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 댓글목록처리
	public void commentListAction(HttpServletRequest req, Model model) throws ServletException, IOException;
			
			
	}

