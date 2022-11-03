package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.OrderDTO;

public class OrderDAOImpl implements OrderDAO{
	DataSource dataSource;
	//1.싱글톤 방식 : 객체를 한번만 생성

	//1-1. 인스턴스 생성
	private static OrderDAOImpl instance = new OrderDAOImpl();

	//1-2. getInstance 메서드 생성
	public static OrderDAOImpl getInstance() {
		if(instance == null) {
			instance = new OrderDAOImpl();
		}
		return instance;
	}

	private OrderDAOImpl() {
		try {
			//주의 : import javax.naming
			Context context = new InitialContext();
			//import : javax.sql.DataSource;
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_117_csg");

		}catch(NamingException e) {
			e.printStackTrace();
		}
	} 
	
	//주문페이지
	@Override
	public OrderDTO orderPage(int pdNo, String id) {
		 System.out.println("DAO - 주문페이지 ");
	      
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;
		OrderDTO dto = new OrderDTO();
         try {
            conn = dataSource.getConnection();
            
            // 2. strId(로그인 화면에서 입력받은 세션id)와 일치하는 데이터가 존재하는지 조회
            String sql ="SELECT *  FROM mvc_customer_cart t "
                    + "JOIN  mvc_product_tbl p ON t.pdNo = p.pdNo JOIN mvc_customer c ON t.id = c.id where t.pdNo=? AND t.id=?";
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, pdNo);
           pstmt.setString(2, id);
           rs = pstmt.executeQuery();
            
            //3. ResultSet에 id와 일치하는 한 사람의 회원정보가 존재하면
           if(rs.next()) {
               dto.setId(rs.getString("id"));      //rs.getString("컬럼명");
               dto.setName(rs.getString("name"));
               dto.setAddress(rs.getString("address"));
               dto.setHp(rs.getString("hp"));
               dto.setPdNo(rs.getInt("pdNo"));
               dto.setPdName(rs.getString("pdName"));
               dto.setPdImg(rs.getString("pdImg"));
               dto.setPrice(rs.getInt("price"));
               dto.setCartNo(rs.getInt("cartNo"));
               dto.setCartCnt(rs.getInt("cartCnt"));
               dto.setMoney(rs.getInt("price")*rs.getInt("cartCnt"));
           }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            //사용한 자원 해제
            try {
               if(pstmt != null) pstmt.close();
               if(conn != null) conn.close();
            }catch(SQLException e) {
               e.printStackTrace();
            }
         }
      return dto;
   }
	//주문갯수
	@Override
	public int orderCnt() {
		System.out.println("dao - CartCnt");
		int selectCnt = 0;
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;


		try {
			conn = dataSource.getConnection();
			String sql = "SELECT COUNT(*) as cnt FROM mvc_order_tbl ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = rs.getInt("cnt");
				System.out.println("갯수 : " +selectCnt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//사용한 자원 해제
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}
	
	
	// 주문요청 ( 주문목록 추가 )
	@Override
	public OrderDTO orderAdd(OrderDTO dto) {
		System.out.println("dao - 주문요청");

		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			
			//입력받은 모든 값을 받아와 order테이블에 추가해준다.
			String sql = "INSERT INTO mvc_order_tbl(id, orderNo, pdNo, cartNo, orderdate, state, orderName, orderaddress, orderhp, orderCnt) "
					+ "VALUES(?,(SELECT NVL(MAX(orderNo) + 1, 1) FROM mvc_order_tbl),?,?, default, default,?,?,?,?)";
																					     //주문날짜, 상태는 default 값을 저장한다.
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());			//주문ID
			pstmt.setInt(2, dto.getPdNo());				//주문상품번호
			pstmt.setInt(3, dto.getCartNo());			//장바구니번호
			pstmt.setString(4, dto.getOrderName()); 	//수령인 
			pstmt.setString(5, dto.getOrderaddress());	//수령주소
			pstmt.setString(6, dto.getOrderhp());		//수령인 핸드폰번호
			pstmt.setInt(7, dto.getOrderCnt());			//주문수량
			rs = pstmt.executeQuery();

			// 3. ResultSet에 id와 일치하는 한 사람의 회원정보가 존재하면
			if (rs.next()) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
		
		
		
	//주문목록
	@Override
	public List<OrderDTO> orderList(String id) {
		System.out.println("DAO - 주문목록");
		
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;
		List<OrderDTO> list = null;
		
		try {
			conn = dataSource.getConnection();
			//주문id를 기준으로 order테이블 정보 조회. 상품, 고객 테이블도 JOIN해서 정보를 가져오며 sate상태 orderDate기준을 맞춰 정렬한다.
			String sql ="SELECT *  FROM mvc_order_tbl o JOIN mvc_product_tbl p  ON o.pdNo = p.pdNo "
												     +" JOIN mvc_customer c ON o.id = c.id "
							    +" WHERE o.id=? "
					   + "ORDER BY DECODE(state,'주문요청',1,'주문승인',2,'구매확정',3,'환불요청',4,'환불승인',5,'주문취소',6), orderdate DESC";
										//정렬순위. 주문요청을 최우선순위에 두었고 주문날짜도 2순위로 결정
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){

				list = new ArrayList<OrderDTO>();

				do {
					OrderDTO dto = new OrderDTO();
					dto.setId(rs.getString("id"));
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPrice(rs.getInt("price"));
					dto.setOrderCnt(rs.getInt("orderCnt"));
					dto.setOrderNo(rs.getInt("orderNo"));
					dto.setState(rs.getString("state"));
					dto.setOrderName(rs.getString("orderName"));
					dto.setOrderaddress(rs.getString("orderaddress"));
					dto.setOrderhp(rs.getString("orderhp"));
					dto.setOrderdate(rs.getDate("orderdate"));
					
					//배송비처리(주문수량*상품가격은 money에 저장. 만약 주문금액이 150,000원 이하면 배송비 15,000원 추가 )
					int money = rs.getInt("price")*rs.getInt("orderCnt");
					if(dto.getMoney()<=150000){
						dto.setMoney(money + 15000);
					}else{
						dto.setMoney(money);
					}
					//list에 모든 값을 담는다.
					list.add(dto);
				} while (rs.next());

	         }
	      } catch (SQLException e) {
	         e.printStackTrace();

	      } finally {
	         //사용한 자원 해제
	         try {
	            if (rs != null)   rs.close();
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }

	//주문취소 <고객용>
	@Override
	public int cancelOrder(int orderNo) {
		 System.out.println("dao - 주문취소");
		 // <sql연결>
	   	  Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updateCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         //state는 처음 insert될 때 default 값이 '주문요청'이다. 주문취소로 변경해준다.
	         String sql ="UPDATE mvc_order_tbl SET state='주문취소' WHERE orderNo=? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, orderNo);

	         updateCnt =  pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         //사용한 자원 해제
	         try {
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		return updateCnt;
	}
	//구매확정 <고객용>
	@Override
	public int buyOrder(int orderNo) {
		 System.out.println("dao - 구매확정");
		 // <sql연결>
	   	  Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updateCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         //state를 구매확정으로 변경해준다.
	         String sql ="UPDATE mvc_order_tbl SET state='구매확정' WHERE orderNo=? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, orderNo);

	         updateCnt =  pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         //사용한 자원 해제
	         try {
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		return updateCnt;
	}	
	//환불요청 처리 <고객용>
		@Override
		public int refundOrder(int orderNo) {
			 System.out.println("dao - 환불요청");
			 //<sql연결>
		   	  Connection conn = null;
		      PreparedStatement pstmt = null;
		      int updateCnt = 0;
		      
		      try {
		         conn = dataSource.getConnection();
		         // 환불요청으로 state 변경
		         String sql ="UPDATE mvc_order_tbl SET state='환불요청' WHERE orderNo=? ";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, orderNo);

		         updateCnt =  pstmt.executeUpdate();
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         //사용한 자원 해제
		         try {
		            if (pstmt != null)pstmt.close();
		            if (conn != null)   conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
			return updateCnt;
		}	
	
	//컨펌목록 <관리자용>
	@Override
	public List<OrderDTO> adminConfirm() {
		System.out.println("DAO - AdminConfirm");
		
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;
		List<OrderDTO> list = null;
		
		try {
			conn = dataSource.getConnection();
			//order테이블을 조회. 상품테이블과 함께 조회하며 구매요청, 환불요청에대한 값만 출력한다. 먼저 주문된 상품 정렬
			String sql ="SELECT * FROM MVC_ORDER_TBL o JOIN mvc_product_tbl p ON o.pdNo = p.pdNo "
					 		  + "WHERE state LIKE '%요청' ORDER BY orderdate ASC";
												
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){

				list = new ArrayList<OrderDTO>();

				do {
					OrderDTO dto = new OrderDTO();
					dto.setId(rs.getString("id"));
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPrice(rs.getInt("price"));
					dto.setOrderCnt(rs.getInt("orderCnt"));
					dto.setOrderNo(rs.getInt("orderNo"));
					dto.setState(rs.getString("state"));
					dto.setOrderName(rs.getString("orderName"));
					dto.setOrderaddress(rs.getString("orderaddress"));
					dto.setOrderhp(rs.getString("orderhp"));
					dto.setOrderdate(rs.getDate("orderdate"));
					dto.setMoney(rs.getInt("price")*rs.getInt("orderCnt"));
					list.add(dto);
				} while (rs.next());
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();

	      } finally {
	         //사용한 자원 해제
	         try {
	            if (rs != null)   rs.close();
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }
	
	//주문승인(관리자)
	@Override
	public int confirmOrder() {
		System.out.println("dao - 주문승인(관리자)");
		 
	   	  Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updateCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql ="UPDATE mvc_order_tbl SET state='주문승인' WHERE state='주문요청'";
	         pstmt = conn.prepareStatement(sql);
	         updateCnt =  pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         //사용한 자원 해제
	         try {
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		return updateCnt;
	}
	
	
	
	//환불승인(관리자) 
	@Override
	public int confirmRefund() {
		 System.out.println("dao - 환불승인(관리자)");
		 
	   	  Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updateCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql ="UPDATE mvc_order_tbl SET state='환불승인' WHERE state='환불요청'";
	         pstmt = conn.prepareStatement(sql);

	         updateCnt =  pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         //사용한 자원 해제
	         try {
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		return updateCnt;
	}
	

	//관리자 결산 <상품별 매출액>
	@Override
	public List<OrderDTO> adminSoldView() {
		System.out.println("DAO - AdminSoldView ");
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;
		List<OrderDTO> list = null;
		
		try {
			conn = dataSource.getConnection();
					//상품정보, 상품별 주문수량, 상품 매출액을 조회하기위해 상품,주문,고객 테이블과 JOIN							
			String sql ="SELECT p.PDNO, p.pdImg, p.PDNAME, sum(o.ORDERCNT) as totalCnt, sum(p.PRICE * o.ORDERCNT) as totalMoney" + 
						"  FROM mvc_product_tbl p 			"+ 
						"  JOIN mvc_order_tbl o 			"+ 
						"    ON o.pdNo = p.pdNo         	"+ 
						"  JOIN mvc_customer c 				"+ 
						"	 ON c.id = o.id 				"+ 
						" WHERE o.STATE = '구매확정' 			"+ 
						" GROUP BY p.PDNO , p.PDNAME, p.pdImg"; 
					//GROUP BY해야만 p.PDNO, p.pdImg, p.PDNAME이 출력됨.
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){

				list = new ArrayList<OrderDTO>();

				do {
					OrderDTO dto = new OrderDTO();
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setTotalCnt(rs.getInt("totalCnt"));		//판매수량
					dto.setTotalMoney(rs.getInt("totalMoney"));	//매출액
					list.add(dto);
				} while (rs.next());
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();

	      } finally {
	         //사용한 자원 해제
	         try {
	            if (rs != null)   rs.close();
	            if (pstmt != null)pstmt.close();
	            if (conn != null)   conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }
	

}