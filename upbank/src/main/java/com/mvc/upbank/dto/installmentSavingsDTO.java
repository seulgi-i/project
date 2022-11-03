package com.mvc.upbank.dto;

import java.sql.Date;

public class installmentSavingsDTO {
	private int i_no;    		 //예금번호
	private String id;
	private String ACCOUNT_TYPE;
	private String ACCOUNT_PW;
	private String ACCOUNT_PW_RE;
	private String PRODUCT_NAME;
	private String tf_product_name;
	private String i_name;       //예금상품이름 예)'UP Star 정기예금'
    private String i_method;       //예금상품이름 예)'UP Star 정기예금'
    private String account; 	 //계좌번호 
    private String tf_account; 	 //계좌번호 
    private int i_money;      //가입금액
    private String i_state;      //만기/만기전/중도해지 				
    private double rate;          //금리(해지일에따라 금리변경) i_state상태에따른 이율계산 
    private int month;			//이자계산월
    private String i_type;		 //예금종류 복리/단리  default 단리, 복리는 특별상품
    private int balance;       //예치금액(사용자 선택)
    private Date NEW_DATE;		 //만기일
    private Date i_end_date;		 //만기일
    private int i_max_date;      //최대예금기간 최대 3년 1095일
    private int i_min_date;		 //최소예금기간 최소 1개월 30일
    private int i_min_price;     //최소예치금액 최소 10,000원
    private int i_max_price;     //최대예치금액 최대 50,000,000원
    private String i_summary;	 //상품한줄요약
    private String i_explanation;//예금설명
    private String i_notice;	 //유의사항
    private String i_fileImg; 	//파일업로드
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
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
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public String getTf_product_name() {
		return tf_product_name;
	}
	public void setTf_product_name(String tf_product_name) {
		this.tf_product_name = tf_product_name;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_method() {
		return i_method;
	}
	public void setI_method(String i_method) {
		this.i_method = i_method;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTf_account() {
		return tf_account;
	}
	public void setTf_account(String tf_account) {
		this.tf_account = tf_account;
	}
	public int getI_money() {
		return i_money;
	}
	public void setI_money(int i_money) {
		this.i_money = i_money;
	}
	public String getI_state() {
		return i_state;
	}
	public void setI_state(String i_state) {
		this.i_state = i_state;
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
	public String getI_type() {
		return i_type;
	}
	public void setI_type(String i_type) {
		this.i_type = i_type;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public Date getNEW_DATE() {
		return NEW_DATE;
	}
	public void setNEW_DATE(Date nEW_DATE) {
		NEW_DATE = nEW_DATE;
	}
	public Date getI_end_date() {
		return i_end_date;
	}
	public void setI_end_date(Date i_end_date) {
		this.i_end_date = i_end_date;
	}
	public int getI_max_date() {
		return i_max_date;
	}
	public void setI_max_date(int i_max_date) {
		this.i_max_date = i_max_date;
	}
	public int getI_min_date() {
		return i_min_date;
	}
	public void setI_min_date(int i_min_date) {
		this.i_min_date = i_min_date;
	}
	public int getI_min_price() {
		return i_min_price;
	}
	public void setI_min_price(int i_min_price) {
		this.i_min_price = i_min_price;
	}
	public int getI_max_price() {
		return i_max_price;
	}
	public void setI_max_price(int i_max_price) {
		this.i_max_price = i_max_price;
	}
	public String getI_summary() {
		return i_summary;
	}
	public void setI_summary(String i_summary) {
		this.i_summary = i_summary;
	}
	public String getI_explanation() {
		return i_explanation;
	}
	public void setI_explanation(String i_explanation) {
		this.i_explanation = i_explanation;
	}
	public String getI_notice() {
		return i_notice;
	}
	public void setI_notice(String i_notice) {
		this.i_notice = i_notice;
	}
	public String getI_fileImg() {
		return i_fileImg;
	}
	public void setI_fileImg(String i_fileImg) {
		this.i_fileImg = i_fileImg;
	}
	@Override
	public String toString() {
		return "installmentSavingsDTO [i_no=" + i_no + ", id=" + id + ", ACCOUNT_TYPE=" + ACCOUNT_TYPE + ", ACCOUNT_PW="
				+ ACCOUNT_PW + ", ACCOUNT_PW_RE=" + ACCOUNT_PW_RE + ", PRODUCT_NAME=" + PRODUCT_NAME
				+ ", tf_product_name=" + tf_product_name + ", i_name=" + i_name + ", i_method=" + i_method
				+ ", account=" + account + ", tf_account=" + tf_account + ", i_money=" + i_money + ", i_state="
				+ i_state + ", rate=" + rate + ", month=" + month + ", i_type=" + i_type + ", balance=" + balance
				+ ", NEW_DATE=" + NEW_DATE + ", i_end_date=" + i_end_date + ", i_max_date=" + i_max_date
				+ ", i_min_date=" + i_min_date + ", i_min_price=" + i_min_price + ", i_max_price=" + i_max_price
				+ ", i_summary=" + i_summary + ", i_explanation=" + i_explanation + ", i_notice=" + i_notice
				+ ", i_fileImg=" + i_fileImg + ", getI_no()=" + getI_no() + ", getId()=" + getId()
				+ ", getACCOUNT_TYPE()=" + getACCOUNT_TYPE() + ", getACCOUNT_PW()=" + getACCOUNT_PW()
				+ ", getACCOUNT_PW_RE()=" + getACCOUNT_PW_RE() + ", getPRODUCT_NAME()=" + getPRODUCT_NAME()
				+ ", getTf_product_name()=" + getTf_product_name() + ", getI_name()=" + getI_name() + ", getI_method()="
				+ getI_method() + ", getAccount()=" + getAccount() + ", getTf_account()=" + getTf_account()
				+ ", getI_money()=" + getI_money() + ", getI_state()=" + getI_state() + ", getRate()=" + getRate()
				+ ", getMonth()=" + getMonth() + ", getI_type()=" + getI_type() + ", getBalance()=" + getBalance()
				+ ", getNEW_DATE()=" + getNEW_DATE() + ", getI_end_date()=" + getI_end_date() + ", getI_max_date()="
				+ getI_max_date() + ", getI_min_date()=" + getI_min_date() + ", getI_min_price()=" + getI_min_price()
				+ ", getI_max_price()=" + getI_max_price() + ", getI_summary()=" + getI_summary()
				+ ", getI_explanation()=" + getI_explanation() + ", getI_notice()=" + getI_notice()
				+ ", getI_fileImg()=" + getI_fileImg() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
    
    
}