package spring.mvc.pj_117_csg.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_117_csg.dao.CartDAO;
import spring.mvc.pj_117_csg.dao.OrderDAO;
import spring.mvc.pj_117_csg.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO dao;
	
	@Autowired
	CartDAO cdao;
	///////////////////// 고객용 //////////////////////////
	
	// 주문페이지
	@Override
	public void orderPageAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {

		// 3단계. 화면으로부터 입력받은 값을 받는다. 받는 값이 2개 이상이면 DTO에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		String[] pdNo_arr = req.getParameterValues("selectCheck"); //체크된 pdNo값들을 받는다.

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5단계. DTO 담을 큰바구니 준비
		List<OrderDTO> list = new ArrayList<>();
		
		// 5-2단계. 3단계에서 입력받은 pdNo갯수만큼 반복문 실행하며 주문페이지에 담는다
		for (int i = 0; i < pdNo_arr.length; i++) {
			OrderDTO dto = new OrderDTO();
			Map<String, Object> map = new HashMap<String, Object>();
			int pdNo = Integer.parseInt(pdNo_arr[i]);
			map.put("pdNo", pdNo);
			map.put("id", strId);
			dto = dao.orderPage(map);
			list.add(dto);
			System.out.println("list : " + list);
		}
		//6단계. add된 lsit값을 jsp로 전달한다.
		model.addAttribute("list", list);
	}

	// 주문요청 ( 주문목록 추가 처리 )
	@Override
	public void orderAddAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("서비스 => 주문요청 처리 ");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다. 
		String strId = (String) req.getSession().getAttribute("customerID");
		String[] pdNo_arr = req.getParameterValues("pdNo");			//화면에 입력된 pdNo들을 배열로 받음 이렇게 하지 않으면 가장 마지막에 전송된 값만 가져온다.
		String[] cartNo_arr = req.getParameterValues("cartNo");		//화면에 입력된 cartNo들을 배열로 받음
		String orderName = req.getParameter("orderName");
		String orderaddress = req.getParameter("orderaddress");
		int orderCnt = Integer.parseInt(req.getParameter("cartCnt"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5-1단계. dto 담을 큰바구니 list 준비
		List<OrderDTO> list = new ArrayList<>();
		
		int pdNo = 0; //장바구니 비우기를위해 적어뒀음.
		
		// 5-2단계. 3단계에서 입력받은 pdNo갯수만큼 반복문 실행하며 필요한 모든 정보를 주문페이지에 담는다
		for (int i = 0; i < pdNo_arr.length; i++) {
			OrderDTO dto = new OrderDTO();
			dto.setId(strId);
			dto.setPdNo(Integer.parseInt(pdNo_arr[i])); 	// String-> int로 변경
			pdNo = Integer.parseInt(pdNo_arr[i]);			//장바구니 삭제할 매개변수
			dto.setCartNo(Integer.parseInt(cartNo_arr[i])); // String-> int로 변경

			
			/* 수령인 이름, 주소, 핸드폰 번호가 공백이면 기존 customer테이블 값 넘겨주기
			 * 그렇지 않고 새로 입력받은 정보가 있다면 업데이트 후 값을 넘겨준다.          */
			
			
			if (!orderName.equals("")) { 	 //공백이 아니면(입력된 값이 있다면)
				dto.setOrderName(orderName); //화면에서 입력된 값을 set
			} else {
				dto.setOrderName(req.getParameter("name")); //customer테이블의 기존 name을 set
			}
			if (!orderaddress.equals("")) {
				dto.setOrderaddress(orderaddress);
			} else {
				dto.setOrderaddress(req.getParameter("address"));
			}
			// 핸드폰번호의 하이픈 자르기 , 수령자 핸드폰번호 공백시 고객정보 order테이블로 전송하기.
			String orderhp = "";
			String strHp1 = req.getParameter("hp1");
			String strHp2 = req.getParameter("hp2");
			String strHp3 = req.getParameter("hp3");
			if (!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
				orderhp = strHp1 + "-" + strHp2 + "-" + strHp3;
			} else {
				orderhp = req.getParameter("hp");
			}
			dto.setOrderhp(orderhp);
			
			// 장바구니 수량 order테이블 수량으로 전송
			dto.setOrderCnt(orderCnt);

			int insertCnt = dao.orderAdd(dto);

			// 담은 dto를 List로 전송!
			list.add(dto);
			
			//List에 dto가 담겼으면
			int deleteCnt = 0;
			if (list != null) {
				
				//장바구니 DAO에 있는 장바구니 삭제를 실행하기위해  싱글톤 방식으로 dao 객체 생성, 다형성 적용
				//CartDAO cdao = CartDAOImpl.getInstance();
				
				//장바구니에서 주문상품 삭제
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pdNo", pdNo);
				map.put("id", strId);
				deleteCnt = cdao.cartDelete(map); 
			}
			// 6단계. jsp로 처리결과 전달
			model.addAttribute("insertCnt", insertCnt);
			model.addAttribute("deleteCnt", deleteCnt);
			model.addAttribute("list", list);
		}
	}

	// 주문목록
	@Override
	public void orderListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 => 주문목록");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5-2단계. 주문목록 조회(DAO에서 전송받은 모든 값)
		List<OrderDTO> list = dao.orderList(strId);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}

	// 선택 주문취소
	@Override
	public void cancleOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 -> 주문취소(선택) ");
		
		// 3단계. 화면으로부터 입력 받은 orderNo를 배열에 담는다.
		String[] orderNo_arr = req.getParameterValues("orderSelectNo"); 

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 선택 상품갯수만큼 반복문 실행하며 주문취소 DAO 실행
		int updateCnt = 0;
		for (int i = 0; i < orderNo_arr.length; i++) {
			int orderNo = Integer.parseInt(orderNo_arr[i]);
			updateCnt = dao.cancelOrder(orderNo);
		}
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}

	// 주문취소(1건)
	@Override
	public void cancleAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 ->  주문취소(1건)");

		// 3단계. 화면으로부터 입력받은 값
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 주문취소 DAO 실행
		int updateCnt = dao.cancelOrder(orderNo);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}
	// 선택 환불요청
	@Override
	public void refundOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 -> 환불요청(선택)");
		
		// 3단계. 화면으로부터 입력 받은 orderNo를 배열에 담는다.
		String[] orderNo_arr = req.getParameterValues("orderSelectNo"); 

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5단계. 선택한 상품갯수만큼 반복하여 환불요청 DAO 실행
		int updateCnt = 0;
		for (int i = 0; i < orderNo_arr.length; i++) {
			int orderNo = Integer.parseInt(orderNo_arr[i]);
			updateCnt = dao.refundOrder(orderNo);
		}
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}	
	// 개별 환불요청
	@Override
	public void refundAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 -> 환불요청(개별)");
		
		// 3단계. 화면으로부터 입력받은 값 (배열X)
		int orderNo = Integer.parseInt(req.getParameter("orderNo")); 

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5단계. 환불 DAO 실행
		int updateCnt = dao.refundOrder(orderNo);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 개별 구매확정
	@Override
	public void buyAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 ->  구매확정(개별)");
		
		// 3단계. 화면으로부터 입력받은 값 (배열X)
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 구매확정 DAO 실행
		int updateCnt = dao.buyOrder(orderNo);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}	
	
	
	// 선택 구매확정
	@Override
	public void buyOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 ->  구매확정(선택)");

		// 3단계. 화면으로부터 입력 받은 orderNo를 배열에 담는다.
		String[] orderNo_arr = req.getParameterValues("orderSelectNo");	

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5단계. 배열의 갯수만큼 반복하여 구매확정 DAO 실행
		int updateCnt = 0;
		for (int i = 0; i < orderNo_arr.length; i++) {
			int orderNo = Integer.parseInt(orderNo_arr[i]);
			updateCnt = dao.buyOrder(orderNo);
		}
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}
	
	//////////////////// 관리자용 ////////////////////////
	
	
	
	//관리자 컨펌목록
	@Override
	public void confirmListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 => 관리자 컨펌목록");
		
		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		//OrderDAO dao = OrderDAOImpl.getInstance();

		// 5-2단계. 고객 주문요청&환불요청 목록 DAO실행
		List<OrderDTO> list = dao.adminConfirm();

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}

		
	// 주문승인(관리자)
	@Override
	public void confirmOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 ->  주문승인(관리자))");

		//싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		int updateCnt = dao.confirmOrder();
		model.addAttribute("updateCnt", updateCnt);
	}
	

	// 환불승인(관리자)
	@Override
	public void confirmRefundAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 ->  환불승인(관리자))");

		//싱글톤 방식으로 dao 객체 생성, 다형성 적용
		//OrderDAO dao = OrderDAOImpl.getInstance();

		int updateCnt = dao.confirmRefund();
		model.addAttribute("updateCnt", updateCnt);
	}

	// 결산
	@Override
	public void adminSoldViewAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 => 결산목록");
		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		
		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		//OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5-2단계. 주문목록 조회
		List<OrderDTO> list = dao.adminSoldView();

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}
}
