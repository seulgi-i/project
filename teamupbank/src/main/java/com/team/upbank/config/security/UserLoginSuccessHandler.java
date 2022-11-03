package com.team.upbank.config.security;

import com.team.upbank.injune.auth.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;



//로그인 성공시 작동
@RequiredArgsConstructor
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{


	
	private final MemberRepository memberRepository;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("<<< UserLoginSuccessHandler - onAuthenticationSuccess 진입 >>>");
		
		AuthMember vo = (AuthMember) authentication.getPrincipal();
		System.out.println("UserVO : "+vo.getUsername());
		
		String msg = authentication.getName()+"님 환영합니다.";
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();


		request.setAttribute("msg", msg);
		request.getSession().setAttribute("customerID", authentication.getName()); //세션추가
		request.setAttribute("authorities", authorities);
		
		if(authorities.equals("ROLE_USER")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main.do");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.do");
			dispatcher.forward(request, response);
		}
	}
}
