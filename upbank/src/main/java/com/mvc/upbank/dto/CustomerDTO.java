package com.mvc.upbank.dto;

import java.sql.Date;

//멤버변수 = 컬럼명 = input태그명
//DTO(data transfer object) : setter -> 멤버변수 -> getter

public class CustomerDTO {
	
	private String id;
	private String password;
	private String name;
	private String account;
	private Date birthday;
	private String job;
	private String address;
	private String address_detail;
	private String post_num;
	private String phone;
	private String email;
	private String status;
	private Date reg_date;
	
	 // 추가 - 시큐리티
    private String key;   // 이메일인증
    private String authorities;  // 권한등급 : ROLE_USER:customer, ROLE_ADMIN:관리자
    private String enabled;  // 계정사용 가능여부(1:사용가능, 0:사용불가) : 이메일인증시 1로 update
    
	
	public CustomerDTO() {}
	
	
	

	public CustomerDTO(String id, String password, String key, String authorities, String enabled) {
		super();
		this.id = id;
		this.password = password;
		this.key = key;
		this.authorities = authorities;
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




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getAccount() {
		return account;
	}




	public void setAccount(String account) {
		this.account = account;
	}




	public Date getBirthday() {
		return birthday;
	}




	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}




	public String getJob() {
		return job;
	}




	public void setJob(String job) {
		this.job = job;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getAddress_detail() {
		return address_detail;
	}




	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}




	public String getPost_num() {
		return post_num;
	}




	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public Date getReg_date() {
		return reg_date;
	}




	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}




	public String getKey() {
		return key;
	}




	public void setKey(String key) {
		this.key = key;
	}




	public String getAuthorities() {
		return authorities;
	}




	public void setAuthorities(String authorities) {
		this.authorities = authorities;
	}




	public String getEnabled() {
		return enabled;
	}




	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}




	@Override
	public String toString() {
		return "CustomerDTO [id=" + id + ", password=" + password + ", name=" + name + ", account=" + account
				+ ", birthday=" + birthday + ", job=" + job + ", address=" + address + ", address_detail="
				+ address_detail + ", post_num=" + post_num + ", phone=" + phone + ", email=" + email + ", status="
				+ status + ", reg_date=" + reg_date + ", key=" + key + ", authorities=" + authorities + ", enabled="
				+ enabled + "]";
	}

	

}
