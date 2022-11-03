package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.Paging;
import pj.mvc.jsp.dao.ProductDAO;
import pj.mvc.jsp.dao.ProductDAOImpl;
import pj.mvc.jsp.dto.ProductDTO;

public class ProductServiceImpl implements ProductService {

	// 상품등록
	@Override
	public void productAddAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("서비스 => 상품등록");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		ProductDTO dto = new ProductDTO();

		dto.setPdName(req.getParameter("pdName"));

		// 플젝명/upload 해당경로
		// ImageUploadHandler 클래스에서 setAttribute로 fileName 넘김
		String p_img1 = "/jsp_pj_117_csg/resources/upload/" + (String) req.getAttribute("fileName"); // 플젝명/경로
		System.out.println("dto.getPdImg() : " + p_img1);
		dto.setPdImg(p_img1);

		dto.setCategory(req.getParameter("category"));
		dto.setBrand(req.getParameter("brand"));
		dto.setContent(req.getParameter("content"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		dto.setStatus(req.getParameter("status"));

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5단계. 상품정보 insert
		int insertCnt = dao.productInsert(dto);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("insertCnt", insertCnt);

	}

	// 상품목록
	@Override
	public void productListAction(HttpServletResponse res, HttpServletRequest req)
			throws ServletException, IOException {
		System.out.println("서비스 => 상품목록");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		String pageNum = req.getParameter("pageNum");

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5-1단계. 상품 카운트
		int total = dao.productCnt();
		System.out.println("total : " + total);

		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작번호
		int end = paging.getEndRow(); // 페이지별 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 5-2단계. 상품목록 조회
		List<ProductDTO> list = null;

		if (total > 0) {
			list = dao.productList(start, end);

		}
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
	}

	// 상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 => productDetailAction");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		ProductDAO dao = ProductDAOImpl.getInstance();
		// 5-1단계. 상품상세 정보 가져오기
		ProductDTO dto = dao.productDetail(pdNo);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("dto", dto);
	}

	// 상품수정
	@Override
	public void productUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 ->  게시글 수정처리");

		// 3단계. 화면으로부터 입력받은 값
		// 화면값 받아오기(hidden값)
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenPdNo"));
		String hiddenPdImg = req.getParameter("hiddenPdImg");// 기존이미지
		String uploadPdImg = (String) req.getAttribute("fileName");// upload파일명

		System.out.println("hiddenPdImg : " + hiddenPdImg);
		System.out.println("uploadPdImg : " + uploadPdImg);

		// 실제값 받아오기
		ProductDTO dto = new ProductDTO();
		dto.setPdNo(hiddenPdNo);
		dto.setPdName(req.getParameter("pdName"));
		dto.setBrand(req.getParameter("brand"));

		String strPdImg = "";
		// 이미지를 수정하지 않았을 때
		if (uploadPdImg == null) {
			strPdImg = "hiddenPdImg";

			// 이미지를 수정했을 때
		} else {
			strPdImg = "/jsp_pj_117_csg/resources/upload/" + uploadPdImg;
		}

		System.out.println("이미지 -> " + strPdImg);
		dto.setPdImg(strPdImg);
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		dto.setStatus(req.getParameter("status"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5단계. 상품정보 수정하기
		int updateCnt = dao.productUpdate(dto);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("updateCnt", updateCnt);

	}

	// 상품삭제
	@Override
	public void productDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// 3단계. 화면으로부터 입력받은 값
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5단계. 상품정보 수정하기
		int deleteCnt = dao.productDelete(pdNo);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("deleteCnt", deleteCnt);
	}

}
