package com.mvc.upbank.dto;

import java.sql.Date;
import java.util.List;

public class LoanProductDTO {
	int loan_num;				// 대출 상품 번호
	String loan_name;			// 대출 상품 이름
	String loan_summary;		// 대출 상품 요약
	Date loan_date;				// 대출 상품 등록일
	String loan_status;			// 상태 - 판매중, 판매중단
	String loan_rate_summary;	// 금리 설명
	double loan_limit;			// 대출 한도
	String loan_period;			// 대출 기간
	String loan_repay;			// 상환 방식
	String loan_repay_summary;	// 상환 방식 설명
	double loan_termination_fee;	// 중도상환 해약금율
	String loan_note;			// 유의사항
	
	List<LoanProductRateDTO> rate;	// 금리

	public int getLoan_num() {
		return loan_num;
	}

	public void setLoan_num(int loan_num) {
		this.loan_num = loan_num;
	}

	public String getLoan_summary() {
		return loan_summary;
	}

	public void setLoan_summary(String loan_summary) {
		this.loan_summary = loan_summary;
	}

	public String getLoan_name() {
		return loan_name;
	}

	public void setLoan_name(String loan_name) {
		this.loan_name = loan_name;
	}

	public Date getLoan_date() {
		return loan_date;
	}

	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}

	public String getLoan_status() {
		return loan_status;
	}

	public void setLoan_status(String loan_status) {
		this.loan_status = loan_status;
	}

	public String getLoan_rate_summary() {
		return loan_rate_summary;
	}

	public void setLoan_rate_summary(String loan_rate_summary) {
		this.loan_rate_summary = loan_rate_summary;
	}

	public double getLoan_limit() {
		return loan_limit;
	}

	public void setLoan_limit(double loan_limit) {
		this.loan_limit = loan_limit;
	}

	public String getLoan_period() {
		return loan_period;
	}

	public void setLoan_period(String loan_period) {
		this.loan_period = loan_period;
	}

	public String getLoan_repay() {
		return loan_repay;
	}

	public void setLoan_repay(String loan_repay) {
		this.loan_repay = loan_repay;
	}

	public String getLoan_repay_summary() {
		return loan_repay_summary;
	}

	public void setLoan_repay_summary(String loan_repay_summary) {
		this.loan_repay_summary = loan_repay_summary;
	}

	public double getLoan_termination_fee() {
		return loan_termination_fee;
	}

	public void setLoan_termination_fee(double loan_termination_fee) {
		this.loan_termination_fee = loan_termination_fee;
	}

	public String getLoan_note() {
		return loan_note;
	}

	public void setLoan_note(String loan_note) {
		this.loan_note = loan_note;
	}

	public List<LoanProductRateDTO> getRate() {
		return rate;
	}

	public void setRate(List<LoanProductRateDTO> rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "LoanProductDTO [loan_num=" + loan_num + ", loan_name=" + loan_name + ", loan_summary=" + loan_summary
				+ ", loan_date=" + loan_date + ", loan_status=" + loan_status + ", loan_rate_summary="
				+ loan_rate_summary + ", loan_limit=" + loan_limit + ", loan_period=" + loan_period + ", loan_repay="
				+ loan_repay + ", loan_repay_summary=" + loan_repay_summary + ", loan_termination_fee="
				+ loan_termination_fee + ", loan_note=" + loan_note + ", rate=" + rate + "]";
	}

}
