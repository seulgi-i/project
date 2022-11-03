package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.Paging;
import pj.mvc.jsp.dao.CartDAO;
import pj.mvc.jsp.dao.CartDAOImpl;
import pj.mvc.jsp.dto.CartDTO;


public class CartServiceImpl implements CartService{
	
	//장바구니 목록
	@Override
	public void cartListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
			System.out.println("서비스 => 장바구니 목록");
			
		    //3단계. 화면으로부터 입력받은 값을 dto에 담는다.
			String strId = (String) req.getSession().getAttribute("customerID");
	        //4단계. 싱글톤으로 dao객체 생성, 다형성 생성
			CartDAO dao = CartDAOImpl.getInstance();
			
			//5단계. 장바구니 목록 가져오기 (상품이 담겨있을 때)
			int total = dao.cartCnt();
		    List<CartDTO> list = null;
		      if (total > 0) {
		         list = dao.cartList(strId);
		      }
		   //6단계. jsp로 처리결과 전달
		   req.setAttribute("list", list);
	}
	
	//장바구니 추가
	@Override
	public void cartAddAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
	     	System.out.println("서비스 => 장바구니 등록");
	      
	      	// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
			String strId = (String) req.getSession().getAttribute("customerID");//세션ID
			int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenPdNo")); //기존제품번호
			String hiddenPdName = req.getParameter("hiddenPdName");			   //기존제품이름
			String hiddenPdImg = req.getParameter("hiddenPdImg");			   //기존제품이미지
			int hiddenPrice = Integer.parseInt(req.getParameter("hiddenPrice"));//가격
			int cartCnt = Integer.parseInt(req.getParameter("cartCnt"));		//수량
			
	        CartDTO dto = new CartDTO();
			dto.setPdNo(hiddenPdNo);
			dto.setCartCnt(cartCnt);
			dto.setPdName(hiddenPdName);
			dto.setPrice(hiddenPrice);
			dto.setPdImg(hiddenPdImg);
			dto.setId(strId);
	     
			// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
	        CartDAO dao = CartDAOImpl.getInstance();
	       
			// 5-1단계. 장바구니 중복상품 검사
			int selectCnt = dao.checkProduct(hiddenPdNo, strId);
			
			// 5-2단계. 장바구니에 해당상품이 없을 때만 장바구니 담기 가능.
			if (selectCnt != 1) { 
				dao.cartAdd(dto);
			}
			//6단계. jsp로 처리결과 전달
			req.setAttribute("selectCnt", selectCnt);
	   }
	
	
	//장바구니 수량 변경
	@Override
	public void cartUpdateAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
	      System.out.println("서비스 => 장바구니 수량 변경");
	      
	      // 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
	      String strId = (String)req.getSession().getAttribute("customerID");
	      int cartNo=Integer.parseInt(req.getParameter("cartNo"));
	   
	      CartDTO dto = new CartDTO();
	      dto.setCartCnt(Integer.parseInt(req.getParameter("cartCnt")));  //수량
	      dto.setCartNo(cartNo);										  //상품번호
	      System.out.println("수량변경"+(Integer.parseInt(req.getParameter("cartCnt"))));
	       
	      //4단계. 싱글톤으로 dao객체 생성, 다형성 생성
	      CartDAO dao = CartDAOImpl.getInstance();
	       
	      //5단계. 상품정보 insert
	      int updateCnt = dao.cartUpdate(dto);
	       
	      //6단계. jsp로 처리결과 전달
	      req.setAttribute("updateCnt", updateCnt);
	      
	   }
	//장바구니 개별/선택 삭제
	@Override
	public void cartDeleteAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		  // 3단계. 화면으로부터 입력받은 값
		  System.out.println("서비스 -> 장바구니 선택 삭제");
		  String strId = (String)req.getSession().getAttribute("customerID");
		  
		  //화면에서 체크된 상품의 상품번호만 가져온다
		  String[] pdNo_arr = req.getParameterValues("selectCheck"); 
	      
	      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
	      CartDAO dao = CartDAOImpl.getInstance();
	      
	      // 5단계. dao실행. 체크한 상품이 있을 때만 실행하며, 상품갯수만큼 반복해서 장바구니 삭제 진행
	      int deleteCnt=0;
	      if(pdNo_arr != null) {
	    	  for(int i=0; i<pdNo_arr.length; i++) {
	    		  int pdNo = Integer.parseInt(pdNo_arr[i]);
		    	  deleteCnt = dao.cartDelete(pdNo, strId);
		      }
	      	}
	      // 6단계. jsp로 처리결과 전달
	      req.setAttribute("deleteCnt", deleteCnt);
	    }
	
	//장바구니 비우기
	@Override
	public void cartAllDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		  System.out.println("서비스 ->  장바구니 비우기");
		  
		  // 3단계. 화면으로부터 입력받은 값
		  String strId = (String) req.getSession().getAttribute("customerID");
	      
	      // 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
	      CartDAO dao = CartDAOImpl.getInstance();
	      
	      // 5단계. 장바구니 비우기
	      int AdeleteCnt = dao.cartAllDelete(strId);
	      
	      // 6단계. jsp로 처리결과 전달
	      req.setAttribute("AdeleteCnt", AdeleteCnt);
	      }
	}

