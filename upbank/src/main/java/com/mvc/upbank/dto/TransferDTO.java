package com.mvc.upbank.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data

public class TransferDTO {
	  int tf_num;	//이체 번호
	  String ACCOUNT;	// 계좌 번호
	  String tf_sender_acc;	//받는사람 계좌
	  String tf_bank;	//받는사람 은행
	  int tf_amount;	//금액
	  Date tf_date;	//입출금 날짜
	  String tf_sender_comment;	//보낸사람 표시 내용
	  String tf_deposit_comment;	//받는사람 표시 내용
	  String tf_acc_holder;	//예금주
	  int tf_charges;	//수수료
	  
	  public TransferDTO() {}
	  
	  

	public TransferDTO(int tf_num, String aCCOUNT, String tf_sender_acc, String tf_bank, int tf_amount, Date tf_date,
			String tf_sender_comment, String tf_deposit_comment, String tf_acc_holder, int tf_charges) {
		super();
		this.tf_num = tf_num;
		ACCOUNT = aCCOUNT;
		this.tf_sender_acc = tf_sender_acc;
		this.tf_bank = tf_bank;
		this.tf_amount = tf_amount;
		this.tf_date = tf_date;
		this.tf_sender_comment = tf_sender_comment;
		this.tf_deposit_comment = tf_deposit_comment;
		this.tf_acc_holder = tf_acc_holder;
		this.tf_charges = tf_charges;
	}



	public int getTf_num() {
		return tf_num;
	}

	public void setTf_num(int tf_num) {
		this.tf_num = tf_num;
	}

	public String getACCOUNT() {
		return ACCOUNT;
	}

	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}

	public String getTf_sender_acc() {
		return tf_sender_acc;
	}

	public void setTf_sender_acc(String tf_sender_acc) {
		this.tf_sender_acc = tf_sender_acc;
	}

	public String getTf_bank() {
		return tf_bank;
	}

	public void setTf_bank(String tf_bank) {
		this.tf_bank = tf_bank;
	}

	public int getTf_amount() {
		return tf_amount;
	}

	public void setTf_amount(int tf_amount) {
		this.tf_amount = tf_amount;
	}

	public Date getTf_date() {
		return tf_date;
	}

	public void setTf_date(Date tf_date) {
		this.tf_date = tf_date;
	}

	public String getTf_sender_comment() {
		return tf_sender_comment;
	}

	public void setTf_sender_comment(String tf_sender_comment) {
		this.tf_sender_comment = tf_sender_comment;
	}

	public String getTf_deposit_comment() {
		return tf_deposit_comment;
	}

	public void setTf_deposit_comment(String tf_deposit_comment) {
		this.tf_deposit_comment = tf_deposit_comment;
	}

	public String getTf_acc_holder() {
		return tf_acc_holder;
	}

	public void setTf_acc_holder(String tf_acc_holder) {
		this.tf_acc_holder = tf_acc_holder;
	}

	public int getTf_charges() {
		return tf_charges;
	}

	public void setTf_charges(int tf_charges) {
		this.tf_charges = tf_charges;
	}
	  
}
