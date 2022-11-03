package com.mvc.upbank.service.security;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mvc.upbank.dto.CustomerDTO;
import com.mvc.upbank.dto.UserVO;

//로그인 인증처리 클래스(/loginAction.do에 의해 호출)
public class UserAuthenticationService implements UserDetailsService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	 /* 핵심코드
	    * 로그인 인증을 처리하는 메서드
	    * 1) 매개변수 username을 id로 수정
	    * 2) 매개변수로 전달된 아이디와 일치하는 레코드를 읽어온다.
	    * 3) 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교처리
	    * 4) 정보가 없으면 예외처리를 발생시키고, 있으면 해당정보를 dto로 리턴한다.
	    */
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		CustomerDTO dto = sqlSession.selectOne("com.mvc.upbank.dao.CustomerDAO.selectCustomer", id);
		
		//로그인 인증 실패시 인위적으로 예외를 생성해서 던진다
		if(dto == null) throw new UsernameNotFoundException(id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(dto.getAuthorities()));	//권한, 기본값='ROLE_USER'
		
		// UserVO 클래스 먼저 생성후 return
	    // 시큐리티 로그인에서 체크 : id, password, authority(ROLE_USER / ROLE_ADMIN), enabled(이메일인증시 "1"로 update치며, 이메일인증후 시큐리티 적용)
		return new UserVO(dto.getId(), dto.getPassword(), dto.getEnabled().equals("1"), 
							true, true, true, authority);
		
	}

}
