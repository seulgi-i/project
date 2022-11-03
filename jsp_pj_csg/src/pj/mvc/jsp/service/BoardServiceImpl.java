package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.Paging;
import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dao.CustomerDAO;
import pj.mvc.jsp.dao.CustomerDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.dto.BoardCommentDTO;

public class BoardServiceImpl implements BoardService {

   public static void main(String[] args) {

   }

   // 게시글 목록
   @Override
   public void boardListAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

      System.out.println("서비스 -> 게시글 목록");

      // 3단계. 화면으로부터 입력받은 값을 받는다.
      // 페이지 번호 클릭시
      String pageNum = req.getParameter("pageNum");

      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      BoardDAO dao = BoardDAOImpl.getInstance();
      Paging paging = new Paging(pageNum);

      // 5-1단계. 전체 게시글 갯수 카운트
      int total = dao.boardCnt();
      System.out.println("total -> " + total);
      paging.setTotalCount(total);

      int start = paging.getStartRow(); // 페이지별 시작번호
      int end = paging.getEndRow(); // 페이지별 끝번호

      // 5-2단계. 게시글 목록
      List<BoardDTO> list = null;

      if (total > 0) {
         list = dao.boardList(start, end);

      }

      // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
      req.setAttribute("list", list);
      req.setAttribute("paging", paging);

   }

   // 게시글 작성처리
   @Override
   public void boardInsertAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      
         System.out.println("서비스 -> 게시글 작성처리");
            // 3단계. 화면으로부터 입력받은 값을 받는다.
            // 3단계. 화면으로부터 입력받은 값, hidden 값(num)을 받는다.
               String writer = req.getParameter("writer");
               String title = req.getParameter("title");
               String content = req.getParameter("content");
               String password = req.getParameter("password");
               
               BoardDTO dto = new BoardDTO();
               
               dto.setWriter(writer);
               dto.setTitle(title);
               dto.setContent(content);
               dto.setPassword(password);

            // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
               BoardDAO dao = BoardDAOImpl.getInstance();
               
            //5단계. 글쓰기 처리
               dao.boardInsert(dto);

   }

   // 게시글 상세페이지
   @Override
   public void boardDetailAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      System.out.println("서비스 -> 상세페이지");

      // 3단계. 화면으로부터 입력받은 값을 받는다.
      // 페이지 번호 클릭시
      int num = Integer.parseInt(req.getParameter("num"));

      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      BoardDAO dao = BoardDAOImpl.getInstance();

      // 5-1단계. 조회수 증가
      dao.plusReadCnt(num);

      // 5-2단계. 상세페이지
      BoardDTO dto = dao.getBoardDetail(num);

      // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
      req.setAttribute("dto", dto);

   }

   // 비밀번호 인증
   @Override
   public String password_chkAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      System.out.println("서비스 -> 비밀번호 인증");

      // 3단계. 화면으로부터 입력받은 값, hidden
      int num = Integer.parseInt(req.getParameter("num"));
      String password = req.getParameter("password");

      System.out.println("글번호 : " + num + "비밀번호 : " + password);

      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      BoardDAO dao = BoardDAOImpl.getInstance();

      // 5단계. 비밀번호 인증
      String reseult = dao.password_chk(num, password);

      return reseult;
   }

   // 게시글 수정처리
   @Override
   public void boardUpdateAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {

      System.out.println("서비스 ->  게시글 수정처리");

      // 3단계. 화면으로부터 입력받은 값, hidden
      BoardDTO dto = new BoardDTO();
      
      dto.setNum(Integer.parseInt(req.getParameter("num")));
      dto.setTitle(req.getParameter("title"));
      dto.setContent(req.getParameter("content"));
      dto.setPassword(req.getParameter("password"));
      
      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      BoardDAO dao = BoardDAOImpl.getInstance();

      // 5단계. update후 list로 이동
      dao.updateBoard(dto);
      
   }

   // 게시글 삭제처리
   @Override
   public void boardDeleteAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      System.out.println("서비스 ->  게시글 삭제처리");

      // 3단계. 화면으로부터 입력받은 값, hidden
      int num = Integer.parseInt(req.getParameter("num"));
      
      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      BoardDAO dao = BoardDAOImpl.getInstance();

      // 5단계. update후 list로 이동
      dao.deleteBoard(num);
      
   }

   // 댓글 추가처리
   @Override
   public void commentAddAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   System.out.println("서비스 ->  댓글 추가처리");

	// 3단계. 화면으로부터 입력받은 값, hidden 값(num)을 받는다.
	      System.out.println("board_num : " + Integer.parseInt(req.getParameter("board_num")));
	      System.out.println("writer : " + req.getParameter("writer"));
	      System.out.println("content : " + req.getParameter("content"));
	      
	      BoardCommentDTO dto = new BoardCommentDTO();
	      dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
	      dto.setWriter(req.getParameter("writer"));
	      dto.setContent(req.getParameter("content"));
	      
	      // 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용
	      BoardDAO dao = BoardDAOImpl.getInstance();
	      
	      // 5단계. 댓글 insert
	      dao.commentInsert(dto);
	      
	      //실행이 끝나면 board_detail.jsp의 comment_add()콜백함수(success)로 넘어감.
   }

   // 댓글목록처리
   @Override
   public void commentListAction(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
	   System.out.println("서비스 ->  commentListAction");
	   
	 // 3단계. 화면으로부터 입력받은 값, hidden 값(num)을 받는다.
	   int board_num = Integer.parseInt(req.getParameter("num"));		//req.getParameter("num") String이기때문에 인티저로 바꿔준다
	   System.out.println("num : "+ board_num);
	   
	 // 4단계. 싱글톤방식으로 dao 객체 생성, 다형성 적용  
	   BoardDAO dao = BoardDAOImpl.getInstance();
	   
	// 5단계. 댓글 목록 조회   
	   List<BoardCommentDTO> list = dao.commentList(board_num);
	   
	// 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
	   req.setAttribute("list", list);  //comment_list()의 콜백함수로 result로 결과 전달
		  
	 
	   
   }

}