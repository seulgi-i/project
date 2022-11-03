package com.mvc.upbank.dto;


public class ChartDTO extends SearchDTO{
    private String date;//날짜
    private int low;	//저가
    private int open;	//시가
    private int close;	//종가
    private int high;	//고가
    private int volume;	//거래량
    private int yesterday; // 전일가
    private int sum_tf_profit; //결산차트용 일별 수수료수익
    
    public ChartDTO() {
	}

	

	public ChartDTO(String date, int low, int open, int close, int high, int volume, int yesterday, int sum_tf_profit) {
		super();
		this.date = date;
		this.low = low;
		this.open = open;
		this.close = close;
		this.high = high;
		this.volume = volume;
		this.yesterday = yesterday;
		this.sum_tf_profit = sum_tf_profit;
	}



	public int getSum_tf_profit() {
		return sum_tf_profit;
	}

	public void setSum_tf_profit(int sum_tf_profit) {
		this.sum_tf_profit = sum_tf_profit;
	}



	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getLow() {
		return low;
	}

	public void setLow(int low) {
		this.low = low;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getClose() {
		return close;
	}

	public void setClose(int close) {
		this.close = close;
	}

	public int getHigh() {
		return high;
	}

	public void setHigh(int high) {
		this.high = high;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getYesterday() {
		return yesterday;
	}

	public void setYesterday(int yesterday) {
		this.yesterday = yesterday;
	}

    
}
