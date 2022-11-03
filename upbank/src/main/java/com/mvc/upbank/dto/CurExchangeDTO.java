package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
@AllArgsConstructor
public class CurExchangeDTO {
	
	int num;	//자동 일련번호(pk용)
    String name;	//환전신청인
    String ACCOUNT;	//출금계좌번호
    String usercp;	//--연락처
    String email;	//이메일
    String reason;	//환전목적(여행비용 or 외화보유)
    Date receive_date;	//수령예정일
    String receive_spot1;	//수령지점(공항)
    String receive_spot2;	//수령지점(터미널)
    String receive_spot3;	//수령지점(방법)
    Date submit_date;	//환전신청일자
    String account_pw;	//계좌 비밀번호
    int cur_exchange;	//환전요청액
    String enable;		//수령여부
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public String getUsercp() {
		return usercp;
	}
	public void setUsercp(String usercp) {
		this.usercp = usercp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getReceive_date() {
		return receive_date;
	}
	public void setReceive_date(Date receive_date) {
		this.receive_date = receive_date;
	}
	public String getReceive_spot1() {
		return receive_spot1;
	}
	public void setReceive_spot1(String receive_spot1) {
		this.receive_spot1 = receive_spot1;
	}
	public String getReceive_spot2() {
		return receive_spot2;
	}
	public void setReceive_spot2(String receive_spot2) {
		this.receive_spot2 = receive_spot2;
	}
	public String getReceive_spot3() {
		return receive_spot3;
	}
	public void setReceive_spot3(String receive_spot3) {
		this.receive_spot3 = receive_spot3;
	}
	public Date getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}
	public String getAccount_pw() {
		return account_pw;
	}
	public void setAccount_pw(String account_pw) {
		this.account_pw = account_pw;
	}
	public int getCur_exchange() {
		return cur_exchange;
	}
	public void setCur_exchange(int cur_exchange) {
		this.cur_exchange = cur_exchange;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
    
	
    
}
