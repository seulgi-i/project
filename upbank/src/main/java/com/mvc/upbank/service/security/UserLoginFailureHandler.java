package com.mvc.upbank.service.security;

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
public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
		this.sqlSession=sqlSession;
		this.passwordEncoder=passwordEncoder;
	}
	
	//로그인 실패할경우 자동으로 실행하는 메서드
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String strId = request.getParameter("id");
		String strPwd = request.getParameter("password");
		
		int cnt =sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.idCheck", strId);
		if(cnt != 0) {
			//암호화된 비밀번호 가져오기
			String encryptPassword = sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.pwdCheck", strPwd);
			
			if(passwordEncoder.matches(strPwd, encryptPassword)) {
				request.setAttribute("errorMsg", "이메일인증하세요");
			}else {
				request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			}
		}else {
			request.setAttribute("errorMsg", "아이디가 일치하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/relogin.do");
		dispatcher.forward(request, response);
	}

}
