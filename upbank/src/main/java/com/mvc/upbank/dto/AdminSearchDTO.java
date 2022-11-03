package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
@AllArgsConstructor
public class AdminSearchDTO {

    private String account;// 계좌번호
    private String account_name; //예금주
    private String product_name; //상품명(입출금)
    private String I_NAME; //상품명(예금)
    private String Y_NAME; //상품명(적금)
    private String LOAN_NAME; //상품명(대출)
    private String id;	//회원아이디(회원가입시 여기에 정보 들어가도록)
    private String account_pw;	//계좌비밀번호
    private int balance; //잔액
    private String account_type;	//계좌종류 (입출금, 예금, 적금, 대출, 펀드)
    private String account_state;	//계좌상태 (정상, 한도제한, 휴면, 정지) / 초기값 한도제한
    private String acc_state_content;	//휴면, 정지 사유
    private int acc_limit_day;	//일일한도(이체총액)
    private int acc_limit_trsf;	//이체한도(1회)
    private Date delete_date;	//해지일
    private Date sleep_date;	//휴면일
    private Date new_date;	//계좌개설일
    private Date last_date;	//최근거래일
    private char transferable;	//이체가능여부
    
    private Date i_end_date; //관리자 조회용. 만기날짜 
    
    private int cnt_account_name;
    private int cnt_id;
    private int cnt_account;
    private int cnt_account_sleep;
    private int cnt_account_new;
    private int cnt_account_name_today;
    private int sum_balance_change;
    private int sum_balance;
    
    private int cnt_account_normal;
    private int cnt_account_stopped;
    private int cnt_account_cancled;
    
    public AdminSearchDTO() {}

    
    
    
	public int getCnt_account_normal() {
		return cnt_account_normal;
	}




	public void setCnt_account_normal(int cnt_account_normal) {
		this.cnt_account_normal = cnt_account_normal;
	}




	public int getCnt_account_stopped() {
		return cnt_account_stopped;
	}




	public void setCnt_account_stopped(int cnt_account_stopped) {
		this.cnt_account_stopped = cnt_account_stopped;
	}




	public int getCnt_account_cancled() {
		return cnt_account_cancled;
	}




	public void setCnt_account_cancled(int cnt_account_cancled) {
		this.cnt_account_cancled = cnt_account_cancled;
	}




	public Date getI_end_date() {
		return i_end_date;
	}

	public void setI_end_date(Date i_end_date) {
		this.i_end_date = i_end_date;
	}

	@Override
	public String toString() {
		return "AdminSearchDTO [account=" + account + ", account_name=" + account_name + ", product_name="
				+ product_name + ", I_NAME=" + I_NAME + ", Y_NAME=" + Y_NAME + ", LOAN_NAME=" + LOAN_NAME + ", id=" + id
				+ ", account_pw=" + account_pw + ", balance=" + balance + ", account_type=" + account_type
				+ ", account_state=" + account_state + ", acc_state_content=" + acc_state_content + ", acc_limit_day="
				+ acc_limit_day + ", acc_limit_trsf=" + acc_limit_trsf + ", delete_date=" + delete_date
				+ ", sleep_date=" + sleep_date + ", new_date=" + new_date + ", last_date=" + last_date
				+ ", transferable=" + transferable + ", cnt_account_name=" + cnt_account_name + ", cnt_id=" + cnt_id
				+ ", cnt_account=" + cnt_account + ", cnt_account_sleep=" + cnt_account_sleep + ", cnt_account_new="
				+ cnt_account_new + ", cnt_account_name_today=" + cnt_account_name_today + ", sum_balance_change="
				+ sum_balance_change + ", sum_balance=" + sum_balance + "]";
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getAccount_name() {
		return account_name;
	}


	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getI_NAME() {
		return I_NAME;
	}


	public void setI_NAME(String i_NAME) {
		I_NAME = i_NAME;
	}


	public String getY_NAME() {
		return Y_NAME;
	}


	public void setY_NAME(String y_NAME) {
		Y_NAME = y_NAME;
	}


	public String getLOAN_NAME() {
		return LOAN_NAME;
	}


	public void setLOAN_NAME(String lOAN_NAME) {
		LOAN_NAME = lOAN_NAME;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getAccount_pw() {
		return account_pw;
	}


	public void setAccount_pw(String account_pw) {
		this.account_pw = account_pw;
	}


	public int getBalance() {
		return balance;
	}


	public void setBalance(int balance) {
		this.balance = balance;
	}


	public String getAccount_type() {
		return account_type;
	}


	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}


	public String getAccount_state() {
		return account_state;
	}


	public void setAccount_state(String account_state) {
		this.account_state = account_state;
	}


	public String getAcc_state_content() {
		return acc_state_content;
	}


	public void setAcc_state_content(String acc_state_content) {
		this.acc_state_content = acc_state_content;
	}


	public int getAcc_limit_day() {
		return acc_limit_day;
	}


	public void setAcc_limit_day(int acc_limit_day) {
		this.acc_limit_day = acc_limit_day;
	}


	public int getAcc_limit_trsf() {
		return acc_limit_trsf;
	}


	public void setAcc_limit_trsf(int acc_limit_trsf) {
		this.acc_limit_trsf = acc_limit_trsf;
	}


	public Date getDelete_date() {
		return delete_date;
	}


	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}


	public Date getSleep_date() {
		return sleep_date;
	}


	public void setSleep_date(Date sleep_date) {
		this.sleep_date = sleep_date;
	}


	public Date getNew_date() {
		return new_date;
	}


	public void setNew_date(Date new_date) {
		this.new_date = new_date;
	}


	public Date getLast_date() {
		return last_date;
	}


	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}


	public char getTransferable() {
		return transferable;
	}


	public void setTransferable(char transferable) {
		this.transferable = transferable;
	}


	public int getCnt_account_name() {
		return cnt_account_name;
	}


	public void setCnt_account_name(int cnt_account_name) {
		this.cnt_account_name = cnt_account_name;
	}


	public int getCnt_id() {
		return cnt_id;
	}


	public void setCnt_id(int cnt_id) {
		this.cnt_id = cnt_id;
	}


	public int getCnt_account() {
		return cnt_account;
	}


	public void setCnt_account(int cnt_account) {
		this.cnt_account = cnt_account;
	}


	public int getCnt_account_sleep() {
		return cnt_account_sleep;
	}


	public void setCnt_account_sleep(int cnt_account_sleep) {
		this.cnt_account_sleep = cnt_account_sleep;
	}


	public int getCnt_account_new() {
		return cnt_account_new;
	}


	public void setCnt_account_new(int cnt_account_new) {
		this.cnt_account_new = cnt_account_new;
	}


	public int getCnt_account_name_today() {
		return cnt_account_name_today;
	}


	public void setCnt_account_name_today(int cnt_account_name_today) {
		this.cnt_account_name_today = cnt_account_name_today;
	}


	public int getSum_balance_change() {
		return sum_balance_change;
	}


	public void setSum_balance_change(int sum_balance_change) {
		this.sum_balance_change = sum_balance_change;
	}


	public int getSum_balance() {
		return sum_balance;
	}


	public void setSum_balance(int sum_balance) {
		this.sum_balance = sum_balance;
	}

	

}
