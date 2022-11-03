package com.mvc.upbank.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface DepositService {
	
	
	/////관리자/////
	
	//예금상품 등록(insert) --관리자
	public void depositAddAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//예금상품목록(select)  --관리자, 고객
	public void depositListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//예금상품 수정			--관리자
	public void depositEditAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;

	
	//예금상세페이지	    --고객용
	public void depositDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//이자상세페이지	    --고객용
	public void rateDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

	
	//예금상품 삭제			--관리자
	public void depositDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	public void rateDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	

	//예금계산기
	public void depositCalcAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	
	//예금 가입페이지	--고객
	public void depositJoinDetail(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	//가입처리
	public void depositJoinAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	public void AccDefaultInsert(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	
	//만기시) 4.3%...만기시 지급처리가 중도해지에 같이 있어도 되나?걍 이프에 넣으면 되나..?
	
	//예금 조회/해지신청 페이지 (update) -> 예치기간
	public void terminateList(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	//해지처리
	public void terminateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	


}
