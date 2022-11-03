package spring.mvc.pj_117_csg.service.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

//로그인 실패시 작동
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	 @Autowired
	   SqlSessionTemplate sqlSession;
	 
	 @Autowired
	   BCryptPasswordEncoder passwordEncoder;  

	 public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
	      this.sqlSession = sqlSession;
	      this.passwordEncoder = passwordEncoder;
	   }

	 @Override
	   public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	         AuthenticationException exception) throws IOException, ServletException {

	      System.out.println("<<< UserLoginFailureHandler - onAuthenticationFailure 진입 >>>");
	      
	      String strId = request.getParameter("id");
	      String strPwd = request.getParameter("password");
	      
	      int cnt = sqlSession.selectOne("spring.mvc.pj_117_csg.dao.CustomerDAO.idCheck", strId);
	      if(cnt != 0) {
	         // 암호화된 비밀번호 가져오기
	         String encryptPassword = sqlSession.selectOne("spring.mvc.pj_117_csg.dao.CustomerDAO.pwdCheck", strId);
	         System.out.println("암호화된 비밀번호 : " + encryptPassword);
	         System.out.println("화면에서 입력받은 비밀번호 : " + strPwd);

	         // 입력한 비밀번호와 가입된 비밀번호(암호화된 비밀번호)가 일치하는지 여부
	         if(passwordEncoder.matches(strPwd, encryptPassword)) {
	            System.out.println("<<< 이메일 인증 >>>");
	            request.setAttribute("errorMsg", "이메일 인증하세요.!!");
	         } else {
	            System.out.println("<<< 비밀번호 불일치 >>>");
	            request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.!!");
	         }
	         
	      } else {
	         System.out.println("아이디 불일치");
	         request.setAttribute("errorMsg", "아이디가 일치하지 않습니다.");
	      }
	      
	      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/login/login.jsp");
	      dispatcher.forward(request, response);
	      
	   }

	}
