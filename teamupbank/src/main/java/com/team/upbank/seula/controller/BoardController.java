package com.team.upbank.seula.controller;

import javax.servlet.http.HttpServletRequest;

import com.team.upbank.seula.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	

	private final BoardService service;

	  //공지사항 목록
	  @RequestMapping("notice.do")
		public String notice(HttpServletRequest req, Model model) {
			logger.info("[url => /notice.do]");
		  System.out.println("cnt: " +service.noticeCnt());
			service.noticeAction(req, model);
			return "seula/board/notice";
		}

	  	//공지사항 작성화면
		@RequestMapping("noticeInsert.do")
		public String noticeInsert() {
			logger.info("[url => /noticeInsert.do]");

			return "seula/board/noticeInsert";
		}
		//공지사항 작성처리
		@RequestMapping("noticeInsertAction.do")
		public String noticeInsertAction(HttpServletRequest req, Model model) {
			logger.info("[url => /noticeInsertAction.do]");
			service.noticeInsertAction(req, model);
			service.noticeAction(req, model);
			return "seula/board/notice";
		}

		//공지사항 상세조회
		@RequestMapping("noticeDetail.do")
		public String noticeDetailAction(HttpServletRequest req, Model model) {
			logger.info("[url => /noticeDetailAction.do]");
			service.noticeDetailAction(req, model);
			return "seula/board/noticeDetail";
		}

		//공지사항 수정화면
		@RequestMapping("noticeUpdatePage.do")
		public String noticeUpdatePage(HttpServletRequest req, Model model) {
			logger.info("[url => /noticeUpdatePage.do]");
			service.noticeDetailAction(req, model);
			return "seula/board/noticeUpdate";
		}

		//공지사항 수정처리
		@RequestMapping("noticeUpdateAction.do")
		public String noticeUpdateAction(HttpServletRequest req, Model model) {
			logger.info("[url => /noticeUpdateAction.do]");
			service.noticeUpdateAction(req, model);
			service.noticeAction(req, model);
			return "seula/board/notice";
		}

		//공지사항 삭제처리
		@RequestMapping("noticeDeleteAction.do")
		public String noticeDeleteAction(HttpServletRequest req, Model model) {
			logger.info("[url => /noticeDeleteAction.do]");
			service.noticeDeleteAction(req, model);
			service.noticeAction(req, model);
			return "seula/board/notice";
		}

		//자주묻는 질문
		@RequestMapping("faq.do")
		public String faq() {
			logger.info("[url => /faq.do]");

			return "seula/board/faq";
		}

//
//		/*-------------------------상담게시판-------------------------*/
//
//		//상담 신청화면
//		@RequestMapping("cnsltInsert.do")
//		public String cnsltInsert(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltInsert.do]");
//			return "seula/board/cnsltInsert";
//		}
//
//		//상담 신청처리
//		@RequestMapping("cnsltInsertAction.do")
//		public String cnsltInsertAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltInsertAction.do]");
//			service.cnsltInsertAction(req, model);
//			service.cnsltAction(req, model);
//			return "seula/board/cnslt";
//		}
//
//		//상담 목록조회
//		@RequestMapping("cnslt.do")
//		public String cnslt(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnslt.do]");
//			service.cnsltAction(req, model);
//			return "seula/board/cnslt";
//		}
//
//		//상담 상세조회
//		@RequestMapping("cnsltDetail.do")
//		public String cnsltDetailAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltDetailAction.do]");
//			service.cnsltDetailAction(req, model);
//			return "seula/board/cnsltDetail";
//		}
//
//		//상담 수정화면
//		@RequestMapping("cnsltUpdatePage.do")
//		public String cnsltUpdatePage(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltUpdatePage.do]");
//			service.cnsltDetailAction(req, model);
//			return "seula/board/cnsltUpdate";
//		}
//
//		//상담 수정처리
//		@RequestMapping("cnsltUpdateAction.do")
//		public String cnsltUpdateAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltUpdateAction.do]");
//			service.cnsltUpdateAction(req, model);
//			service.cnsltAction(req, model);
//			return "seula/board/cnslt";
//		}
//
//		//상담 삭제처리
//		@RequestMapping("cnsltDeleteAction.do")
//		public String cnsltDeleteAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /cnsltDeleteAction.do]");
//			service.cnsltDeleteAction(req, model);
//			service.cnsltAction(req, model);
//			return "seula/board/cnslt";
//		}
//
//		/*-------------------------댓글-------------------------*/
//
//		//댓글 목록조회
//		@RequestMapping("commentListAction.do")
//		public String commentListAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /commentList.do]");
//			service.commentListAction(req, model);
//			return "seula/board/comment";
//		}
//
//		//댓글 작성처리
//		@RequestMapping("commentInsertAction.do")
//		public String commentInsertAction(HttpServletRequest req, Model model) {
//			logger.info("[url => /commentInsertAction.do]");
//			service.commentInsertAction(req, model);
//			return "seula/board/comment";
//		}
}
