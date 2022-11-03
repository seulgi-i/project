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

import pj.mvc.jsp.dto.BoardCommentDTO;
import pj.mvc.jsp.dto.BoardDTO;

public class BoardDAOImpl implements BoardDAO {

   DataSource dataSource;
   // 1.싱글톤 방식 : 객체를 한번만 생성

   // 1-1. 인스턴스 생성
   private static BoardDAOImpl instance = new BoardDAOImpl();

   // 1-2. getInstance 메서드 생성
   public static BoardDAOImpl getInstance() {
      if (instance == null) {
         instance = new BoardDAOImpl();
      }
      return instance;
   }

   // 1-3. 디폴트 생성자 접근제어자를 private로 생성
   private BoardDAOImpl() {
      // 생성자 안에서 커넥션 풀 접근
      /*
       * [커넥션 풀] : 매번 connection을 만들지 말고 커넥션 풀 이용(context.xml) DBCP(DateBase
       * Connection Pool) 설정을 읽어서 커넥션을 발급받음. 1. Servers > Context.xml 파일의 Resource 객체에
       * 추가 2. 접근 : lookup("java:comp/env/[커넥션풀 name]"); //dataSource naming context
       * java:com/env/ => 웹어플리에키션의 리소스들이 배치되어 있는 곳으로 매핑된 리소스를 가져온다.
       */

      try {
         // 주의 : import javax.naming
         Context context = new InitialContext();
         // import : javax.sql.DataSource;
         dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_117_csg");

      } catch (NamingException e) {
         e.printStackTrace();
      }
   }

   // 게시글 목록
   @Override
   public List<BoardDTO> boardList(int start, int end) {
      System.out.println("DAO - boardList");

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<BoardDTO> list = null;

      try {
         conn = dataSource.getConnection();
//         //댓글 갯수 미포함
//         String sql = "SELECT * " + "      FROM (SELECT A.*, rownum as rn " + // 일련번호 매기기
//               "FROM(SELECT * FROM  mvc_board_tbl " + "ORDER BY num DESC" + ") A  " + " ) "
//               + "WHERE rn BETWEEN ? AND ?";

         
         //댓글 갯수 포함
         String sql ="SELECT * " + 
               "  FROM (SELECT A.*, rownum as rn " + 
               "               FROM(SELECT num, title, content, writer, password, readCnt, regDate,(SELECT COUNT(*) FROM mvc_board_comment_tbl WHERE board_num = b.num) comment_count " + 
               "                           FROM mvc_board_tbl b " + 
               "                         WHERE show = 'y' " +    //게시글 삭제시 댓글 안보여주기 위해서 show='n'으로 변경
               "                         ORDER BY num DESC " + 
               "                        ) A " + 
               "          ) " + 
               " WHERE rn BETWEEN ? AND ?";
         System.out.println("sql : " + sql);
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);

         rs = pstmt.executeQuery();

         if (rs.next()) {
            // 1. list 생성
            list = new ArrayList<BoardDTO>();
            do {
               // 2. dto 생성
               BoardDTO dto = new BoardDTO();
               // 3. dto에 결과(rs) 게시글 정보를 담는다.
               dto.setNum(rs.getInt("num"));
               dto.setTitle(rs.getString("title"));
               dto.setContent(rs.getString("content"));
               dto.setWriter(rs.getString("writer"));
               dto.setPassword(rs.getString("password"));
               dto.setReadCnt(rs.getInt("readCnt"));
               dto.setRegDate(rs.getDate("regDate"));
               dto.setComment_count(rs.getInt("comment_count"));

               // 4. list에 dto를 추가한다.
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

   // 게시글 갯수 구하기
   @Override
   public int boardCnt() {
      System.out.println("DAO - boardList");

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int selectCnt = 0;

      try {
         conn = dataSource.getConnection();
         String sql = "SELECT count(*) as cnt FROM mvc_board_tbl ";
         pstmt = conn.prepareStatement(sql);

         rs = pstmt.executeQuery();
         if (rs.next()) {
            selectCnt = rs.getInt("cnt");
         }

      } catch (SQLException e) {
         e.printStackTrace();

      } finally {
         try {
            //사용한 자원 해제
            if (rs != null)   rs.close();
            if (pstmt != null)pstmt.close();
            if (conn != null)   conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return selectCnt;
   }

   // 게시글 작성처리
   @Override
   public int boardInsert(BoardDTO dto) {
        System.out.println("DAO - boardInsert");
            
            //연결정보
            int insertCnt = 0;
            Connection conn = null; //오라클 연결
            PreparedStatement pstmt = null; //sql 연결
         
            
            
            try {
               conn = dataSource.getConnection();
               String sql = "INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate) "
                     + "VALUES((SELECT NVL(MAX(num) +1, 1) FROM mvc_board_tbl),?, ?, ?, ?, 0, sysdate) ";   
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, dto.getTitle());
               pstmt.setString(2, dto.getContent());
               pstmt.setString(3, dto.getWriter());
               pstmt.setString(4, dto.getPassword());
               
               insertCnt = pstmt.executeUpdate(); //입력 성공:1 , 입력실패:0
               
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

   // 조회수 증가
   @Override
   public void plusReadCnt(int num) {
      System.out.println("DAO - plusReadCnt");

      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = dataSource.getConnection();
         String sql = "UPDATE mvc_board_tbl " + "SET readCnt = readCnt+1 " + "WHERE num = ?";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         pstmt.executeUpdate();

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
   }

   // 게시글 상세페이지
   @Override
   public BoardDTO getBoardDetail(int num) {
      System.out.println("DAO - getBoardDetail");

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      BoardDTO dto = new BoardDTO();

      try {
         conn = dataSource.getConnection();
         String sql = "SELECT * FROM mvc_board_tbl WHERE num = ?";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            // 1. dto에 결과(rs) 게시글 정보를 담는다.
            dto.setNum(rs.getInt("num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setWriter(rs.getString("writer"));
            dto.setPassword(rs.getString("password"));
            dto.setReadCnt(rs.getInt("readCnt"));
            dto.setRegDate(rs.getDate("regDate"));

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

   // 비밀번호 인증
   @Override
   public String password_chk(int num, String password) {
      System.out.println("DAO - password_chk");

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String result = null;

      try {
         conn = dataSource.getConnection();
         String sql = "SELECT * FROM mvc_board_tbl WHERE num = ? AND password = ?";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         pstmt.setString(2, password);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            result = rs.getString("password");
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
      return result;
   }

   // 게시글 수정처리
   @Override
   public void updateBoard(BoardDTO dto) {
      System.out.println("DAO - updateBoard");

      Connection conn = null;
      PreparedStatement pstmt = null;
      
      try {
         conn = dataSource.getConnection();
         String sql ="UPDATE mvc_board_tbl SET title=?, content=?, password=? WHERE num=? ";


         pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, dto.getTitle());
              pstmt.setString(2, dto.getContent());
              pstmt.setString(3, dto.getPassword());
              pstmt.setInt(4, dto.getNum());

              pstmt.executeUpdate();
         
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
   }

   // 게시글 삭제처리
   @Override
   public void deleteBoard(int num) {
      
      System.out.println("DAO - updateBoard");

      Connection conn = null;
      PreparedStatement pstmt = null;
      
      try {
         conn = dataSource.getConnection();
            
//         String sql ="DELETE FROM mvc_board_tbl WHERE num=? "; -> 댓글 무관하게 삭제
         
         //전제조건 -> list where절에 show='y'추가(있는데 안보여줌. 삭제되는게 아님)
         String sql ="UPDATE mvc_board_tbl SET show ='n' WHERE num=?";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);

            pstmt.executeUpdate();
         
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
   }
   //댓글 추가처리
   @Override
   public void commentInsert(BoardCommentDTO dto) {
       System.out.println("DAO - boardInsert");
         
         //연결정보
         int insertCnt = 0;
         Connection conn = null; //오라클 연결
         PreparedStatement pstmt = null; //sql 연결
         
         try {
            conn = dataSource.getConnection();
            String sql = "INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_date) " + 
                  " VALUES((SELECT NVL(MAX(COMMENT_NUM) + 1, 1) FROM mvc_board_comment_tbl) , ?, ?, ?, sysdate)";   
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getBoard_num());
            pstmt.setString(2, dto.getWriter());
            pstmt.setString(3, dto.getContent());
            
           pstmt.executeUpdate(); //입력 성공:1 , 입력실패:0
            
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
   }
   
   //댓글목록처리
   @Override
   public List<BoardCommentDTO> commentList(int board_num) {

         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<BoardCommentDTO> list = null;
         
         
         try {
            conn = dataSource.getConnection();
            String sql = "select * from mvc_board_comment_tbl WHERE  board_num =? ORDER BY comment_num ASC ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                  // 1. list 생성
               list = new ArrayList<BoardCommentDTO>();
               do {
                  // 2. dto 생성
                  BoardCommentDTO dto = new BoardCommentDTO();
                  // 3. dto에 결과(rs) 게시글 정보를 담는다.
                dto.setComment_num(rs.getInt("comment_num"));
                 dto.setBoard_num(rs.getInt("board_num"));
                 dto.setWriter(rs.getString("writer"));
                 dto.setContent(rs.getString("content"));
                 dto.setReg_date(rs.getDate("reg_date"));
                  // 4. list에 dto를 추가한다.
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