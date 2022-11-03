package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
@AllArgsConstructor
public class SearchDTO {

    private String ACCOUNT;// 계좌번호
    private String ACCOUNT_NAME; //예금주
    private String PRODUCT_NAME; //상품명(입출금)
    private String I_NAME; //상품명(예금)
    private String Y_NAME; //상품명(적금)
    private String LOAN_NAME; //상품명(대출)
    private String ID;	//회원아이디(회원가입시 여기에 정보 들어가도록)
    private String ACCOUNT_PW;	//계좌비밀번호
    private int BALANCE; //잔액
    private String ACCOUNT_TYPE;	//계좌종류 (입출금, 예금, 적금, 대출, 펀드)
    private String ACCOUNT_STATE;	//계좌상태 (정상, 한도제한, 휴면, 정지) / 초기값 한도제한
    private String ACC_STATE_CONTENT;	//휴면, 정지 사유
    private int ACC_LIMIT_DAY;	//일일한도(이체총액)
    private int ACC_LIMIT_TRSF;	//이체한도(1회)
    private Date DELETE_DATE;	//해지일
    private Date SLEEP_DATE;	//휴면일
    private Date NEW_DATE;	//계좌개설일
    private Date LAST_DATE;	//최근거래일
    private char TRANSFERABLE;	//이체가능여부
    private String phone; //휴대전화번호(비회원 가입용)
    
    public SearchDTO() {}

	public String getACCOUNT() {
		return ACCOUNT;
	}

	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}

	public String getACCOUNT_NAME() {
		return ACCOUNT_NAME;
	}

	public void setACCOUNT_NAME(String aCCOUNT_NAME) {
		ACCOUNT_NAME = aCCOUNT_NAME;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
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

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getACCOUNT_PW() {
		return ACCOUNT_PW;
	}

	public void setACCOUNT_PW(String aCCOUNT_PW) {
		ACCOUNT_PW = aCCOUNT_PW;
	}

	public int getBALANCE() {
		return BALANCE;
	}

	public void setBALANCE(int bALANCE) {
		BALANCE = bALANCE;
	}

	public String getACCOUNT_TYPE() {
		return ACCOUNT_TYPE;
	}

	public void setACCOUNT_TYPE(String aCCOUNT_TYPE) {
		ACCOUNT_TYPE = aCCOUNT_TYPE;
	}

	public String getACCOUNT_STATE() {
		return ACCOUNT_STATE;
	}

	public void setACCOUNT_STATE(String aCCOUNT_STATE) {
		ACCOUNT_STATE = aCCOUNT_STATE;
	}

	public String getACC_STATE_CONTENT() {
		return ACC_STATE_CONTENT;
	}

	public void setACC_STATE_CONTENT(String aCC_STATE_CONTENT) {
		ACC_STATE_CONTENT = aCC_STATE_CONTENT;
	}

	public int getACC_LIMIT_DAY() {
		return ACC_LIMIT_DAY;
	}

	public void setACC_LIMIT_DAY(int aCC_LIMIT_DAY) {
		ACC_LIMIT_DAY = aCC_LIMIT_DAY;
	}

	public int getACC_LIMIT_TRSF() {
		return ACC_LIMIT_TRSF;
	}

	public void setACC_LIMIT_TRSF(int aCC_LIMIT_TRSF) {
		ACC_LIMIT_TRSF = aCC_LIMIT_TRSF;
	}

	public Date getDELETE_DATE() {
		return DELETE_DATE;
	}

	public void setDELETE_DATE(Date dELETE_DATE) {
		DELETE_DATE = dELETE_DATE;
	}

	public Date getSLEEP_DATE() {
		return SLEEP_DATE;
	}

	public void setSLEEP_DATE(Date sLEEP_DATE) {
		SLEEP_DATE = sLEEP_DATE;
	}

	public Date getNEW_DATE() {
		return NEW_DATE;
	}

	public void setNEW_DATE(Date nEW_DATE) {
		NEW_DATE = nEW_DATE;
	}

	public Date getLAST_DATE() {
		return LAST_DATE;
	}

	public void setLAST_DATE(Date lAST_DATE) {
		LAST_DATE = lAST_DATE;
	}

	public char getTRANSFERABLE() {
		return TRANSFERABLE;
	}

	public void setTRANSFERABLE(char tRANSFERABLE) {
		TRANSFERABLE = tRANSFERABLE;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
