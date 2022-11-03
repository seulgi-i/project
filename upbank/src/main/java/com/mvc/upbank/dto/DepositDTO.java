package com.mvc.upbank.dto;

import java.sql.Date;

public class DepositDTO {
	private int y_no;    		 //예금번호
	private String id;
	private String ACCOUNT_TYPE;
	private String ACCOUNT_PW;
	private String ACCOUNT_PW_RE;
	private String PRODUCT_NAME;
	private String tf_product_name;
	private String i_name;       //예금상품이름 예)'UP Star 정기예금'
    private String y_name;       //예금상품이름 예)'UP Star 정기예금'
    private String account; 	 //계좌번호 
    private String tf_account; 	 //계좌번호 
    private int y_money;      //가입금액
    private String y_state;      //만기/만기전/중도해지 				
    private double rate;          //금리(해지일에따라 금리변경) y_state상태에따른 이율계산 
    private int month;			//이자계산월
    private String y_type;		 //예금종류 복리/단리  default 단리, 복리는 특별상품
    private int balance;       //예치금액(사용자 선택)
    private Date NEW_DATE;		 //만기일
    private Date y_end_date;		 //만기일
    private Date i_end_date;		 //만기일
    private int y_max_date;      //최대예금기간 최대 3년 1095일
    private int y_min_date;		 //최소예금기간 최소 1개월 30일
    private int y_min_price;     //최소예치금액 최소 10,000원
    private int y_max_price;     //최대예치금액 최대 50,000,000원
    private String y_summary;	 //상품한줄요약
    private String y_explanation;//예금설명
    private String y_notice;	 //유의사항
    private String y_fileImg; 	//파일업로드
    
    
	public String getTf_product_name() {
		return tf_product_name;
	}
	public void setTf_product_name(String tf_product_name) {
		this.tf_product_name = tf_product_name;
	}
	public int getY_money() {
		return y_money;
	}
	public void setY_money(int y_money) {
		this.y_money = y_money;
	}

	public String getTf_account() {
		return tf_account;
	}
	public void setTf_account(String tf_account) {
		this.tf_account = tf_account;
	}
	public Date getNEW_DATE() {
		return NEW_DATE;
	}
	public void setNEW_DATE(Date nEW_DATE) {
		NEW_DATE = nEW_DATE;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public Date getI_end_date() {
		return i_end_date;
	}
	public void setI_end_date(Date i_end_date) {
		this.i_end_date = i_end_date;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public int getY_no() {
		return y_no;
	}
	public void setY_no(int y_no) {
		this.y_no = y_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getACCOUNT_TYPE() {
		return ACCOUNT_TYPE;
	}
	public void setACCOUNT_TYPE(String aCCOUNT_TYPE) {
		ACCOUNT_TYPE = aCCOUNT_TYPE;
	}
	public String getACCOUNT_PW() {
		return ACCOUNT_PW;
	}
	public void setACCOUNT_PW(String aCCOUNT_PW) {
		ACCOUNT_PW = aCCOUNT_PW;
	}
	public String getACCOUNT_PW_RE() {
		return ACCOUNT_PW_RE;
	}
	public void setACCOUNT_PW_RE(String aCCOUNT_PW_RE) {
		ACCOUNT_PW_RE = aCCOUNT_PW_RE;
	}
	public String getY_name() {
		return y_name;
	}
	public void setY_name(String y_name) {
		this.y_name = y_name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getY_state() {
		return y_state;
	}
	public void setY_state(String y_state) {
		this.y_state = y_state;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public String getY_type() {
		return y_type;
	}
	public void setY_type(String y_type) {
		this.y_type = y_type;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}

	public Date getY_end_date() {
		return y_end_date;
	}
	public void setY_end_date(Date y_end_date) {
		this.y_end_date = y_end_date;
	}
	public int getY_max_date() {
		return y_max_date;
	}
	public void setY_max_date(int y_max_date) {
		this.y_max_date = y_max_date;
	}
	public int getY_min_date() {
		return y_min_date;
	}
	public void setY_min_date(int y_min_date) {
		this.y_min_date = y_min_date;
	}
	public int getY_min_price() {
		return y_min_price;
	}
	public void setY_min_price(int y_min_price) {
		this.y_min_price = y_min_price;
	}
	public int getY_max_price() {
		return y_max_price;
	}
	public void setY_max_price(int y_max_price) {
		this.y_max_price = y_max_price;
	}
	public String getY_summary() {
		return y_summary;
	}
	public void setY_summary(String y_summary) {
		this.y_summary = y_summary;
	}
	public String getY_explanation() {
		return y_explanation;
	}
	public void setY_explanation(String y_explanation) {
		this.y_explanation = y_explanation;
	}
	public String getY_notice() {
		return y_notice;
	}
	public void setY_notice(String y_notice) {
		this.y_notice = y_notice;
	}
	public String getY_fileImg() {
		return y_fileImg;
	}
	public void setY_fileImg(String y_fileImg) {
		this.y_fileImg = y_fileImg;
	}
	@Override
	public String toString() {
		return "DepositDTO [y_no=" + y_no + ", id=" + id + ", ACCOUNT_TYPE=" + ACCOUNT_TYPE + ", ACCOUNT_PW="
				+ ACCOUNT_PW + ", ACCOUNT_PW_RE=" + ACCOUNT_PW_RE + ", y_name=" + y_name + ", account=" + account
				+ ", y_state=" + y_state + ", rate=" + rate + ", month=" + month + ", y_type=" + y_type + ", balance="
				+ balance + ", y_end_date=" + y_end_date + ", y_max_date=" + y_max_date + ", y_min_date=" + y_min_date
				+ ", y_min_price=" + y_min_price + ", y_max_price=" + y_max_price + ", y_summary=" + y_summary
				+ ", y_explanation=" + y_explanation + ", y_notice=" + y_notice + ", y_fileImg=" + y_fileImg
				+ ", getY_no()=" + getY_no() + ", getId()=" + getId() + ", getACCOUNT_TYPE()=" + getACCOUNT_TYPE()
				+ ", getACCOUNT_PW()=" + getACCOUNT_PW() + ", getACCOUNT_PW_RE()=" + getACCOUNT_PW_RE()
				+ ", getY_name()=" + getY_name() + ", getAccount()=" + getAccount() + ", getY_state()=" + getY_state()
				+ ", getRate()=" + getRate() + ", getMonth()=" + getMonth() + ", getY_type()=" + getY_type()
				+ ", getBalance()=" + getBalance() + ", getY_end_date()=" + getY_end_date() + ", getY_max_date()="
				+ getY_max_date() + ", getY_min_date()=" + getY_min_date() + ", getY_min_price()=" + getY_min_price()
				+ ", getY_max_price()=" + getY_max_price() + ", getY_summary()=" + getY_summary()
				+ ", getY_explanation()=" + getY_explanation() + ", getY_notice()=" + getY_notice()
				+ ", getY_fileImg()=" + getY_fileImg() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
    
    

}
