package com.mvc.upbank.dao;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.util.SettingValues;


@Repository
public class CustomerDAOImpl implements CustomerDAO{
//DAO : jdbc.. db관련 업무처리
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAO.class);
	
	@Autowired
	SqlSession sqlSession;	
	//dataSource-config.xml - 컨넥션풀+마이바티스(mapper부분, pom.xml에도 설정되어있어야함)
	
	//회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		logger.info("dao-insertCustomer");
		
		int insertCnt = sqlSession.insert("com.mvc.upbank.dao.CustomerDAO.insertCustomer", dto);
		logger.info("insertCnt ->" + insertCnt);
		return insertCnt;
		// = return sqlSession.insert("com.mvc.upbank.dao.CustomerDAO.insertCustomer", dto);
	}

	
	// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	@Override
   public void sendEmail(String email, String key) {
      
      final String username = SettingValues.ADMIN;   // 네이버 이메일 ID : @nave.com은 입력하지 않는다. 
      final String password = SettingValues.PW;      // 네이버 비밀번호 : 
      final String host = "smtp.naver.com"; // Google일 경우 smtp.gmail.com  
      int port=465; //포트번호  

      // 메일 내용  
      String recipient = "hhc978@naver.com"; //받는 사람의 메일주소를 입력해주세요.  
      String subject = "회원가입 인증 메일"; //메일 제목 입력해주세요.  
      
      String content = "회원가입을 축하드립니다. 링크를 눌러 회원가입을 완료하세요."
             + "<a href='http://localhost/upbank/emailChkAction.do?key=" + key + "'>링크</a>";
      
      Properties props = System.getProperties();  

      // 정보를 담기 위한 객체 생성  
      // SMTP 서버 정보 설정  
      props.put("mail.smtp.host", host);  
      props.put("mail.smtp.port", port);  
      props.put("mail.smtp.auth", "true");  
      props.put("mail.smtp.ssl.enable", "true");  
      props.put("mail.smtp.ssl.trust", host);  

      //Session 생성  
      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  
         String un=username;  
         String pw=password;  
         @Override
		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {  
            return new javax.mail.PasswordAuthentication(un, pw);  
         }  
      });  
      session.setDebug(true); //for debug  
      
      try {
         Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
         mimeMessage.setFrom(new InternetAddress("hhc978@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.  
         mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅  
         mimeMessage.setSubject(subject); //제목셋팅  
         // mimeMessage.setText(body); //내용셋팅 
         mimeMessage.setContent(content, "text/html; charset=utf-8");
         Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
         logger.info("<<<< Email SEND >>>>");
      } catch(Exception e) {
         e.printStackTrace();
      }   

   }
	
   //시큐리티 : 로그인 전 이메일 인증을 해야 한다.
   @Override
	public int selectKey(String key) {
	   logger.info("dao - selectKey");
	   
	   int selectCnt =sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.selectKey", key); 
		return selectCnt;
	}

   //시큐리티 - 등급변경
	@Override
	public int updateGrade(String key) {
		logger.info("dao - updateGrade");
		
		int updateCnt =sqlSession.update("com.mvc.upbank.dao.CustomerDAO.updateGrade", key);
		return updateCnt;
	}

	
	//ID중복확인처리
	@Override
	public int idCheck(String strId) {
		logger.info("dao-ID중복확인처리");
	
		//String sql= "SELECT * FROM mvc_customer_tbl WHERE id=?";
		
		//1건 selectOne, 다건 : selectList
		int selectCnt = sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.idCheck", strId);
		
		return selectCnt;
	}


	//로그인 처리 +회원정보 인증(수정,탈퇴 : 아이디 비번 일치여부 확인해야하므로)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		
		logger.info("dao-idPasswordChk 호출");
				
		//String sql= "SELECT * FROM mvc_customer_tbl "
		//		   +"WHERE id=?";
		
		int selectCnt = sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.idPasswordChk", map);
		
		logger.info("selectCnt : " + selectCnt);
			
	
		return selectCnt;
	}
	
	//계좌,비번,이름 확인
	@Override
	public SearchDTO accountInfobyPw(Map<String, Object> map) {
		logger.info("dao-accountInfobyPw 호출");
		
		SearchDTO dto=sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.accountInfobyPw", map);
		return dto;
	}
	
	//Account 테이블 아이디 등록
	@Override
	public int registerId(Map<String, Object> map) {
		logger.info("dao-registerId 호출");
		
		int updateCnt=sqlSession.update("com.mvc.upbank.dao.CustomerDAO.registerId", map);
		return updateCnt;
	}
	
	//회원정보 인증 및 회원 수정 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		logger.info("dao-getCustomerDetail 호출");
		
		CustomerDTO dto = sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.getCustomerDetail", strId);
		return dto;
		
	}

	//회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		logger.info("dao-회원수정처리 확인용");
		
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.CustomerDAO.updateCustomer", dto);
		return updateCnt;
	}
	
	//회원정보 수정 처리 - 비번제외
	@Override
	public int updateCustomer2(CustomerDTO dto) {
		logger.info("dao-회원수정처리 확인용2");
		
		int updateCnt = sqlSession.update("com.mvc.upbank.dao.CustomerDAO.updateCustomer2", dto);
		return updateCnt;
	}
	
//	//회원정보 인증 및 탈퇴처리
//	@Override
//	public int deleteCustomer(String strId) {
//		
//		logger.info("dao-인증및 탈퇴처리 확인용");
//		
//		int deleteCnt = sqlSession.delete("spring.mvc.pj_117.dao.CustomerDAO.deleteCustomer", strId);
//				
//		logger.info("deleteCnt:" + deleteCnt); // 성공1 실패0
//			
//		return deleteCnt;
//	}
//
//		
//	
//		
//
	
	
	
	
	
}
