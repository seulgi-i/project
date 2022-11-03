package com.mvc.upbank.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface installmentSavingsService {
	
	/////관리자/////
	
	//적금상품 등록(insert) --관리자
	public void inssvnAddAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//적금상품목록(select)  --관리자, 고객
	public void inssvnListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//적금상품 수정			--관리자
	public void inssvnEditAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//적금상세페이지	    --고객용
	public void inssvnDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//이자상세페이지	    --고객용
	public void rateDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	//적금상품 삭제			--관리자
	public void inssvnDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	public void rateDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	
	//이자계산기
	public void inssvnCalcAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	

	
	//적금 가입페이지	--고객
	public void inssvnJoinDetail(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//account테이블 적금 계좌생성
	public void AccDefaultInsert(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	//적금계정 등록 가입
	public void inssvnJoinAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//해지처리
	public void terminateAction2(HttpServletRequest req, Model model)
			throws ServletException, IOException;		
	
	public void transferPage(HttpServletRequest req, Model model)
			throws ServletException, IOException;		
}
