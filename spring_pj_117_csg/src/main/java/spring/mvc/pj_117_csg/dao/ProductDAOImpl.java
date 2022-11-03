package spring.mvc.pj_117_csg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_csg.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SqlSession sqlSession; // dataSource로 하던 역할을 이제는 xml에서 담당한다. => dataSource-config.xml - 커넥션풀 + 마이바티스

	// 상품 목록
	@Override
	public List<ProductDTO> productList(Map<String, Object> map) {
		System.out.println("DAO - productList");

		// 방법1
		List<ProductDTO> list = sqlSession.selectList("spring.mvc.pj_117_csg.dao.ProductDAO.productList", map);

		//		 ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		//		 List<ProductDTO> list  = dao.productList(map);

		return list;
	}

	// 상품 갯수
	@Override
	public int productCnt() {
		System.out.println("dao - productCnt");

		// 방법1.
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_csg.dao.ProductDAO.productCnt");

		// 방법2.
		//		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		//		int selectCnt = dao.productCnt();

		return selectCnt;
	}

	//상품 추가 처리
	@Override
	public int productInsert(ProductDTO dto) {
		System.out.println("dao - 상품 추가 처리");

		// 방법1
		//	int insertCnt = sqlSession.insert("spring.mvc.pj_117_csg.dao.ProductDAOImpl.productInsert", dto);
		//	return insertCnt;

		// 방법2
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int insertCnt = dao.productInsert(dto);
		return insertCnt;
	}

	//상품 상세페이지
	@Override
	public ProductDTO productDetail(int pdNo) {
		System.out.println("DAO - productDetail");

		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ProductDTO dto = dao.productDetail(pdNo);

		return dto;
	}

	//상품 수정 처리
	@Override
	public int productUpdate(ProductDTO dto) {

		int updateCnt = sqlSession.update("spring.mvc.pj_117_csg.dao.ProductDAO.productUpdate", dto);

		return updateCnt;
	}

	//상품 삭제 처리
	@Override
	public int productDelete(int pdNo) {

		int deleteCnt = sqlSession.delete("spring.mvc.pj_117_csg.dao.ProductDAO.productDelete", pdNo);

		return deleteCnt;
	}

}
