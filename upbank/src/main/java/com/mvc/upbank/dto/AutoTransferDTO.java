package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.Data;

public class AutoTransferDTO {
	private int auto_id;		// 자동이체기본키(자동생성)
	private String id;					// 회원id
	private String ACCOUNT;				// 출금계좌번호
	private String auto_senderBank;
	private String auto_senderAccount;	// 입금계좌번호
	private int auto_type;				// 자동이체종류(0:대출, 1:예금, 2:적금)
	private int auto_outDate;			// 출금일자(매달 *일)
	private int auto_balance;				// 출금액
	private Date auto_registDate;		// 자동이체시작일
	private Date auto_expirationDate;	// 자동이체종료일
	private Date auto_cancle;			// 자동이체해지일
	private String auto_inPlace;		// 이체기관명
	private int auto_status;			// 자동이체상태
	private Date auto_lastDay;			// 최신 납부일자
	private int auto_charges;           // 수수료( 타행이체시 300원 차감 )
	// 자동이체내역 테이블추가
	private int auto_transfer_list_id;
	// private int auto_id; (중복)
	private Date auto_date;
	private String auto_success;
	public int getAuto_id() {
		return auto_id;
	}
	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public String getAuto_senderBank() {
		return auto_senderBank;
	}
	public void setAuto_senderBank(String auto_senderBank) {
		this.auto_senderBank = auto_senderBank;
	}
	public String getAuto_senderAccount() {
		return auto_senderAccount;
	}
	public void setAuto_senderAccount(String auto_senderAccount) {
		this.auto_senderAccount = auto_senderAccount;
	}
	public int getAuto_type() {
		return auto_type;
	}
	public void setAuto_type(int auto_type) {
		this.auto_type = auto_type;
	}
	public int getAuto_outDate() {
		return auto_outDate;
	}
	public void setAuto_outDate(int auto_outDate) {
		this.auto_outDate = auto_outDate;
	}
	public int getAuto_balance() {
		return auto_balance;
	}
	public void setAuto_balance(int auto_balance) {
		this.auto_balance = auto_balance;
	}
	public Date getAuto_registDate() {
		return auto_registDate;
	}
	public void setAuto_registDate(Date auto_registDate) {
		this.auto_registDate = auto_registDate;
	}
	public Date getAuto_expirationDate() {
		return auto_expirationDate;
	}
	public void setAuto_expirationDate(Date auto_expirationDate) {
		this.auto_expirationDate = auto_expirationDate;
	}
	public Date getAuto_cancle() {
		return auto_cancle;
	}
	public void setAuto_cancle(Date auto_cancle) {
		this.auto_cancle = auto_cancle;
	}
	public String getAuto_inPlace() {
		return auto_inPlace;
	}
	public void setAuto_inPlace(String auto_inPlace) {
		this.auto_inPlace = auto_inPlace;
	}
	public int getAuto_status() {
		return auto_status;
	}
	public void setAuto_status(int auto_status) {
		this.auto_status = auto_status;
	}
	public Date getAuto_lastDay() {
		return auto_lastDay;
	}
	public void setAuto_lastDay(Date auto_lastDay) {
		this.auto_lastDay = auto_lastDay;
	}
	public int getAuto_charges() {
		return auto_charges;
	}
	public void setAuto_charges(int auto_charges) {
		this.auto_charges = auto_charges;
	}
	public int getAuto_transfer_list_id() {
		return auto_transfer_list_id;
	}
	public void setAuto_transfer_list_id(int auto_transfer_list_id) {
		this.auto_transfer_list_id = auto_transfer_list_id;
	}
	public Date getAuto_date() {
		return auto_date;
	}
	public void setAuto_date(Date auto_date) {
		this.auto_date = auto_date;
	}
	public String getAuto_success() {
		return auto_success;
	}
	public void setAuto_success(String auto_success) {
		this.auto_success = auto_success;
	}
	
	public AutoTransferDTO() {}
	public AutoTransferDTO(int auto_id, String id, String aCCOUNT, String auto_senderBank, String auto_senderAccount,
			int auto_type, int auto_outDate, int auto_balance, Date auto_registDate, Date auto_expirationDate,
			Date auto_cancle, String auto_inPlace, int auto_status, Date auto_lastDay, int auto_charges,
			int auto_transfer_list_id, Date auto_date, String auto_success) {
		super();
		this.auto_id = auto_id;
		this.id = id;
		ACCOUNT = aCCOUNT;
		this.auto_senderBank = auto_senderBank;
		this.auto_senderAccount = auto_senderAccount;
		this.auto_type = auto_type;
		this.auto_outDate = auto_outDate;
		this.auto_balance = auto_balance;
		this.auto_registDate = auto_registDate;
		this.auto_expirationDate = auto_expirationDate;
		this.auto_cancle = auto_cancle;
		this.auto_inPlace = auto_inPlace;
		this.auto_status = auto_status;
		this.auto_lastDay = auto_lastDay;
		this.auto_charges = auto_charges;
		this.auto_transfer_list_id = auto_transfer_list_id;
		this.auto_date = auto_date;
		this.auto_success = auto_success;
	}
	
	
	
}
