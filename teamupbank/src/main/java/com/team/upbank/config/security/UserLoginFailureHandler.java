package com.team.upbank.config.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.upbank.injune.auth.entity.Member;
import com.team.upbank.injune.auth.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


//로그인 실패시 작동
@Slf4j
@RequiredArgsConstructor
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    //로그인 실패할경우 자동으로 실행하는 메서드
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        System.out.println("<<< UserLoginFailureHandler - onAuthenticationFailure 진입 >>>");

        String strId = request.getParameter("id");
        String strPwd = request.getParameter("password");

        Member member = memberRepository.findById(strId).orElse(null);


        if (member != null) {
            //암호화된 비밀번호 가져오기
            String encryptPassword = member.getPassword();
            System.out.println("화면에서 입력받은 비밀번호 : " + strPwd);
            System.out.println("암호화 된 비밀번호 : " + encryptPassword);
            log.info(encryptPassword);

            if (passwordEncoder.matches(strPwd, encryptPassword)) {
                System.out.println("<<< 이메일인증 >>>");
                request.setAttribute("errorMsg", "이메일인증하세요");
            } else {
                System.out.println("<<< 비밀번호 불일치 >>>");
                request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
            }
        } else {
            System.out.println("<<< 아이디 불일치 >>>");
            request.setAttribute("errorMsg", "아이디가 일치하지 않습니다.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/chaey/login.jsp");
        dispatcher.forward(request, response);
    }

}
