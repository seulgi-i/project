package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class CurrencyDTO {
	private String cur_unit;
	private String cur_nm;
	private double ttb ;
	private double tts;
	private double deal_bas_r;
	private int bkpr ;
   	private Date CUR_DATE;
   	private double todayCurrency;
   	private double noticeCurrency;
   	private double goodCurrency;
   	private int exchangeWon;
   	
   	public 	CurrencyDTO() {}

	public double getTodayCurrency() {
		return todayCurrency;
	}

	public void setTodayCurrency(double todayCurrency) {
		this.todayCurrency = todayCurrency;
	}

	public double getNoticeCurrency() {
		return noticeCurrency;
	}

	public void setNoticeCurrency(double noticeCurrency) {
		this.noticeCurrency = noticeCurrency;
	}

	public double getGoodCurrency() {
		return goodCurrency;
	}

	public void setGoodCurrency(double goodCurrency) {
		this.goodCurrency = goodCurrency;
	}

	public int getExchangeWon() {
		return exchangeWon;
	}

	public void setExchangeWon(int exchangeWon) {
		this.exchangeWon = exchangeWon;
	}

	public String getCur_unit() {
		return cur_unit;
	}

	public void setCur_unit(String cur_unit) {
		this.cur_unit = cur_unit;
	}

	public String getCur_nm() {
		return cur_nm;
	}

	public void setCur_nm(String cur_nm) {
		this.cur_nm = cur_nm;
	}

	public double getTtb() {
		return ttb;
	}

	public void setTtb(double ttb) {
		this.ttb = ttb;
	}

	public double getTts() {
		return tts;
	}

	public void setTts(double tts) {
		this.tts = tts;
	}

	public double getDeal_bas_r() {
		return deal_bas_r;
	}

	public void setDeal_bas_r(double deal_bas_r) {
		this.deal_bas_r = deal_bas_r;
	}

	public int getBkpr() {
		return bkpr;
	}

	public void setBkpr(int bkpr) {
		this.bkpr = bkpr;
	}

	public Date getCUR_DATE() {
		return CUR_DATE;
	}

	public void setCUR_DATE(Date cUR_DATE) {
		CUR_DATE = cUR_DATE;
	}

	
   	
}
