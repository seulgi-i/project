package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_csg.dto.OrderDTO;


public interface OrderDAO {
	
	//주문페이지
	public OrderDTO orderPage(Map<String, Object> map);
	
	//주문갯수
	public int orderCnt();
	
	//주문요청
	public int orderAdd(OrderDTO dto);
	
	//주문목록
	public List<OrderDTO> orderList(String id);

	//주문취소
	public int cancelOrder(int orderNo);
	
	//환불요청 
	public int refundOrder(int orderNo);
	
	//구매확정 
	public int buyOrder(int orderNo);
		
	//관리자컨펌목록
	public List<OrderDTO> adminConfirm();
	
	//주문승인(관리자) - 재고감소 매출증가
	public int confirmOrder();
	
	//환불승인(관리자) - 재고증가 매출감소
	public int confirmRefund();
	
	//관리자 결산(구매확정 상품별 결산금액)
	public List<OrderDTO> adminSoldView();

	
}
