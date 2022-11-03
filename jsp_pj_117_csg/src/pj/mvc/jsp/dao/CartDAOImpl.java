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

import pj.mvc.jsp.dto.CartDTO;

public class CartDAOImpl implements CartDAO {
	DataSource dataSource;
	// 1.싱글톤 방식 : 객체를 한번만 생성

	// 1-1. 인스턴스 생성
	private static CartDAOImpl instance = new CartDAOImpl();

	// 1-2. getInstance 메서드 생성
	public static CartDAOImpl getInstance() {
		if (instance == null) {
			instance = new CartDAOImpl();
		}
		return instance;
	}

	private CartDAOImpl() {
		try {
			// 주의 : import javax.naming
			Context context = new InitialContext();
			// import : javax.sql.DataSource;
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_117_csg");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 장바구니목록
	@Override
	public List<CartDTO> cartList(String id) {
		System.out.println("DAO - 장바구니목록");

		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;
		List<CartDTO> list = null;

		try {
			conn = dataSource.getConnection();
			//장바구니 상품 조회(상품테이블, 고객테이블과 JOIN 해서 각 테이블별 필요한 정보를 같이 보낸다)
			String sql = "SELECT *  FROM mvc_customer_cart t "
					+ "JOIN  mvc_product_tbl p ON t.pdNo = p.pdNo JOIN mvc_customer c ON t.id = c.id where t.id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				list = new ArrayList<CartDTO>();

				do {
					CartDTO dto = new CartDTO();
					dto.setId(rs.getString("id"));
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPrice(rs.getInt("price"));
					dto.setCartNo(rs.getInt("cartNo"));
					dto.setCartCnt(rs.getInt("cartCnt"));
					dto.setMoney(rs.getInt("cartCnt") * rs.getInt("price"));  //판매금액=수량*가격
					list.add(dto);	//list에 추가
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			// 사용한 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	//장바구니 상품갯수 (장바구니 목록 불러올 때 비었는지 체크하는 용도)
	@Override
	public int cartCnt() {
		System.out.println("dao - CartCnt");
		int selectCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			String sql = "SELECT COUNT(*) as cnt FROM mvc_customer_cart ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				selectCnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	// 장바구니 상품 추가
	@Override
	public int cartAdd(CartDTO dto) {
		System.out.println("dao - 장바구니 상품 추가");

		int insertCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결

		try {
			conn = dataSource.getConnection();
			// 장바구니 테이블에 입력 받은 값을 추가한다.
			String sql = "INSERT INTO mvc_customer_cart(id, pdNo, cartNo, cartCnt) "
					+ "VALUES(?, ?, (SELECT NVL(MAX(cartNo) + 1, 1) FROM mvc_customer_cart), ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getPdNo());
			pstmt.setInt(3, dto.getCartCnt());
			insertCnt = pstmt.executeUpdate(); // 입력 성공:1 , 입력실패:0

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
		return insertCnt;
	}

	// 장바구니 수량 변경
	@Override
	public int cartUpdate(CartDTO dto) {
		System.out.println("dao - 장바구니 수량 변경");

		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateCnt = 0;

		try {
			conn = dataSource.getConnection();
			//화면에서 입력받은 수량으로 변경해준다.
			String sql = "UPDATE mvc_customer_cart SET cartCnt=? WHERE cartNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCartCnt());
			pstmt.setInt(2, dto.getCartNo());

			updateCnt = pstmt.executeUpdate();

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
		return updateCnt;
	}

	// 장바구니 선택/개별 삭제
	@Override
	public int cartDelete(int pdNo, String id) {
		System.out.println("dao - 장바구니 선택/개별 삭제");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deleteCnt = 0;
		try {
			conn = dataSource.getConnection();
			//화면에서 받은 pdNo와 id에 해당하는 상품을 삭제한다.
			String sql = "DELETE FROM mvc_customer_cart WHERE pdNo=? AND id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdNo);
			pstmt.setString(2, id);

			deleteCnt = pstmt.executeUpdate();

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
		return deleteCnt;
	}

	// 장바구니 비우기
	@Override
	public int cartAllDelete(String id) {
		System.out.println("dao -  장바구니 비우기");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int AdeleteCnt = 0;
		try {
			conn = dataSource.getConnection();
			//ID에 해당하는 장바구니 상품 전부 삭제
			String sql = "DELETE FROM mvc_customer_cart WHERE id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			AdeleteCnt = pstmt.executeUpdate();

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
		return AdeleteCnt;
	}

	// 중복상품 처리
	@Override
	public int checkProduct(int pdNo, String id) {
		System.out.println("dao - 중복상품 처리");
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			//id별 카트에 전송받은 pdNo와 같은 번호가 있는지 조회
			String sql = "SELECT * FROM mvc_customer_cart WHERE pdNo=? AND id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdNo);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			//조회결과 입력된 값이 있을 때 1을 반환
			if (rs.next()) {
				selectCnt = 1;
			}
			System.out.println("selectCnt => " + selectCnt);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

}
