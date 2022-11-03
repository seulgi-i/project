package com.team.upbank.config;

import com.team.upbank.config.security.UserAuthenticationService;
import com.team.upbank.config.security.UserDeniedHandler;
import com.team.upbank.config.security.UserLoginFailureHandler;
import com.team.upbank.config.security.UserLoginSuccessHandler;
import com.team.upbank.injune.auth.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserAuthenticationService userAuthenticationService;

    private final MemberRepository memberRepository;


    @Bean
    public SecurityContextHolder securityContextHolder() {
        return new SecurityContextHolder();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/css/**", "/static/js/**", "/img/**", "/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/v3/api-docs", "/configuration/**", "/swagger*/**", "/webjars/**").permitAll()
                .antMatchers("/customer/**").hasRole("MEMBER")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/doctor/**").hasAnyRole("DOCTOR","ADMIN")
                .anyRequest().permitAll();

        http.formLogin()
                .loginPage("/loginAction.do")
                .usernameParameter("id")
                .successHandler(new UserLoginSuccessHandler(memberRepository))  // 로그인 성공 핸들러
                .failureHandler(new UserLoginFailureHandler(memberRepository, (BCryptPasswordEncoder) passwordEncoder()))  // 로그인 실패 핸들러
                .permitAll();

        http.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/main")    // 로그아웃 성공시 리다이렉트 주소
                .invalidateHttpSession(true); //세션날리기

        http.exceptionHandling()
                .accessDeniedHandler(new UserDeniedHandler());

        http.httpBasic()
                .and()
                .cors()
                .and()
                .csrf().disable();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.addAllowedOrigin("http://localhost:3000");
        configuration.setAllowedMethods(Arrays.asList("HEAD", "GET", "POST", "PUT", "DELETE"));
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Cache-Control", "Content-Type", "X-ACCESS-TOKEN", "X-REFRESH_TOKEN"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userAuthenticationService).passwordEncoder(passwordEncoder());
    }


}