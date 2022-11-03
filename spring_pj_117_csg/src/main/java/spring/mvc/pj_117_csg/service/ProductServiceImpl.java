package spring.mvc.pj_117_csg.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import page.Paging;
import spring.mvc.pj_117_csg.dao.ProductDAOImpl;
import spring.mvc.pj_117_csg.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAOImpl dao;

	// 상품등록
	@Override
	public void productAddAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("서비스 => 상품등록");

		// 추가 : JSP의 ImageUploader 파일 기능
		MultipartFile file = req.getFile("pdImg"); // 상품이미지
		System.out.println("file : " + file);

		// input경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		// 저장경로(jsp의 img_uploader_dir) : spring_pj117로 변경

		
		String realDir = "D:\\dev117\\workspace\\spring_pj_117_csg\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
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

			ProductDTO dto = new ProductDTO();
			dto.setPdName(req.getParameter("pdName"));

			// 수정S
			String p_img1 = "/pj_117_csg/resources/upload/" + file.getOriginalFilename(); // 컨텍스트명/ => 절대경로
			System.out.println("dto.getPdImg() : " + p_img1);
			// 수정E
			dto.setPdImg(p_img1);

			dto.setCategory(req.getParameter("category"));
			dto.setBrand(req.getParameter("brand"));
			dto.setContent(req.getParameter("content"));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			dto.setStatus(req.getParameter("status"));

			// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
			// ProductDAO dao = ProductDAOImpl.getInstance();

			// 5단계. 상품정보 insert
			int insertCnt = dao.productInsert(dto);

			System.out.println("insertCnt" + insertCnt); // 정상이면 1
			// 6단계. jsp로 처리결과 전달
			model.addAttribute("insertCnt", insertCnt);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();
		}

	}

	// 상품목록
	@Override
	public void productListAction(HttpServletRequest req, Model model) throws ServletException, IOException {

		System.out.println("서비스 - productAddAction");

		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String pageNum = req.getParameter("pageNum");

		// 4단계. 싱글톤으로 dao 객체 생성, 다형성 생성
		// ProductDAO dao = ProductDAOImpl.getInstance();

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

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// List<ProductDTO> list = dao.productList(start, end);
		List<ProductDTO> list = dao.productList(map);
		System.out.println("list => " + list);
		// list => [ProductDTO [pdNo=2, pdName=비스포크,
		// pdImg=/jsp_pj_117_csg/resources/upload/비스포크냉장고.jpg, category=주방가전, brand=삼성,
		// content=소음 없음, price=890000, quantity=5, status=판매중, indate=2022-09-02]]
		// 업로드 폴더를 새로고침하면 등록한 이미지가 들어온다. 새로고침하지 않아도 리스트에 이미지가 뿌려진다.

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("서비스 => productDetailAction");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 4단계. 싱글톤으로 dao객체 생성, 다형성 생성
		// ProductDAO dao = ProductDAOImpl.getInstance();
		// 5-1단계. 상품상세 정보 가져오기
		ProductDTO dto = dao.productDetail(pdNo);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);
	}

	// 상품수정
	@Override
	public void productUpdateAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("서비스 ->  게시글 수정처리");

		// 화면값 받아오기(hidden값)
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenPdNo")); // pk
		String hiddenPdImg = req.getParameter("hiddenPdImg"); // 기존 상품이미지
		System.out.println("hiddenPdImg : " + hiddenPdImg);
		// String uploadPdImg = (String)req.getAttribute("fileName"); // upload 파일명

		///////////////////////////////////////////////////////

		// 추가 : JSP의 ImageUploader 파일 기능
		// productDetailAction.jsp에서 <input type="file" name="pdImg">이므로
		MultipartFile file = req.getFile("pdImg"); // 상품이미지
		System.out.println("file : " + file);

		// input경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);

		// 추가하기 위해 선택할 샘플이미지 경로
		// D:\Dev117\workspace\spring_pj_117_csg\src\main\webapp\resources\images\product_sample

		// output 저장경로(jsp의 img_uploader_dir) : spring_pj117로 변경
		String realDir = "D:\\Dev117\\workspace\\spring_pj_117_csg\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
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
			p_img1 = "/pj_117_csg/resources/upload/" + file.getOriginalFilename(); // 컨텍스트명/경로
			System.out.println("새 이미지 : " + p_img1);
			// 수정E

		} else {
			// 기존 이미지 사용(이미지 수정 안할 경우)
			p_img1 = hiddenPdImg;
			System.out.println("기존 이미지 : " + p_img1);
		}

		// 추가E

		//////////////////////////////////////////////////////

		// 3단계. 화면으로부터 입력받은 값
		ProductDTO dto = new ProductDTO();
		// 실제값 받아오기
		dto.setPdNo(hiddenPdNo); // 누락주의
		dto.setPdName(req.getParameter("pdName"));
		dto.setBrand(req.getParameter("brand"));
		dto.setPdImg(p_img1); // 이미지 추가 주의
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		dto.setStatus(req.getParameter("status"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		// ProductDAO dao = ProductDAOImpl.getInstance();

		// 5단계. 상품정보 수정하기
		int updateCnt = dao.productUpdate(dto);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateCnt", updateCnt);

	}

	// 상품삭제
	@Override
	public void productDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		// 3단계. 화면으로부터 입력받은 값
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));

		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		// ProductDAO dao = ProductDAOImpl.getInstance();

		// 5단계. 상품정보 수정하기
		int deleteCnt = dao.productDelete(pdNo);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
	}
}
