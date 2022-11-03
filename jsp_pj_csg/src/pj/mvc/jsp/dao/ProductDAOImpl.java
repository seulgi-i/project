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

import pj.mvc.jsp.dto.ProductDTO;

public class ProductDAOImpl implements ProductDAO{

	DataSource dataSource;
	//1.싱글톤 방식 : 객체를 한번만 생성

	//1-1. 인스턴스 생성
	private static ProductDAOImpl instance = new ProductDAOImpl();

	//1-2. getInstance 메서드 생성
	public static ProductDAOImpl getInstance() {
		if(instance == null) {
			instance = new ProductDAOImpl();
		}
		return instance;
	}

	private ProductDAOImpl() {
		try {
			//주의 : import javax.naming
			Context context = new InitialContext();
			//import : javax.sql.DataSource;
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_117_csg");

		}catch(NamingException e) {
			e.printStackTrace();
		}
	} 

	//상품 추가 처리
	@Override
	public int productInsert(ProductDTO dto) {
		System.out.println("dao - 상품 추가 처리");

		int insertCnt = 0;
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결

		try {
			conn = dataSource.getConnection();
			String sql ="INSERT INTO mvc_product_tbl(pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate) "
					+ "VALUES((SELECT NVL(MAX(pdNo)+1, 1) FROM mvc_product_tbl), ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getPdName());
			pstmt.setString(2, dto.getPdImg());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getBrand());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setInt(7, dto.getQuantity());
			pstmt.setString(8, dto.getStatus());

			insertCnt = pstmt.executeUpdate(); //입력 성공:1 , 입력실패:0
			System.out.println("insertCnt : " + insertCnt);

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
		return insertCnt;
	}

	//상품 갯수
	@Override
	public int productCnt() {
		System.out.println("dao - productCnt");
		int selectCnt = 0;
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;


		try {
			conn = dataSource.getConnection();
			String sql = "SELECT COUNT(*) as cnt FROM mvc_product_tbl ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = rs.getInt("cnt");
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

	//상품 목록
	@Override
	public List<ProductDTO> productList(int start, int end) {
		 System.out.println("DAO - productList");
		Connection conn = null; //오라클 연결
		PreparedStatement pstmt = null; //sql 연결
		ResultSet rs = null;
		List<ProductDTO> list = null;
		try {
			conn = dataSource.getConnection();
			String sql ="SELECT * " + 
		               "  FROM (SELECT A.*, rownum as rn " + 
		               "               FROM(SELECT* FROM mvc_product_tbl " +
		               "                         ORDER BY pdNo DESC " + 
		               "                        ) A " + 
		               "          ) " + 
		               " WHERE rn BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			
			if(rs.next()){

				list = new ArrayList<ProductDTO>();

				do {
					ProductDTO dto = new ProductDTO();
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setCategory(rs.getString("category"));
					dto.setBrand(rs.getString("brand"));
					dto.setContent(rs.getString("content"));
					dto.setPrice(rs.getInt("price"));
					dto.setQuantity(rs.getInt("quantity"));
					dto.setStatus(rs.getString("status"));
					dto.setIndate(rs.getDate("indate"));
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
	
	//상품 상세페이지
	@Override
	public ProductDTO productDetail(int pdNo) {
		 System.out.println("DAO - productDetail");

	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      //1. dto생성
	      ProductDTO dto = new ProductDTO();

	      try {
	         conn = dataSource.getConnection();
	         String sql = "SELECT * FROM mvc_product_tbl WHERE pdNo=?";

	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, pdNo);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            // 2. dto에 결과(rs) 게시글 정보를 담는다.
					dto.setPdNo(rs.getInt("pdNo"));
					dto.setPdName(rs.getString("pdName"));
					dto.setPdImg(rs.getString("pdImg"));
					dto.setCategory(rs.getString("category"));
					dto.setBrand(rs.getString("brand"));
					dto.setContent(rs.getString("content"));
					dto.setPrice(rs.getInt("price"));
					dto.setQuantity(rs.getInt("quantity"));
					dto.setStatus(rs.getString("status"));
					dto.setIndate(rs.getDate("indate"));

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
	      return dto;
	   }

	
	//상품 수정 처리
	@Override
	public int productUpdate(ProductDTO dto) {

	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updateCnt = 0;
	      
	      try {
	         conn = dataSource.getConnection();
	         String sql ="UPDATE mvc_product_tbl "
	        		 			+"SET pdName=?, brand=?, pdImg=?, category=?, content=?, price=?,  quantity=?, status=? "
	         					+ "WHERE pdNo=? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getPdName());
	         pstmt.setString(2, dto.getBrand());
	         pstmt.setString(3, dto.getPdImg());
	         pstmt.setString(4, dto.getCategory());
	         pstmt.setString(5, dto.getContent());
	         pstmt.setInt(6, dto.getPrice());
	         pstmt.setInt(7, dto.getQuantity());
	         pstmt.setString(8, dto.getStatus());
	         pstmt.setInt(9, dto.getPdNo());

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


	//상품 삭제 처리
	@Override
	public int productDelete(int pdNo) {
		 Connection conn = null;
	      PreparedStatement pstmt = null;
	      int deleteCnt = 0;
	      try {
	         conn = dataSource.getConnection();
	            
	         String sql ="DELETE FROM mvc_product_tbl WHERE pdNo=? ";

	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, pdNo);
	         deleteCnt = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();

	      } finally {
	         //사용한 자원 해제
	         try {
	            if (pstmt != null)pstmt.close();
	            if (conn != null)conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		return deleteCnt;
	}

	

	}

