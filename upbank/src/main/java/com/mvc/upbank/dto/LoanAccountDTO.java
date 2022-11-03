package com.mvc.upbank.dto;

import java.sql.Date;

public class LoanAccountDTO {
	int l_num;					// 대출 번호
	String account;				// 계좌 번호
	String l_status;			// 대출 상태 - 대기/상환중/완납/만기
	Date l_start_date;			// 대출 실행일
	Date l_end_date;			// 대출 만기일
	String l_repay;				// 상환 방법 - 만기일시/원금균등상환/원리금균등상환
	double l_rate;				// 대출 금리
	int l_principal;			// 대출 원금
	int l_interest;				// 이자 원금
	int l_balance_principal;		// 원금 잔액
	double l_termination_fee_rate;	// 중도 상환 해약금율
	
	int l_period;				// 대출 기간
								// join 테이블에서 불러오기 위한 용도. 테이블에 컬럼 없어요.
	
	SearchDTO accInfo;			// 계좌 기본 정보
	
	public int getL_num() {
		return l_num;
	}
	
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	
	public String getL_status() {
		return l_status;
	}
	
	public void setL_status(String l_status) {
		this.l_status = l_status;
	}
	
	public Date getL_start_date() {
		return l_start_date;
	}
	
	public void setL_start_date(Date l_start_date) {
		this.l_start_date = l_start_date;
	}
	
	public Date getL_end_date() {
		return l_end_date;
	}
	
	public void setL_end_date(Date l_end_date) {
		this.l_end_date = l_end_date;
	}
	
	public String getL_repay() {
		return l_repay;
	}
	
	public void setL_repay(String l_repay) {
		this.l_repay = l_repay;
	}
	
	public double getL_rate() {
		return l_rate;
	}
	
	public void setL_rate(double l_rate) {
		this.l_rate = l_rate;
	}
	
	public int getL_principal() {
		return l_principal;
	}
	
	public void setL_principal(int l_principal) {
		this.l_principal = l_principal;
	}
	
	public int getL_interest() {
		return l_interest;
	}
	
	public void setL_interest(int l_interest) {
		this.l_interest = l_interest;
	}
	
	public int getL_balance_principal() {
		return l_balance_principal;
	}

	public void setL_balance_principal(int l_balance_principal) {
		this.l_balance_principal = l_balance_principal;
	}

	public double getL_termination_fee_rate() {
		return l_termination_fee_rate;
	}
	
	public void setL_termination_fee_rate(double l_termination_fee_rate) {
		this.l_termination_fee_rate = l_termination_fee_rate;
	}
	
	public int getL_period() {
		return l_period;
	}

	public void setL_period(int l_period) {
		this.l_period = l_period;
	}

	public SearchDTO getAccInfo() {
		return accInfo;
	}

	public void setAccInfo(SearchDTO accInfo) {
		this.accInfo = accInfo;
	}

	@Override
	public String toString() {
		return "LoanAccountDTO [l_num=" + l_num + ", account=" + account + ", l_status=" + l_status + ", l_start_date="
				+ l_start_date + ", l_end_date=" + l_end_date + ", l_repay=" + l_repay + ", l_rate=" + l_rate
				+ ", l_principal=" + l_principal + ", l_interest=" + l_interest + ", l_balance_principal="
				+ l_balance_principal + ", l_termination_fee_rate=" + l_termination_fee_rate + ", l_period=" + l_period
				+ ", accInfo=" + accInfo + "]";
	}
	
}
