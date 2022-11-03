package com.mvc.upbank.dto;

import java.sql.Date;

public class CommentDTO {
		private int c_No; 				//글번호
		private int cmt_No; 			//댓글번호
	    private String cmt_content; 	//댓글내용
	    private Date cmt_regDate; 		//댓글작성일
	    private String cmt_name; 		//댓글작성자
	    private String cmt_show; 		//댓글삭제
	    
	    public CommentDTO() {}

		public CommentDTO(int c_No, int cmt_No, String cmt_content, Date cmt_regDate, String cmt_name,
				String cmt_show) {
			super();
			this.c_No = c_No;
			this.cmt_No = cmt_No;
			this.cmt_content = cmt_content;
			this.cmt_regDate = cmt_regDate;
			this.cmt_name = cmt_name;
			this.cmt_show = cmt_show;
		}

		public int getC_No() {
			return c_No;
		}

		public void setC_No(int c_No) {
			this.c_No = c_No;
		}

		public int getCmt_No() {
			return cmt_No;
		}

		public void setCmt_No(int cmt_No) {
			this.cmt_No = cmt_No;
		}

		public String getCmt_content() {
			return cmt_content;
		}

		public void setCmt_content(String cmt_content) {
			this.cmt_content = cmt_content;
		}

		public Date getCmt_regDate() {
			return cmt_regDate;
		}

		public void setCmt_regDate(Date cmt_regDate) {
			this.cmt_regDate = cmt_regDate;
		}

		public String getCmt_name() {
			return cmt_name;
		}

		public void setCmt_name(String cmt_name) {
			this.cmt_name = cmt_name;
		}

		public String getCmt_show() {
			return cmt_show;
		}

		public void setCmt_show(String cmt_show) {
			this.cmt_show = cmt_show;
		}

		@Override
		public String toString() {
			return "CommentDTO [c_No=" + c_No + ", cmt_No=" + cmt_No + ", cmt_content=" + cmt_content + ", cmt_regDate="
					+ cmt_regDate + ", cmt_name=" + cmt_name + ", cmt_show=" + cmt_show + "]";
		}
	    
	    
	    
	    
}
