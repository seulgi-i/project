package com.team.upbank.seula.dto;

import lombok.Data;


import java.sql.Date;

@Data
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

}
