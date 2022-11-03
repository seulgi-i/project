package com.mvc.upbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.upbank.controller.AdminSearchController;
import com.mvc.upbank.dao.DepositDAO;
import com.mvc.upbank.dao.SearchDAO;
import com.mvc.upbank.dao.TransferDAO;
import com.mvc.upbank.dao.installmentSavingsDAO;
import com.mvc.upbank.dto.DepositDTO;
import com.mvc.upbank.dto.SearchDTO;
import com.mvc.upbank.dto.TransferDTO;

@Service
public class DepositServiceImpl implements DepositService{
	
	private static final Logger logger = LoggerFactory.getLogger(DepositService.class);
	
	@Autowired
	DepositDAO dao;
	@Autowired	
	SearchDAO dao2;
	@Autowired	
	installmentSavingsDAO dao3;
	@Autowired	
	TransferDAO dao4;
	
	//예금목록
	@Override
	public void depositListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		logger.info("서비스 => depositListAction");

		List<DepositDTO> list = dao.depositList();
		
 
		model.addAttribute("list", list);
	}	
	
	//예금상세페이지 --고객
	@Override
	public void depositDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("서비스 => depositDetailAction");
		
		String y_name = req.getParameter("y_name");
		DepositDTO dto = dao.depositDetailPage(y_name);
		
		model.addAttribute("dto", dto);
	}
	
	//이자상세페이지 --고객
	@Override
	public void rateDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("서비스 => rateDetailAction");

		int[] month = {1, 6, 12, 24, 36};
			for(int i=0; i<month.length; i++)	{
				String y_name = req.getParameter("y_name");
				List<DepositDTO> list2 = dao.rateDetailPage(y_name);

				model.addAttribute("list2", list2); //이자 tbl
			}
	}


	//예금상품등록
	@Override
	public void depositAddAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException { 
				
				String y_name = req.getParameter("y_name");
				
				// 추가 : JSP의 ImageUploader 파일 기능
				MultipartFile file = req.getFile("y_fileImg"); // 상품이미지

				// input경로
				String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
				// 저장경로(jsp의 img_uploader_dir) : spring_pj117로 변경

				String realDir = "D:\\dev117\\team_workspace\\upbank\\src\\main\\webapp\\resources\\upload\\";
				FileInputStream fis = null;
				FileOutputStream fos = null;
				try {
					file.transferTo(new File(saveDir + file.getOriginalFilename()));
					fis = new FileInputStream(saveDir + file.getOriginalFilename());
					fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
					
					DepositDTO dto = new DepositDTO();
					
					// 수정S
					String p_img1 = "/upbank/resources/upload/" + file.getOriginalFilename(); // 컨텍스트명/ => 절대경로
					// 수정E
					dto.setY_fileImg(p_img1);
					dto.setY_summary(req.getParameter("y_summary"));
					dto.setY_type(req.getParameter("y_type"));
					dto.setY_max_date(Integer.parseInt(req.getParameter("y_max_date")));
					dto.setY_min_date(Integer.parseInt(req.getParameter("y_min_date")));
					dto.setY_min_price(Integer.parseInt(req.getParameter("y_min_price")));
					dto.setY_max_price(Integer.parseInt(req.getParameter("y_max_price")));
					dto.setY_explanation(req.getParameter("y_explanation"));
					dto.setY_notice(req.getParameter("y_notice"));
					dto.setY_name(y_name);
					// 5단계. 상품정보 insert
					int insertCnt = dao.depositInsert(dto);
					
					Map<String, Object> map = new HashMap<String, Object>();
					int[] month = {1, 6, 12, 24, 36};
					int updateCnt = 0; 
						for(int i=0; i<month.length; i++)	{
							try {
								map.put("rate", Double.parseDouble(req.getParameter("rate" + month[i])));
								dto.setRate(Double.parseDouble(req.getParameter("rate" + month[i])));
								updateCnt = dao.depositUpdate(dto);
							} catch(NumberFormatException e) {
								e.printStackTrace();
								try {
									dto.setRate(Double.parseDouble(req.getParameter("rate" + month[i-1])));
									updateCnt = dao.depositUpdate(dto);
									map.put("rate", 0);
								} catch(NumberFormatException e1) {
									e1.printStackTrace();
								}
							}
							map.put("month", month[i]);
							map.put("y_name", y_name);
							int insertCnt2 = dao.rateInsert(map);
							model.addAttribute("insertCnt2", insertCnt2); //이자 tbl
							model.addAttribute("updateCnt", updateCnt);	//상품 tbl
						}
						// 6단계. jsp로 처리결과 전달
						model.addAttribute("insertCnt", insertCnt);	//상품 tbl
						
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (fis != null)
						fis.close();
					if (fos != null)
						fos.close();
				}
			}
		
	//예금수정
	@Override
	public void depositEditAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException {
			logger.info("서비스 -> 예금수정처리");

			// 화면값 받아오기(hidden값)
			String hiddenName = req.getParameter("hiddenName"); // pk
			String hiddenFileImg = req.getParameter("hiddenFileImg"); // 기존 상품이미지
			String hiddenActype = req.getParameter("hiddenActype");
			// String uploadPdImg = (String)req.getAttribute("fileName"); // upload 파일명

			///////////////////////////////////////////////////////

			// 추가 : JSP의 ImageUploader 파일 기능
			// productDetailAction.jsp에서 <input type="file" name="pdImg">이므로
			MultipartFile file = req.getFile("y_fileImg"); // 상품이미지

			// input경로
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");

			// 추가하기 위해 선택할 샘플이미지 경로
			// D:\Dev117\workspace\spring_pj_117_csg\src\main\webapp\resources\images\product_sample

			// output 저장경로(jsp의 img_uploader_dir) : spring_pj117로 변경
			String realDir = "D:\\Dev117\\team_workspace\\upbank\\src\\main\\webapp\\resources\\upload\\";
			String p_img1 = "";
			FileInputStream fis = null;
			FileOutputStream fos = null;

			// 이미지를 수정하고자 할 경우 선택한 이미지를 p_img에 등록
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				try {

					file.transferTo(new File(saveDir + file.getOriginalFilename()));

					fis = new FileInputStream(saveDir + file.getOriginalFilename());
					fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}

				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (fis != null)
						fis.close();
					if (fos != null)
						fos.close();
				}

				// 수정S
				p_img1 = "/upbank/resources/upload/" + file.getOriginalFilename(); // 컨텍스트명/경로
				// 수정E

			} else {
				// 기존 이미지 사용(이미지 수정 안할 경우)
				p_img1 = hiddenFileImg;
			}

			// 추가E
			//////////////////////////////////////////////////////

			// 3단계. 화면으로부터 입력받은 값
			DepositDTO dto = new DepositDTO();
			
			// 수정E
			dto.setY_fileImg(p_img1);
			dto.setY_summary(req.getParameter("y_summary"));
			dto.setY_type(req.getParameter("y_type"));
			dto.setY_max_date(Integer.parseInt(req.getParameter("y_max_date")));
			dto.setY_min_date(Integer.parseInt(req.getParameter("y_min_date")));
			dto.setY_min_price(Integer.parseInt(req.getParameter("y_min_price")));
			dto.setY_max_price(Integer.parseInt(req.getParameter("y_max_price")));
			dto.setY_explanation(req.getParameter("y_explanation"));
			dto.setY_notice(req.getParameter("y_notice"));
			dto.setY_name(hiddenName);
			// 5단계. 상품정보 insert
			int updateCnt = dao.depositUpdate(dto);
			
			Map<String, Object> map = new HashMap<String, Object>();
			int[] month = {1, 6, 12, 24, 36};
				for(int i=0; i<month.length; i++)	{
					
					try {
						map.put("rate", Double.parseDouble(req.getParameter("rate" + month[i])));
						dto.setRate(Double.parseDouble(req.getParameter("rate" + month[i])));
						updateCnt = dao.depositUpdate(dto);
					} catch(Exception e) {
						e.printStackTrace();
						try {
							dto.setRate(Double.parseDouble(req.getParameter("rate" + month[i-1])));
							updateCnt = dao.depositUpdate(dto);
							map.put("rate", 0);
						} catch(Exception e1) {
							e1.printStackTrace();
						}
					}
					map.put("month", month[i]);
					map.put("y_name", hiddenName);
					int updateCnt2 = dao.rateUpdate(map);
					model.addAttribute("updateCnt", updateCnt); //이자 tbl
					model.addAttribute("updateCnt2", updateCnt2); //이자 tbl
				}
	}
	//예금상품삭제
	@Override
	public void depositDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("서비스 - depositDeleteAction(예금상품삭제)");
		String y_name = req.getParameter("y_name");

		// 5단계. 상품정보 수정하기
		int deleteCnt = dao.depositDelete(y_name);

	}
	//이자상품삭제
	@Override
	public void rateDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		String y_name = req.getParameter("y_name");

		// 5단계. 상품정보 수정하기
		int deleteCnt2 = dao.rateDelete(y_name);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("deleteCnt2", deleteCnt2);
	}	
	
	//이자계산기
	@Override
	public void depositCalcAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("서비스 - depositCalcAction(이자계산기)");
		int y_balance = Integer.parseInt(req.getParameter("y_balance"));
		int month = Integer.parseInt(req.getParameter("y_end_date"));
		double rate = Double.parseDouble(req.getParameter("rate"));
		
		DepositDTO dto = new DepositDTO();
	      dto.setBalance(y_balance);
	      dto.setMonth(month);
	      dto.setRate(rate);
	     
	      model.addAttribute("dto", dto); 
	}
	//가입페이지
		@Override
		public void depositJoinDetail(HttpServletRequest req, Model model) throws ServletException, IOException {
			logger.info("서비스 - depositJoinDetail(가입페이지)");
			String y_name = req.getParameter("y_name");
			Map<String, Object> map = new HashMap<String, Object>();
			String id = (String) req.getSession().getAttribute("customerID");
			String ACCOUNT_TYPE = "입출금";
			map.put("id", id);
			map.put("ACCOUNT_TYPE", ACCOUNT_TYPE);
			List<SearchDTO> list = dao2.SearchProductName(map); //입출금계좌
		    DepositDTO dto2 = dao.depositDetailPage(y_name); //deposit_tbl
		    
			
			//6단계. add된 lsit값을 jsp로 전달한다.
			model.addAttribute("dto2", dto2);
			model.addAttribute("list", list);
		}
		
		//계좌생성
		@Override
		public void AccDefaultInsert(HttpServletRequest req, Model model) throws ServletException, IOException {
			logger.info("서비스 - DepositService (예금계좌생성) ");
			String y_name = req.getParameter("y_name");
			String ACCOUNT_PW = req.getParameter("ACCOUNT_PW");
			String ACCOUNT_PW_RE = req.getParameter("ACCOUNT_PW_RE");
			String id = String.valueOf(req.getSession().getAttribute("customerID"));
			String ACCOUNT_TYPE = req.getParameter("ACCOUNT_TYPE");
			int insertCnt = 0; 
			SearchDTO dto = null;
			List<SearchDTO> list;
			
			//비밀번호확인 통과, 기존가입계좌 없음
			if (ACCOUNT_PW.equals(ACCOUNT_PW_RE)) {
				dto = new SearchDTO();
				dto.setACCOUNT_NAME(dao2.SearchAccName(id));
				dto.setPRODUCT_NAME(y_name);
				dto.setID(id);
				dto.setACCOUNT_PW(ACCOUNT_PW);
				dto.setACCOUNT_TYPE(ACCOUNT_TYPE);

				insertCnt = dao.depositDefaultInsert(dto);
				
				list = dao.depositName(id);
			} 
			model.addAttribute("dto", dto);
			model.addAttribute("insertCnt", insertCnt);
		}
		
	//가입처리 (insert -> Deposit테이블 > 입출금통장 금액 -update > 생성된계좌금액 +update )
	@Override 
	public void depositJoinAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("서비스 : 예금가입처리 - inssvnJoinAction ");
		 //account, rate, i_type, i_balance, i_end_date
		String id = (String) req.getSession().getAttribute("customerID");
		String y_name = req.getParameter("y_name");
		
		int month = Integer.parseInt(req.getParameter("y_end_date"));
		
		String tf_account = req.getParameter("account"); 
		
		String PRODUCT_NAME = req.getParameter("product_name"); 

		int y_money = Integer.parseInt(req.getParameter("y_money"));
			
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("PRODUCT_NAME", y_name);
		map.put("id", id);
		
		DepositDTO dto = new DepositDTO();
		dto.setAccount(dao.depositAccount(map));
		dto.setTf_account(tf_account); //인출계좌
		dto.setY_money(y_money); //신규계좌 가입금액
		dto.setId(id);
		dto.setY_name(y_name);
		dto.setTf_product_name(PRODUCT_NAME);
		
		map.put("ACCOUNT", dao.depositAccount(map)); //입금계좌
		map.put("id",id);
		SearchDTO dto2 = dao2.SearchAccAllColumn(map);   // account에 등록된 예금new_date(가입일)가져오기
		dto.setMonth(month);	//가입기간
		dto.setY_end_date(dto2.getNEW_DATE());	//만기일
		
		int insertCnt = dao.depositJoin(dto); //신규 계좌에 정보 입력 deposit에 입력
		model.addAttribute("insertCnt", insertCnt);
		
		
		//////////////////////이체///////////////////////	
		//예금계좌 생성되고 가입정보까지 입력 되면 '계좌이체' 실행
		
		
		int balSetCnt = 0; //어카운트 테이블에 잔고변경 인서트(돈 빠져나가는 계좌)
		int balSetUpCnt = 0; //어카운트 테이블에 잔고변경 인서트(돈 들어오는 업뱅크계좌)
		int insertCnt2; //이체내역 성공여부
		
		if(insertCnt == 1) { 
			Map<String, Object> map2 = new HashMap<String, Object>();
			int BALANCE;
			map2.put("ACCOUNT", tf_account); //출금계좌
			map2.put("id",id);		
			SearchDTO dto3 = dao2.SearchAccAllColumn(map2); //출금계좌정보(통장금액가져오려고 씀)
			TransferDTO dto4 = new TransferDTO(); //계좌이체 dto 준비
			dto3.setACCOUNT(tf_account); //출금계좌
			String depoAc = dto.getAccount();
			
			// dto4 : 계좌이체 내역을 남기기위한 dto
			dto4.setACCOUNT(tf_account);
			dto4.setTf_sender_acc(depoAc); //입금계좌
			dto4.setTf_bank("UpBank");		//입금은행
			dto4.setTf_amount(y_money); //입금금액
			dto4.setTf_acc_holder(dto3.getACCOUNT_NAME()); //예금주
			dto4.setTf_charges(0);				//당행이체이므로 수수료 0원
			dto4.setTf_sender_comment(".");
			dto4.setTf_deposit_comment(".");
			BALANCE = dto3.getBALANCE() - y_money; //출금계좌잔액 - 가입금액을 balance에 담음
			map2.put("BALANCE", BALANCE);	 //출금계좌잔액-가입금액
			
			balSetCnt = dao4.transferBalanceSet(map2); //ACCOUNT + BALANCE 넣어서 출금업데이트
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("ACCOUNT", depoAc); //예금계좌
			map3.put("id", id);
			SearchDTO sdto2 = dao2.SearchAll(depoAc); //입금계좌 모든정보 검색
			BALANCE = sdto2.getBALANCE() + y_money; //입금통장 잔액 + 입금액
			map3.put("BALANCE", BALANCE);
			balSetUpCnt = dao4.transferBalanceSet(map3); //잔고변경됨(+)
			insertCnt2 = dao4.transferInfoInsert(dto4); 
			
			model.addAttribute("insertCnt2", insertCnt2);
		}
	}

	//상품조회/해지신청 페이지
	@Override
	public void terminateList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("서비스 => depositListAction(상품조회/해지신청 페이지)");
		String id = (String) req.getSession().getAttribute("customerID");
		
		List<DepositDTO> list = dao.terminateListPage(id);
 
		model.addAttribute("list", list);	  //search
	}
	//만기전 해지 처리
	@Override
	public void terminateAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("서비스 => terminateAction(만기전 해지처리)");
		//1단계 deposit테이블 상태 - 만기전 해지 update
		String id = (String) req.getSession().getAttribute("customerID");
		String y_name = req.getParameter("PRODUCT_NAME");
		String ACCOUNT = req.getParameter("account");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("y_name", y_name);
		int updateCnt = dao.depositStateUpdate(map);
		
		// 1-1) rate, account, deposit JOIN select문 실행
		if(updateCnt != 0) {
			int date = dao.depositCancleDate(map);
			// 1-2) if문으로 month 1, 6, 12, 24, 36중 어디보다 낮은지 체크 
			if(date/30<1) {
				map.put("month", 1);
			} else if(date/30>=1 && date/30<6) {
				map.put("month", 6);
			} else if(date/30>=6 && date/30<12) {
				map.put("month", 12);
			} else if( date/30>=12 && date/30<24) {
				map.put("month", 24);
			} else {
				map.put("month", 36);
			}
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("ACCOUNT", ACCOUNT); 
			map2.put("id", id);
			DepositDTO dto = dao.depositCancle(map);  //예금정보
			SearchDTO dto2 = dao2.SearchAccAllColumn(map2);
			// 1-2-1) 해당 월에 맞는 rate 적용해서 연산 ( balance = balance + 금액 * rate )
			Map<String, Object> map5 = new HashMap<String, Object>();
			map5.put("ACCOUNT",dto.getTf_account());
			map5.put("id", id);
			SearchDTO dto3 = dao2.SearchAccAllColumn(map5);
			double oldBal = dto3.getBALANCE();
			double getVal = dto2.getBALANCE();
			double getRate = dto.getRate()/100;
			double Balance = oldBal+getVal+ getVal* getRate;
			int addBal = (int)(getVal+getVal*getRate);
			int Bal = (int)Balance;
			model.addAttribute("Bal", Bal);
			model.addAttribute("getRate", getRate);
			// 1-2-2) 출금통장에 (원금+이자)입금해주기 (해지시 입금통장은 출금통장으로) update
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("id", id);
			map3.put("BALANCE", Bal);   //(원금+이자)금액
			map3.put("PRODUCT_NAME", dto.getTf_product_name()); //출금통장이었던 tf_product_name을 가져옴
			int updateCnt2 = dao.depositMoneyPlus(map3);  
			if(updateCnt2 == 1) {
				//2단계 어카운트 테이블 상태 - account_atate 해지,  delete_date sysdate, balance 0으로 업데이트
				Map<String, Object> map4 = new HashMap<String, Object>();
				map4.put("id", id);
				map4.put("PRODUCT_NAME", y_name);
				int updateCnt3 = dao.depositMoneyMinus(map4);
				model.addAttribute("updateCnt3", updateCnt3);	  // 통장폐지+이체성공
				
				///거래내역///
				TransferDTO dto4 = new TransferDTO(); //계좌이체 dto 준비
				
				dto4.setACCOUNT(ACCOUNT);
				dto4.setTf_sender_acc(dto.getTf_account()); //입금계좌(입출금통장)
				dto4.setTf_bank("UpBank");		//입금은행
				dto4.setTf_amount(addBal); //입금금액
				dto4.setTf_acc_holder(dto2.getACCOUNT_NAME()); //예금주
				dto4.setTf_charges(0);				//당행이체이므로 수수료 0원
				dto4.setTf_sender_comment("예금해지");
				dto4.setTf_deposit_comment(".");

				int insertCnt = dao4.transferInfoInsert(dto4); 
				model.addAttribute("insertCnt", insertCnt);
			}
		}
		
	}

}
	

