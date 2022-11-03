package com.team.upbank.seula.service;

import com.team.upbank.page.Paging;
import com.team.upbank.seula.dto.BoardDTO;
import com.team.upbank.seula.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;

    public Integer noticeCnt(){
        System.out.println("수 :" +boardRepository.noticeCnt());
        return boardRepository.noticeCnt();
    }

    public void noticeInsertAction(HttpServletRequest req, Model model) {
        System.out.println("서비스 -> 공지사항 작성처리");

        // 3단계. 화면으로부터 입력받은 값을 받는다.
        String title = req.getParameter("n_title");
        String content = req.getParameter("n_content");

        System.out.println("title: " + title);
        System.out.println("content: " + content);

        // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
        BoardDTO dto = new BoardDTO();
        dto.setN_title(title);
        dto.setN_content(content);

        //5단계. 글쓰기 처리
        boardRepository.noticeInsert(dto);
    }

    //공지사항 목록
    public void noticeAction(HttpServletRequest req, Model model) {
        System.out.println("서비스 -> 공지사항 목록");

        // 3단계. 화면으로부터 입력받은 값을 받는다.
        // 페이지 번호 클릭시
        String pageNum = req.getParameter("pageNum");

        // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
        Paging paging = new Paging(pageNum);

        // 5-1단계. 전체 게시글 갯수 카운트
        int total = boardRepository.noticeCnt();
        System.out.println("total -> " + total);
        paging.setTotalCount(total);

        int start = paging.getStartRow(); // 페이지별 시작번호
        int end = paging.getEndRow(); // 페이지별 끝번호

        // 5-2단계. 게시글 목록
        List<BoardDTO> list = null;

        if (total > 0) {
            //list = dao.boardList(start, end);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", start);
            map.put("end", end);
            list = boardRepository.noticeList(map);

        }

        // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

    }

    //공지사항 상세페이지
    //공지사항 수정페이지
    public void noticeDetailAction(HttpServletRequest req, Model model) {
        System.out.println("서비스 -> 공지사항 상세페이지");

        // 3단계. 화면으로부터 입력받은 값을 받는다.
        // 페이지 번호 클릭시
        int n_No = Integer.parseInt(req.getParameter("n_No"));

        // 5-1단계. 조회수 증가
        boardRepository.plusReadCnt(n_No);

        // 5-2단계. 상세페이지
        BoardDTO dto = boardRepository.noticeDetail(n_No);

        // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
        model.addAttribute("dto", dto);

    }

    //공지사항 수정처리
    public void noticeUpdateAction(HttpServletRequest req, Model model) {
        System.out.println("서비스 -> 공지사항 수정처리");

        // 3단계. 화면으로부터 입력받은 값, hidden
        BoardDTO dto = new BoardDTO();

        dto.setN_No(Integer.parseInt(req.getParameter("n_No")));
        dto.setN_title(req.getParameter("n_title"));
        dto.setN_content(req.getParameter("n_content"));

        // 5단계. update후 list로 이동
        boardRepository.noticeUpdate(dto);
        
    }

    //공지사항 삭제처리
    public void noticeDeleteAction(HttpServletRequest req, Model model) {
        System.out.println("서비스 ->  공지사항 삭제처리");
        // 3단계. 화면으로부터 입력받은 값, hidden
        int n_No = Integer.parseInt(req.getParameter("n_No"));

        // 5단계. update후 list로 이동
        boardRepository.noticeDelete(n_No);
    }

//    /*---------------------상담게시판------------------*/
//
//    //상담 신청처리
//    @Override
//    public void cnsltInsertAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 -> 상담 신청처리");
//
//        // 3단계. 화면으로부터 입력받은 값을 받는다.
//        String id = "hong";
//        String title = req.getParameter("c_title");
//        String content = req.getParameter("c_content");
//        String category = req.getParameter("c_category");
//        if (category == null) {
//            category = "일반 문의";
//        }
//
//        System.out.println("title: " + title);
//        System.out.println("content: " + content);
//        System.out.println("category: " + category);
//
//        // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
//        BoardDTO dto = new BoardDTO();
//        dto.setUser_id(id);
//        dto.setC_title(title);
//        dto.setC_content(content);
//        dto.setC_category(category);
//
//        //5단계. 글쓰기 처리
//        boardRepository.cnsltInsert(dto);
//    }
//
//    //상담 목록조회
//    @Override
//    public void cnsltAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 -> 상담 목록조회");
//        // 3단계. 화면으로부터 입력받은 값을 받는다.
//        // 페이지 번호 클릭시
//        String pageNum = req.getParameter("pageNum");
//
//        // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
//        Paging paging = new Paging(pageNum);
//
//        // 5-1단계. 전체 게시글 갯수 카운트
//        int total = dao.cnsltCnt();
//        System.out.println("total -> " + total);
//        paging.setTotalCount(total);
//
//        int start = paging.getStartRow(); // 페이지별 시작번호
//        int end = paging.getEndRow(); // 페이지별 끝번호
//
//        // 5-2단계. 게시글 목록
//        List<BoardDTO> list = null;
//
//        if (total > 0) {
//            Map<String, Object> map = new HashMap<String, Object>();
//            map.put("start", start);
//            map.put("end", end);
//            list = dao.cnsltList(map);
//        }
//
//        // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
//        model.addAttribute("list", list);
//        model.addAttribute("paging", paging);
//
//    }
//
//    //상담 상세페이지
//    //상담 수정페이지
//    @Override
//    public void cnsltDetailAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 -> 상담 상세페이지");
//
//        // 3단계. 화면으로부터 입력받은 값을 받는다.
//        // 페이지 번호 클릭시
//        int c_No = Integer.parseInt(req.getParameter("c_No"));
//        System.out.println(c_No);
//
//        // 5-2단계. 상세페이지
//        BoardDTO dto = dao.cnsltDetail(c_No);
//
//        // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
//        model.addAttribute("dto", dto);
//    }
//
//    //상담 수정처리
//    @Override
//    public void cnsltUpdateAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 -> 상담 수정처리");
//
//        // 3단계. 화면으로부터 입력받은 값, hidden
//        BoardDTO dto = new BoardDTO();
//
//        dto.setC_No(Integer.parseInt(req.getParameter("c_No")));
//        dto.setC_title(req.getParameter("c_title"));
//        dto.setC_category(req.getParameter("c_category"));
//        dto.setC_content(req.getParameter("c_content"));
//
//        // 5단계. update후 list로 이동
//        dao.cnsltUpdate(dto);
//    }
//
//    //상담 삭제처리
//    @Override
//    public void cnsltDeleteAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 -> 상담 삭제처리");
//        // 3단계. 화면으로부터 입력받은 값, hidden
//        int c_No = Integer.parseInt(req.getParameter("c_No"));
//
//        // 5단계. update후 list로 이동
//        dao.cnsltDelete(c_No);
//    }
//
//    /*---------------------댓글------------------*/
//
//    @Override
//    public void commentListAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 ->  commentListAction");
//
//        // 3단계. 화면으로부터 입력받은 값, hidden 값(num)을 받는다.
//        int c_No = Integer.parseInt(req.getParameter("c_No"));		//req.getParameter("num") String이기때문에 인티저로 바꿔준다
//        System.out.println("c_No : "+ c_No);
//
//        // 5단계. 댓글 목록 조회
//        List<CommentDTO> list = dao.commentList(c_No);
//
//        // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
//        req.setAttribute("list", list);  //comment_list()의 콜백함수로 result로 결과 전달
//
//
//
//    }
//
//    //댓글 추가처리
//    @Override
//    public void commentInsertAction(HttpServletRequest req, Model model) {
//        System.out.println("서비스 ->  댓글 추가처리");
//
//        // 3단계. 화면으로부터 입력받은 값, hidden 값(num)을 받는다.
//        System.out.println("c_No : " + Integer.parseInt(req.getParameter("c_No")));
//        System.out.println("cmt_name : " + req.getParameter("cmt_name"));
//        System.out.println("cmt_content : " + req.getParameter("cmt_content"));
//
//        CommentDTO dto = new CommentDTO();
//        int c_No = Integer.parseInt(req.getParameter("c_No"));
//        dto.setC_No(c_No);
//        dto.setCmt_name(req.getParameter("cmt_name"));
//        dto.setCmt_content(req.getParameter("cmt_content"));
//
//        // 5단계. 댓글 insert
//        dao.commentInsert(dto);
//        dao.cnsltCommentUpdate(c_No);
//
//        //실행이 끝나면 board_detail.jsp의 comment_add()콜백함수(success)로 넘어감.
//    }

}
