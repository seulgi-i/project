package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.ProductDTO;

public interface ProductDAO {

	//상품 추가 처리
	public int productInsert(ProductDTO dto);
	
	//상품 갯수
	public int productCnt();
	
	//상품 목록
	public List<ProductDTO> productList(int start, int end);
	
	//상품 상세페이지
	public ProductDTO productDetail(int pdNo);	
	
	//상품 수정 처리
	public int productUpdate(ProductDTO dto);

	
	//상품 삭제 처리
	public int productDelete(int pdNo);
	

}
