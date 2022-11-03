package spring.mvc.pj_117_csg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_csg.dto.OrderDTO;
import spring.mvc.pj_117_csg.dto.ProductDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	SqlSession sqlSession;
	
	//주문페이지
	@Override
	public OrderDTO orderPage(Map<String, Object> map) {
		 System.out.println("DAO - 주문페이지 ");
		 
		 OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		 OrderDTO dto = dao.orderPage(map);

      return dto;
   }
	//주문갯수
	@Override
	public int orderCnt() {
		System.out.println("dao - CartCnt");
		
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int selectCnt = dao.orderCnt();
		
		return selectCnt;
	}
	
	
	// 주문요청 ( 주문목록 추가 )
	@Override
	public int orderAdd(OrderDTO dto) {
		System.out.println("dao - 주문요청");

		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int insertCnt = dao.orderAdd(dto);
				 
		return insertCnt;
	}
		
		
		
	//주문목록
	@Override
	public List<OrderDTO> orderList(String id) {
		System.out.println("DAO - 주문목록");
		
		
		List<OrderDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.OrderDAO.orderList", id);
			
			
	    return list;
	 }

	//주문취소 <고객용>
	@Override
	public int cancelOrder(int orderNo) {
		 System.out.println("dao - 주문취소");
		 
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int updateCnt = dao.cancelOrder(orderNo);
			
		 
		return updateCnt;
	}
	//구매확정 <고객용>
	@Override
	public int buyOrder(int orderNo) {
		 System.out.println("dao - 구매확정");
		
		 OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
	     int updateCnt = dao.buyOrder(orderNo);
	    
		return updateCnt;
	}	
	//환불요청 처리 <고객용>
		@Override
		public int refundOrder(int orderNo) {
			 System.out.println("dao - 환불요청");
			 
			OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		    int updateCnt = dao.refundOrder(orderNo);
		       
		 return updateCnt;
		}	
	
	//컨펌목록 <관리자용>
	@Override
	public List<OrderDTO> adminConfirm() {
		System.out.println("DAO - adminConfirm");
		
		List<OrderDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.OrderDAO.adminConfirm");
			 
	    return list;
	 }
	
	//주문승인(관리자)
	@Override
	public int confirmOrder() {
		System.out.println("dao - 주문승인(관리자)");
		
		
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
	    int updateCnt = dao.confirmOrder();
	      
	 return updateCnt;
	}
	
	
	//환불승인(관리자) 
	@Override
	public int confirmRefund() {
		 System.out.println("dao - 환불승인(관리자)");
		 
		 OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
	     int updateCnt = dao.confirmRefund();
	      
	        
	return updateCnt;
	}
	

	//관리자 결산 <상품별 매출액>
	@Override
	public List<OrderDTO> adminSoldView() {
		System.out.println("DAO - adminSoldView ");
		
		List<OrderDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.OrderDAO.adminSoldView");
		 
			
	      return list;
	   }
	

}