package com.mvc.upbank.dto;

public class LoanProductRateDTO {
	int loan_rate;			// PK
    int loan_num;			// 대출 상품 번호
    String rate_status;		// 변동 금리, 고정 금리
    String rate_name;		// 금리 구분
    int rate_change;		// 금리 변동 주기
    double rate_basemoney;		// 기본 금리    (=기준 금리 / 고정 금리일 경우 이 컬럼만 출력)
    double rate_spread;		// 가산 금리
    double rate_prime;			// 우대 금리
    
	public int getLoan_rate() {
		return loan_rate;
	}
	
	public void setLoan_rate(int loan_rate) {
		this.loan_rate = loan_rate;
	}
	
	public int getLoan_num() {
		return loan_num;
	}
	
	public void setLoan_num(int loan_num) {
		this.loan_num = loan_num;
	}
	
	public String getRate_status() {
		return rate_status;
	}
	
	public void setRate_status(String rate_status) {
		this.rate_status = rate_status;
	}
	
	public String getRate_name() {
		return rate_name;
	}
	
	public void setRate_name(String rate_name) {
		this.rate_name = rate_name;
	}
	
	public int getRate_change() {
		return rate_change;
	}
	
	public void setRate_change(int rate_change) {
		this.rate_change = rate_change;
	}
	
	public double getRate_basemoney() {
		return rate_basemoney;
	}
	
	public void setRate_basemoney(double rate_basemoney) {
		this.rate_basemoney = rate_basemoney;
	}
	
	public double getRate_spread() {
		return rate_spread;
	}
	public void setRate_spread(double rate_spread) {
		this.rate_spread = rate_spread;
	}
	
	public double getRate_prime() {
		return rate_prime;
	}
	
	public void setRate_prime(double rate_prime) {
		this.rate_prime = rate_prime;
	}

	@Override
	public String toString() {
		return "LoanProductRateDTO [loan_rate=" + loan_rate + ", loan_num=" + loan_num + ", rate_status=" + rate_status
				+ ", rate_name=" + rate_name + ", rate_change=" + rate_change + ", rate_basemoney=" + rate_basemoney
				+ ", rate_spread=" + rate_spread + ", rate_prime=" + rate_prime + "]";
	}
	
}
