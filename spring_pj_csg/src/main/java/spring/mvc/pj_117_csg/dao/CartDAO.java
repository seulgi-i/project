package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_csg.dto.CartDTO;


public interface CartDAO {
	
		//장바구니 상품 목록
		public List<CartDTO> cartList(String id);
		
		//상품 갯수
		public int cartCnt();
		
		//장바구니 상품 추가 처리
		public int cartAdd(CartDTO dto);
	
		//장바구니 상품 수정 처리
		public int cartUpdate(CartDTO dto);
		
		//장바구니 상품 삭제 처리
		public int cartDelete(Map<String, Object> map);
		
		//장바구니 비우기 
		public int  cartAllDelete(String id);
				
		//장바구니 중복 상품 체크
		public int checkProduct(Map<String, Object> map);


}
