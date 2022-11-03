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

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO {

	DataSource dateSource;
	// 1.싱글톤 방식 : 객체를 한번만 생성

	// 1-1. 인스턴스 생성
	private static CustomerDAOImpl instance = new CustomerDAOImpl();

	// 1-2. getInstance 메서드 생성
	public static CustomerDAOImpl getInstance() {
		if (instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}

	// 1-3. 디폴트 생성자 접근제어자를 private로 생성
	private CustomerDAOImpl() {
		// 생성자 안에서 커넥션 풀 접근
		/*
		 * [커넥션 풀] : 매번 connection을 만들지 말고 커넥션 풀 이용(context.xml) DBCP(DateBase
		 * Connection Pool) 설정을 읽어서 커넥션을 발급받음. 1. Servers > Context.xml 파일의 Resource 객체에
		 * 추가 2. 접근 : lookup("java:comp/env/[커넥션풀 name]");으로 검색
		 */

		try {
			// 주의 : import javax.naming
			Context context = new InitialContext();
			// import : javax.sql.DataSource;
			dateSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_117_csg");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// ID중복확인 처리
	@Override
	public int idCheck(String strId) {
		System.out.println("dao - ID중복확인 처리");

		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dateSource.getConnection();
			String sql = "SELECT * FROM mvc_customer WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			rs = pstmt.executeQuery();

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

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("dao - 회원가입 처리");

		// 연결정보
		int insertCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결

		try {
			conn = dateSource.getConnection();
			String sql = "INSERT INTO mvc_customer(id, password, name, birthday, address, hp, email, regDate) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setDate(4, dto.getBirthday());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getHp());
			pstmt.setString(7, dto.getEmail());
			pstmt.setTimestamp(8, dto.getRegDate());

			// 이메일 인증키
			insertCnt = pstmt.executeUpdate(); // 입력 성공:1 , 입력실패:0
			System.out.println("insertCnt : " + insertCnt);

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

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(String strId, String strPassword) {

		// 연결정보
		int selectCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;

		try {
			conn = dateSource.getConnection();
			String sql = "SELECT *  FROM mvc_customer " + "WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			rs = pstmt.executeQuery(); // 입력성공:1, 실패 :0

			// 로그인한 id와 일치하고
			if (rs.next()) {
				// 패스워드와 일치하면 selectCnt =1
				if (strPassword.equals(rs.getString("password"))) {
					// 로그인 성공
					selectCnt = 1;

					// 패스워드가 불일치하면 selectCnt = -1;
				} else {
					selectCnt = -1;
				}

				// 로그인한 id와 불일치 (=비회원)
			} else {
				selectCnt = 0;
			}
			System.out.println("selectCnt : " + selectCnt);

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
		System.out.println("dao - idPasswordChk");
		return selectCnt;
	}

	// 회원정보 인증 및 탈퇴처리
	@Override
	public int deleteCustomer(String strId) {

		// 연결정보
		int deleteCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결

		try {
			conn = dateSource.getConnection();
			String sql = "DELETE FROM mvc_customer WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			// 이메일 인증키
			deleteCnt = pstmt.executeUpdate(); // 입력 성공:1 , 입력실패:0
			System.out.println("deleteCnt : " + deleteCnt);

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

		System.out.println("dao - deleteCustomer");
		return deleteCnt;
	}

	// 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("dao - getCustomerDetail ");

		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;

		// 1. CustimerDTO 바구니 생성
		CustomerDTO dto = new CustomerDTO();

		try {
			conn = dateSource.getConnection();

			// 2. strId(로그인 화면에서 입력받은 세션id)와 일치하는 데이터가 존재하는지 조회
			String sql = "SELECT *  FROM mvc_customer where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			rs = pstmt.executeQuery();

			// 3. ResultSet에 id와 일치하는 한 사람의 회원정보가 존재하면
			if (rs.next()) {
				dto.setId(rs.getString("id")); // rs.getString("컬럼명");
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setBirthday(rs.getDate("birthday"));
				dto.setAddress(rs.getString("address"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setRegDate(rs.getTimestamp("regDate"));
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

	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {

		// 연결정보
		int updateCnt = 0;
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결

		try {
			conn = dateSource.getConnection();
			String sql = "UPDATE mvc_customer " + "SET password = ? " + ",name = ? " + ",birthday = ? "
					+ ",address = ? " + ",hp = ? " + ",email = ? " + ",regDate = ? " + "WHERE id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setDate(3, dto.getBirthday());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getEmail());
			pstmt.setTimestamp(7, dto.getRegDate());
			pstmt.setString(8, dto.getId());

			// 이메일 인증키
			updateCnt = pstmt.executeUpdate(); // 입력 성공:1 , 입력실패:0
			System.out.println("updateCnt : " + updateCnt);

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

	@Override
	public List<CustomerDTO> customerList() {
		System.out.println("DAO - customerList");
		Connection conn = null; // 오라클 연결
		PreparedStatement pstmt = null; // sql 연결
		ResultSet rs = null;
		List<CustomerDTO> list = null;
		try {
			conn = dateSource.getConnection();
			String sql = "SELECT * FROM mvc_customer WHERE not id='admin' ORDER BY regdate DESC";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				list = new ArrayList<CustomerDTO>();

				do {
					CustomerDTO dto = new CustomerDTO();
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setAddress(rs.getString("address"));
					dto.setHp(rs.getString("hp"));
					dto.setEmail(rs.getString("email"));
					dto.setRegDate(rs.getTimestamp("regDate"));
					list.add(dto);
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

}