package com.mvc.upbank.dto;

import java.sql.Date;

public class BoardDTO {
	
    private int n_No; 	//글번호
    private String n_title; //글제목
    private String n_content; 		//글내용
    private int n_readCnt; 	//글 조회수
    private Date n_regDate; //글작성일
    private String user_id; 	//글작성자
    private String n_show; //글삭제
    
    private int c_No; 	//글번호
    private String c_title; //글제목
    private String c_category; 	//글번호
    private String c_content; 		//글내용
    private Date c_regDate; //글작성일
    private String c_comment; //답변상태
    private String c_show; //글삭제
    
public BoardDTO() {
}



public BoardDTO(int n_No, String n_title, String n_content, int n_readCnt, Date n_regDate, String user_id,
		String n_show, int c_No, String c_title, String c_category, String c_content, Date c_regDate, String c_comment,
		String c_show) {
	super();
	this.n_No = n_No;
	this.n_title = n_title;
	this.n_content = n_content;
	this.n_readCnt = n_readCnt;
	this.n_regDate = n_regDate;
	this.user_id = user_id;
	this.n_show = n_show;
	this.c_No = c_No;
	this.c_title = c_title;
	this.c_category = c_category;
	this.c_content = c_content;
	this.c_regDate = c_regDate;
	this.c_comment = c_comment;
	this.c_show = c_show;
}



public int getN_No() {
	return n_No;
}

public void setN_No(int n_No) {
	this.n_No = n_No;
}

public String getN_title() {
	return n_title;
}

public void setN_title(String n_title) {
	this.n_title = n_title;
}

public String getN_content() {
	return n_content;
}

public void setN_content(String n_content) {
	this.n_content = n_content;
}

public int getN_readCnt() {
	return n_readCnt;
}

public void setN_readCnt(int n_readCnt) {
	this.n_readCnt = n_readCnt;
}

public Date getN_regDate() {
	return n_regDate;
}

public void setN_regDate(Date n_regDate) {
	this.n_regDate = n_regDate;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getN_show() {
	return n_show;
}

public void setN_show(String n_show) {
	this.n_show = n_show;
}

public int getC_No() {
	return c_No;
}

public void setC_No(int c_No) {
	this.c_No = c_No;
}

public String getC_category() {
	return c_category;
}

public void setC_category(String c_category) {
	this.c_category = c_category;
}

public String getC_title() {
	return c_title;
}

public void setC_title(String c_title) {
	this.c_title = c_title;
}

public String getC_content() {
	return c_content;
}

public void setC_content(String c_content) {
	this.c_content = c_content;
}

public String getC_comment() {
	return c_comment;
}

public void setC_comment(String c_comment) {
	this.c_comment = c_comment;
}

public Date getC_regDate() {
	return c_regDate;
}

public void setC_regDate(Date c_regDate) {
	this.c_regDate = c_regDate;
}

public String getC_show() {
	return c_show;
}

public void setC_show(String c_show) {
	this.c_show = c_show;
}

    
}
