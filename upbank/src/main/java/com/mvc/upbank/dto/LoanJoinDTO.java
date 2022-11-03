package com.mvc.upbank.dto;

import java.sql.Date;

public class LoanJoinDTO {
	private int l_join_num;
	
	// 인적 정보
	private String id;
	private String name;
	private String social_num;
	private String social_etc;
	private String postcode;
	private String address;
	private String address_detail;
	private String phone;
	private String emergency_phone;
	private String account;
	
	// 대출 정보
	private int loan_num;
	private String loan_name;
	private int l_principal;
	private int l_period;
	private String l_repay;
	private Date l_start_date;
	private int loan_rate;
	private double rate_basemoney;
	
	private Date l_apply_date;
	private int l_confirm;
	
	public int getL_join_num() {
		return l_join_num;
	}

	public void setL_join_num(int l_join_num) {
		this.l_join_num = l_join_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSocial_num() {
		return social_num;
	}
	
	public void setSocial_num(String social_num) {
		this.social_num = social_num;
	}
	
	public String getSocial_etc() {
		return social_etc;
	}
	
	public void setSocial_etc(String social_etc) {
		this.social_etc = social_etc;
	}
	
	public String getPostcode() {
		return postcode;
	}
	
	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmergency_phone() {
		return emergency_phone;
	}
	
	public void setEmergency_phone(String emergency_phone) {
		this.emergency_phone = emergency_phone;
	}
	
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	
	public int getLoan_num() {
		return loan_num;
	}
	
	public void setLoan_num(int loan_num) {
		this.loan_num = loan_num;
	}
	
	public String getLoan_name() {
		return loan_name;
	}

	public void setLoan_name(String loan_name) {
		this.loan_name = loan_name;
	}

	public int getL_principal() {
		return l_principal;
	}
	
	public void setL_principal(int l_principal) {
		this.l_principal = l_principal;
	}
	
	public int getL_period() {
		return l_period;
	}
	
	public void setL_period(int l_period) {
		this.l_period = l_period;
	}
	
	public String getL_repay() {
		return l_repay;
	}
	
	public void setL_repay(String l_repay) {
		this.l_repay = l_repay;
	}
	
	public Date getL_start_date() {
		return l_start_date;
	}
	
	public void setL_start_date(Date l_start_date) {
		this.l_start_date = l_start_date;
	}

	public int getLoan_rate() {
		return loan_rate;
	}

	public void setLoan_rate(int loan_rate) {
		this.loan_rate = loan_rate;
	}

	public double getRate_basemoney() {
		return rate_basemoney;
	}

	public void setRate_basemoney(double rate_basemoney) {
		this.rate_basemoney = rate_basemoney;
	}

	public Date getL_apply_date() {
		return l_apply_date;
	}

	public void setL_apply_date(Date l_apply_date) {
		this.l_apply_date = l_apply_date;
	}

	public int getL_confirm() {
		return l_confirm;
	}

	public void setL_confirm(int l_confirm) {
		this.l_confirm = l_confirm;
	}

	@Override
	public String toString() {
		return "LoanJoinDTO [l_join_num=" + l_join_num + ", id=" + id + ", name=" + name + ", social_num=" + social_num
				+ ", social_etc=" + social_etc + ", postcode=" + postcode + ", address=" + address + ", address_detail="
				+ address_detail + ", phone=" + phone + ", emergency_phone=" + emergency_phone + ", account=" + account
				+ ", loan_num=" + loan_num + ", loan_name=" + loan_name + ", l_principal=" + l_principal + ", l_period="
				+ l_period + ", l_repay=" + l_repay + ", l_start_date=" + l_start_date + ", loan_rate=" + loan_rate
				+ ", rate_basemoney=" + rate_basemoney + ", l_apply_date=" + l_apply_date + ", l_confirm=" + l_confirm
				+ "]";
	}

}
