package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.service.BoardServiceImpl;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public BoardController() {
      super();
   }
   

   // 1단계. 웹브라우저가 전송한 HTTP 요청 받음
   protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      action(req, res);
   }

   protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      doGet(req, res);
   }
   

   public void action(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      // 한글 안 깨지게 처리
      req.setCharacterEncoding("UTF-8");
      String viewPage = "";

      // 2단계. 요청 분석

      String uri = req.getRequestURI(); 
      String contextPath = req.getContextPath();
      String url = uri.substring(contextPath.length());
      BoardServiceImpl service = new BoardServiceImpl();
      
//-----------------------------------------[게시판]-----------------------------------------
      // 게시판
      if (url.equals("/*.bo") || url.equals("/boardList.bo")) {
         System.out.println("[url => boardList.bo]");

         service.boardListAction(req, res);
         viewPage = "admin/csCenter/boardList.jsp";

         RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
         dispatcher.forward(req, res); // 해당 viewPage로 forward

        //고객이 보는 공지 게시판
      }else if (url.equals("/Customerboard.bo")) {
    	  System.out.println("[url => Customerboard.bo]");

          service.boardListAction(req, res);
          viewPage = "customer/board/Customerboard.jsp";

          RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
          dispatcher.forward(req, res); // 해당 viewPage로 forward
          
          //고객이 누른 공지 게시판 상세페이지
      } else if (url.equals("/BoardDetailAction.bo")) {
          System.out.println("[url => BoardDetailAction.bo]");

          service.boardDetailAction(req, res);
          viewPage =  "customer/board/BoardDetailAction.jsp";

          RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
          dispatcher.forward(req, res); // 해당 viewPage로 forward

      
      // 상세페이지
      } else if (url.equals("/board_detailAction.bo")) {
         System.out.println("[url => board_detailAction.bo]");

         service.boardDetailAction(req, res);
         viewPage = "admin/csCenter/board_detailAction.jsp";

         RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
         dispatcher.forward(req, res); // 해당 viewPage로 forward

         // 수정 삭제시 비밀번호 인증

      } else if (url.equals("/password_chk.bo")) {
         System.out.println("[url => password_chk.bo]");

         String reseult = service.password_chkAction(req, res);

         // 화면에서 값 받아오기
         int num = Integer.parseInt(req.getParameter("num"));

         // 비밀번호가 일치하면 수정화면으로 이동
         if (reseult != null) {

            // 싱글톤 방식으로 dao 객체 생성
            BoardDAO dao = BoardDAOImpl.getInstance();

            // 상세페이지 호출
            BoardDTO dto = dao.getBoardDetail(num);

            // jsp로 처리결과 전달
            req.setAttribute("dto", dto);

            // 페이지 이동
            viewPage = "admin/csCenter/board_edit.jsp";

            RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
            dispatcher.forward(req, res); // 해당 viewPage로 forward

            // 비밀번호가 일치하지 않으면 이전화면으로 되돌아감
         } else {
            System.out.println("---비밀번호 불일치---");
            viewPage = req.getContextPath() + "/board_detailAction.bo?num=" + num + "&message=error";
            res.sendRedirect(viewPage);

         }

         // 게시판 수정처리
      } else if (url.equals("/board_updateAction.bo")) {
         System.out.println("[url => board_updateAction.bo]");

         service.boardUpdateAction(req, res);
         viewPage = req.getContextPath() + "/boardList.bo";
         res.sendRedirect(viewPage);

         // 게시판 삭제처리
      } else if (url.equals("/board_deleteAction.bo")) {
         System.out.println("[url => board_deleteAction.bo]");

         service.boardDeleteAction(req, res);
         viewPage = req.getContextPath() + "/boardList.bo";
         res.sendRedirect(viewPage);

      // 글쓰기 화면
      } else if (url.equals("/board_insert.bo")) {
         System.out.println("[url => /board_insert.bo]");

         viewPage = "admin/csCenter/board_insert.jsp";

         RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
         dispatcher.forward(req, res); // 해당 viewPage로 forward

      // 게시글 글쓰기 처리
      } else if (url.equals("/board_insertAction.bo")) {
         System.out.println("[url => /board_insertAction.bo]");

         service.boardInsertAction(req, res);
         viewPage = req.getContextPath() + "/boardList.bo";
         res.sendRedirect(viewPage);


      // ---------------- 댓글 --------------------------
         // 댓글작성
         } else if(url.equals("/commentAdd.bo")) {
            System.out.println("[url => /commentAdd.bo]");
            
            service.commentAddAction(req, res);
            // $.ajax()의 콜백함수(success의 result)로 넘어감
            
         } else if(url.equals("/commentList.bo")) {
            System.out.println("[url => /commentList.bo]");
            
            service.commentListAction(req, res);
            // $.ajax()의 콜백함수(success의 result)로 넘어감
            viewPage = "admin/csCenter/comment_list.jsp";
            
            RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
            dispatcher.forward(req, res); // 해당 viewPage로 forward
         }   

   
   }
}