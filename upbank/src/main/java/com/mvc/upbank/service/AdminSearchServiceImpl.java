package com.mvc.upbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.AdminSearchDAO;
import com.mvc.upbank.dto.AdminSearchDTO;
import com.mvc.upbank.page.Paging;



@Service
public class AdminSearchServiceImpl implements AdminSearchService {

	private static final Logger logger = LoggerFactory.getLogger(AdminSearchService.class);
	
	@Autowired
	AdminSearchDAO dao;

	/*---------------------조회------------------*/
	
	//계좌조회 -종합정보
	@Override
	public void adminSearchAccountInfo(HttpServletRequest req, Model model) {
		logger.info("서비스 -> adminSearchAccountInfo"); 
		
		AdminSearchDTO dto;
		
		dto=dao.adminSearchAccountInfo();
		model.addAttribute("idto", dto);
		
		List<AdminSearchDTO> list;
		list=dao.cntAccountYearState();
		
		String[] result = new String[list.size()];
		String r="";
		
		for(int i=0; i<list.size(); i++) {
			int normal = list.get(i).getCnt_account_normal();
			int stopped = list.get(i).getCnt_account_stopped();
			int sleep = list.get(i).getCnt_account_sleep();
			int cancled = list.get(i).getCnt_account_cancled();
			
			result[i]="";
			result[i] += "["+(2017+i)+", "+normal+", "+stopped+", "+sleep+", "+cancled+"]";
			
			if(r!="")
				r+=", ";
			r+=result[i];
		}
		model.addAttribute("r", r);
		System.out.println(r);
	}
	
	//연도별상태별 계좌생성수
	@Override
	public void cntAccountYearState(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> cntAccountYearState"); 
		
		List<AdminSearchDTO> list;
		
		list=dao.cntAccountYearState();
		model.addAttribute("list", list);
	}
	
	//계좌조회 -개별정보
	@Override
	public void adminSearchAccount(HttpServletRequest req, Model model) {
		
      // 페이지 번호 클릭시
      String pageNum = req.getParameter("pageNum");

      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
      Paging paging = new Paging(pageNum);


      String searchType = req.getParameter("searchType");
      String searchValue = req.getParameter("searchValue");
      
      Map<String, Object> map = new HashMap<String, Object>();
	  //검색할 분야
	  map.put("searchType", searchType);
	  //검색어
	  map.put("searchValue", searchValue);
      
      // 5-1단계. 전체 게시글 갯수 카운트
      int total = dao.cntAdminSearchAccount(map);
      paging.setTotalCount(total);

      int start = paging.getStartRow(); // 페이지별 시작번호
      int end = paging.getEndRow(); // 페이지별 끝번호

      // 5-2단계. 게시글 목록
      List<AdminSearchDTO> list = null;
      
      if (total > 0) {
         //list = dao.boardList(start, end);
    	map.put("start", start);
    	map.put("end", end);
    	
    	list = dao.adminSearchAccount(map);
      }

      // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
	}
	
	//계좌상태변경 - 메인
	public void adminChangeAccount(HttpServletRequest req, Model model) {
		logger.info("service - adminChangeAccount");
		
		//정상계좌갯수
		int normal=dao.cntAccountList_state("정상");
		//거래중지대상
		int last_1year=dao.cntAccountList_last_1year();
		//거래중지
		int stop=dao.cntAccountList_state("거래중지");
		//휴면대상
		int last_5year=dao.cntAccountList_last_5year();
		//휴면 
		int sleep=dao.cntAccountList_state("휴면");
		
		model.addAttribute("normal", normal);
		model.addAttribute("last_1year", last_1year);
		model.addAttribute("stop", stop);
		model.addAttribute("last_5year", last_5year);
		model.addAttribute("sleep", sleep);
	}

	//계좌조회 - 1년이상 미거래 & 정상
	@Override
	public void adminAccountList_last_1year(HttpServletRequest req, Model model) {
		logger.info("service - adminAccountList_last_1year");
	  String pageNum = req.getParameter("pageNum");

      Paging paging = new Paging(pageNum);

      Map<String, Object> map = new HashMap<String, Object>();
      
      // 5-1단계. 전체 게시글 갯수 카운트
      int total = dao.cntAccountList_last_1year();
      paging.setTotalCount(total);

      int start = paging.getStartRow(); // 페이지별 시작번호
      int end = paging.getEndRow(); // 페이지별 끝번호

      // 5-2단계. 게시글 목록
      List<AdminSearchDTO> list = null;
      
      if (total > 0) {
         //list = dao.boardList(start, end);
    	map.put("start", start);
    	map.put("end", end);
    	
    	list = dao.adminAccountList_last_1year(map);
      }
      
      // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
	}

	//계좌조회 - 5년이상 미거래 & 중지상태
	@Override
	public void adminAccountList_last_5year(HttpServletRequest req, Model model) {
		logger.info("service - adminAccountList_last_5year");
		  String pageNum = req.getParameter("pageNum");

	      Paging paging = new Paging(pageNum);

	      Map<String, Object> map = new HashMap<String, Object>();
	      
	      // 5-1단계. 전체 게시글 갯수 카운트
	      int total = dao.cntAccountList_last_5year();
	      paging.setTotalCount(total);

	      int start = paging.getStartRow(); // 페이지별 시작번호
	      int end = paging.getEndRow(); // 페이지별 끝번호

	      // 5-2단계. 게시글 목록
	      List<AdminSearchDTO> list = null;
	      
	      if (total > 0) {
	         //list = dao.boardList(start, end);
	    	map.put("start", start);
	    	map.put("end", end);
	    	
	    	list = dao.adminAccountList_last_5year(map);
	      }
	      
	      // 6단계. 성공=1, 실패=0, jsp로 처리 결과 전달(setAttribute)
	      model.addAttribute("list", list);
	      model.addAttribute("paging", paging);
	}
	
	//계좌조회 - 상태에따른 List
	@Override
	public void adminAccountList_state(HttpServletRequest req, Model model) {
	      List<AdminSearchDTO> list = null;
	      String account_state = req.getParameter("account_state");
	      list = dao.adminAccountList_state(account_state);
	      model.addAttribute("list", list);
	}
	
	//계좌상태 변경 - 일괄 거래중지처리
	@Override
	public void adminAccountChange_stop(HttpServletRequest req, Model model) {
		 logger.info("서비스 -> adminAccountChange_stop");
		 
		 int result = dao.adminAccountChange_stop();
		 model.addAttribute("result", result);
	}
	
	//계좌상태 변경 - 일괄 휴면처리
	@Override
	public void adminAccountChange_sleep(HttpServletRequest req, Model model) {
		 logger.info("서비스 -> adminAccountChange_sleep");
		 
		 int result = dao.adminAccountChange_sleep();
		 model.addAttribute("result", result);
	}
	
	//본인의 거래중지/휴면/해지상태 계좌전부
	@Override
	public void sleepDisableAcc(HttpServletRequest req, Model model) {
	      List<AdminSearchDTO> list = null;
	      String id = (String)req.getSession().getAttribute("customerID");
	      list = dao.sleepDisableAcc(id);
	      model.addAttribute("list", list);
	}
	//본인의 거래중지상태 계좌조회
	@Override
	public void memberAccountList_stopped(HttpServletRequest req, Model model) {
	      List<AdminSearchDTO> list = null;
	      String id = (String)req.getSession().getAttribute("customerID");
	      list = dao.memberAccountList_stopped(id);
	      model.addAttribute("list", list);
	}
	//본인의 휴면상태 계좌조회
	@Override
	public void memberAccountList_state(HttpServletRequest req, Model model) {
	      List<AdminSearchDTO> list = null;
	      String id = (String)req.getSession().getAttribute("customerID");
	      list = dao.memberAccountList_state(id);
	      model.addAttribute("list", list);
	}
	//본인의 해지상태 계좌조회
	@Override
	public void memberAccountList_cancled(HttpServletRequest req, Model model) {
	      List<AdminSearchDTO> list = null;
	      String id = (String)req.getSession().getAttribute("customerID");
	      list = dao.memberAccountList_cancled(id);
	      model.addAttribute("list", list);
	}
	
	//계좌상태 변경 - 정상화
	@Override
	public void adminAccountChange_normal(HttpServletRequest req, Model model) {
		 logger.info("서비스 -> adminAccountChange_normal");
		 
		 String account=req.getParameter("account");
		 int insertCnt=dao.adminAccountChange_normal(account);
		 model.addAttribute("insertCnt", insertCnt);
	}

	//계좌상태 변경 - 해지처리
	@Override
	public void adminAccountChange_cancle(HttpServletRequest req, Model model) {
		logger.info("서비스 -> adminAccountChange_cancle");
		
		String account=req.getParameter("account");
		int insertCnt=dao.adminAccountChange_cancle(account);
		model.addAttribute("insertCnt",insertCnt);
	}
	
	//계좌번호 1건 조회
	@Override
	public void searchAccount(HttpServletRequest req, Model model) {
		logger.info("서비스 -> searchAccount"); 
		
		String account=req.getParameter("account");
		AdminSearchDTO dto;
		
		dto=dao.searchAccount(account);
		model.addAttribute("dto", dto);
		
	}
}
