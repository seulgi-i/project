package spring.mvc.pj_117_csg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_csg.dao.BoardDAO;
import spring.mvc.pj_117_csg.dto.BoardDTO;
import spring.mvc.pj_117_csg.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	BoardService service;
	
	@Autowired
	BoardDAO dao;
	
	// 게시글 목록
	@RequestMapping("boardList.bo")
	public String boardList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => boardList.bo]");
		
		service.boardListAction(req, model);
		return "admin/csCenter/boardList";
	}

	// 상세페이지
	@RequestMapping("board_detailAction.bo")
	public String board_detailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
			logger.info("[url => board_detailAction.bo]");
			
		service.boardDetailAction(req, model);
		return "admin/csCenter/board_detailAction";
	}	
	// 수정삭제시 비밀번호 인증
	@RequestMapping("password_chk.bo")
	public String passwordChk(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException {
		logger.info("[url => password_chk.bo]");
		
		String result = service.password_chkAction(req, model);
		int num = Integer.parseInt(req.getParameter("num"));
		
		// 비밀번호가 일치하면 수정화면으로 이동
		if(result != null) {
			BoardDTO dto = dao.getBoardDetail(num);
			model.addAttribute("dto", dto);
			
			return "admin/csCenter/board_edit";
		
		// 비밀번호가 일치하지 않으면 이전화면으로 되돌아감
		} else {
			String viewPage =  req.getContextPath() + "/board_detailAction.bo?num=" + num + "&message=error";
			res.sendRedirect(viewPage);
			
			return null;
		}
	}
	
	// 게시글 수정 처리
	@RequestMapping("board_updateAction.bo")
	public void boardUpdateAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException, ServletException {
		logger.info("[url => board_updateAction.bo]");
		
		service.boardUpdateAction(req, model);
		
		String viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	// 게시글 삭제 처리
	@RequestMapping("board_deleteAction.bo")
	public void boardDeleteAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException, ServletException {
		logger.info("[url => board_deleteAction.bo]");
		
		service.boardDeleteAction(req, model);
		
		String viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	// 게시글쓰기
	@RequestMapping("board_insert.bo")
	public String boardInsert(HttpServletRequest req, Model model) throws IOException, ServletException {
		logger.info("[url => board_insert.bo]");
		
		return "admin/csCenter/board_insert";
	}
	
	// 게시글쓰기 처리
	@RequestMapping("board_insertAction.bo")
	public void boardInsertAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException, ServletException {
		logger.info("[url => board_insertAction.bo]");
		
		service.boardInsertAction(req, model);
		
		String viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	// 댓글 ----------------------------------------------
	// 댓글 목록
	@RequestMapping("commentList.bo")
	public String commentList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => commentList.bo]");
		
		service.commentListAction(req, model);
		return "admin/csCenter/comment_list";
	}
	
	// 댓글 추가처리
	@RequestMapping("commentAdd.bo")
	public String commentAdd(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[url => commentAdd.bo]");
		
		service.commentAddAction(req, model);
		
		return "admin/csCenter/comment_list";
	}
}
