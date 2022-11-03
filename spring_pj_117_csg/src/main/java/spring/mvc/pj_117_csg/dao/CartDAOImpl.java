package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_csg.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSession sqlSession;

	// 장바구니목록
	@Override
	public List<CartDTO> cartList(String id) {
		System.out.println("DAO - 장바구니목록");

		List<CartDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.CartDAO.cartList", id);

			
		return list;
	}
	//장바구니 상품갯수 (장바구니 목록 불러올 때 비었는지 체크하는 용도)
	@Override
	public int cartCnt() {
		System.out.println("dao - CartCnt");
		
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		
		int selectCnt = dao.cartCnt();
		
		return selectCnt;
	}

	// 장바구니 상품 추가
	@Override
	public int cartAdd(CartDTO dto) {
		System.out.println("dao - 장바구니 상품 추가");

		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int insertCnt = dao.cartAdd(dto);
		return insertCnt;
	}

	// 장바구니 수량 변경
	@Override
	public int cartUpdate(CartDTO dto) {
		System.out.println("dao - 장바구니 수량 변경");

		int updateCnt = sqlSession.update("spring.mvc.pj_117_csg.dao.CartDAO.cartUpdate", dto);
	

		return updateCnt;
	}

	// 장바구니 선택/개별 삭제
	@Override
	public int cartDelete(Map<String, Object> map) {
		
		int deleteCnt = sqlSession.delete("spring.mvc.pj_117_csg.dao.CartDAO.cartDelete", map); 	
		
		return deleteCnt;
	}
	
	// 장바구니 비우기
	@Override
	public int cartAllDelete(String id) {
		System.out.println("dao -  장바구니 비우기");

			int AdeleteCnt = sqlSession.delete("spring.mvc.pj_117_csg.dao.CartDAO.cartAllDelete", id); 	
			
		return AdeleteCnt;
	}

	// 중복상품 처리
	@Override
	public int checkProduct(Map<String, Object> map) {
		System.out.println("dao - 중복상품 처리");
		
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int selectCnt = dao.checkProduct(map);
    
		return selectCnt;
	}

}
