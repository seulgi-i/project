package com.team.upbank.injune.auth.dto;

import java.sql.Date;
import java.sql.Timestamp;

//멤버변수 = 컬럼명 = input태그명
//DTO(data transfer object) : setter -> 멤버변수 -> getter

public class CustomerDTO {
	
	private String id;
	private String password;
	
	 // 추가 - 시큐리티
    private String key;   // 이메일인증
    private String authority;  // 권한등급 : ROLE_USER:customer, ROLE_ADMIN:관리자
    private String enabled;  // 계정사용 가능여부(1:사용가능, 0:사용불가) : 이메일인증시 1로 update
    
	
	public CustomerDTO() {}
	
	
	

	public CustomerDTO(String id, String password, String key, String authority, String enabled) {
		super();
		this.id = id;
		this.password = password;
		this.key = key;
		this.authority = authority;
		this.enabled = enabled;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}




	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public String getEnabled() {
		return enabled;
	}


	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}


	@Override
	public String toString() {
		return "CustomerDTO [key=" + key + ", authority=" + authority + ", enabled=" + enabled + "]";
	}

	
	
	
}
