package com.mvc.upbank.dto;

import java.sql.Date;

public class FundDTO extends ChartDTO{
	
	private String itemcode;	//종목코드
	private String itemname;	//종목명
	private int nowVal;		    //현재가
	private float changeVal;	//전일비
	private float changeRate;	//등락율
	private float nav;			//NAV
	private float threeMonthEarnRate;	//3개월 수익율
	private int quant;	    //거래량
	private int amonut;  	//거래대금
	private int marketSum;	//시가총액
	
	private String id;			//회원 아이디
	private String f_account;	//펀드계좌
	private int f_val;	    	//매수/매도금액
	private int f_cnt;	    	//매수/매도 수량
	private int f_totalPrice;	//매수/매도 거래 금액
	private int f_fee; 			//수수료
	private int f_finalTotalPrice;	//총거래 금액
	private String f_type;		//거래유형
	private Date f_date;	    //거래일
	
	private int f_totalEvaluationPrice;  //총평가금액
	private int f_totalProfitLoss;       //총손익
	private float f_totalReturn;         //펀드 총수익율

	private int f_profitLoss;      //펀드 손익
	private int f_evaluationPrice; //펀드 평가금액
	private float f_return;	       //펀드 수익율

	public FundDTO() {
	}

	public FundDTO(String itemcode, String itemname, int nowVal, float changeVal, float changeRate, float nav,
			float threeMonthEarnRate, int quant, int amonut, int marketSum, String id, String f_account, int f_val,
			int f_cnt, int f_totalPrice, int f_fee, int f_finalTotalPrice, String f_type, Date f_date,
			int f_totalEvaluationPrice, int f_totalProfitLoss, float f_totalReturn, int f_profitLoss,
			int f_evaluationPrice, float f_return) {
		super();
		this.itemcode = itemcode;
		this.itemname = itemname;
		this.nowVal = nowVal;
		this.changeVal = changeVal;
		this.changeRate = changeRate;
		this.nav = nav;
		this.threeMonthEarnRate = threeMonthEarnRate;
		this.quant = quant;
		this.amonut = amonut;
		this.marketSum = marketSum;
		this.id = id;
		this.f_account = f_account;
		this.f_val = f_val;
		this.f_cnt = f_cnt;
		this.f_totalPrice = f_totalPrice;
		this.f_fee = f_fee;
		this.f_finalTotalPrice = f_finalTotalPrice;
		this.f_type = f_type;
		this.f_date = f_date;
		this.f_totalEvaluationPrice = f_totalEvaluationPrice;
		this.f_totalProfitLoss = f_totalProfitLoss;
		this.f_totalReturn = f_totalReturn;
		this.f_profitLoss = f_profitLoss;
		this.f_evaluationPrice = f_evaluationPrice;
		this.f_return = f_return;
	}

	public String getItemcode() {
		return itemcode;
	}

	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getNowVal() {
		return nowVal;
	}

	public void setNowVal(int nowVal) {
		this.nowVal = nowVal;
	}

	public float getChangeVal() {
		return changeVal;
	}

	public void setChangeVal(float changeVal) {
		this.changeVal = changeVal;
	}

	public float getChangeRate() {
		return changeRate;
	}

	public void setChangeRate(float changeRate) {
		this.changeRate = changeRate;
	}

	public float getNav() {
		return nav;
	}

	public void setNav(float nav) {
		this.nav = nav;
	}

	public float getThreeMonthEarnRate() {
		return threeMonthEarnRate;
	}

	public void setThreeMonthEarnRate(float threeMonthEarnRate) {
		this.threeMonthEarnRate = threeMonthEarnRate;
	}

	public int getQuant() {
		return quant;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	public int getAmonut() {
		return amonut;
	}

	public void setAmonut(int amonut) {
		this.amonut = amonut;
	}

	public int getMarketSum() {
		return marketSum;
	}

	public void setMarketSum(int marketSum) {
		this.marketSum = marketSum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getF_account() {
		return f_account;
	}

	public void setF_account(String f_account) {
		this.f_account = f_account;
	}

	public int getF_val() {
		return f_val;
	}

	public void setF_val(int f_val) {
		this.f_val = f_val;
	}

	public int getF_cnt() {
		return f_cnt;
	}

	public void setF_cnt(int f_cnt) {
		this.f_cnt = f_cnt;
	}

	public int getF_totalPrice() {
		return f_totalPrice;
	}

	public void setF_totalPrice(int f_totalPrice) {
		this.f_totalPrice = f_totalPrice;
	}

	public int getF_fee() {
		return f_fee;
	}

	public void setF_fee(int f_fee) {
		this.f_fee = f_fee;
	}

	public int getF_finalTotalPrice() {
		return f_finalTotalPrice;
	}

	public void setF_finalTotalPrice(int f_finalTotalPrice) {
		this.f_finalTotalPrice = f_finalTotalPrice;
	}

	public String getF_type() {
		return f_type;
	}

	public void setF_type(String f_type) {
		this.f_type = f_type;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

	public int getF_totalEvaluationPrice() {
		return f_totalEvaluationPrice;
	}

	public void setF_totalEvaluationPrice(int f_totalEvaluationPrice) {
		this.f_totalEvaluationPrice = f_totalEvaluationPrice;
	}

	public int getF_totalProfitLoss() {
		return f_totalProfitLoss;
	}

	public void setF_totalProfitLoss(int f_totalProfitLoss) {
		this.f_totalProfitLoss = f_totalProfitLoss;
	}

	public float getF_totalReturn() {
		return f_totalReturn;
	}

	public void setF_totalReturn(float f_totalReturn) {
		this.f_totalReturn = f_totalReturn;
	}

	public int getF_profitLoss() {
		return f_profitLoss;
	}

	public void setF_profitLoss(int f_profitLoss) {
		this.f_profitLoss = f_profitLoss;
	}

	public int getF_evaluationPrice() {
		return f_evaluationPrice;
	}

	public void setF_evaluationPrice(int f_evaluationPrice) {
		this.f_evaluationPrice = f_evaluationPrice;
	}

	public float getF_return() {
		return f_return;
	}

	public void setF_return(float f_return) {
		this.f_return = f_return;
	}

	


}
