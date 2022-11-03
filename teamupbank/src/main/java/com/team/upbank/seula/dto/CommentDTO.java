package com.team.upbank.seula.dto;

import lombok.Data;


import java.sql.Date;

@Data
public class CommentDTO {
		private int c_No; 				//글번호
		private int cmt_No; 			//댓글번호
	    private String cmt_content; 	//댓글내용
	    private Date cmt_regDate; 		//댓글작성일
	    private String cmt_name; 		//댓글작성자
	    private String cmt_show; 		//댓글삭제
}
