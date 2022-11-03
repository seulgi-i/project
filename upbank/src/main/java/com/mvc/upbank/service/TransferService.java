package com.mvc.upbank.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.mvc.upbank.dto.TransferDTO;

public interface TransferService {
	
	//1건이체 메소드
	public void transfer(HttpServletRequest req, Model model);

	//1건이체 메소드 처리
	public void transfer2(HttpServletRequest req, Model model);

	//다건이체 메소드
	public void manyTransfer(HttpServletRequest req, Model model);

	//전체이체결과조회
	public List<TransferDTO> transferList(HttpServletRequest req, Model model);

}
