package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSession session;

	private static final String NAMESPACE = "com.parker.user.dao.ProductMapper";

	/*
	 * @Override public List<ProductVO> listProduct() { // TODO Auto-generated
	 * method stub System.out.println("용호dao1"); return
	 * sqlSession.selectOne("product.listProduct"); }
	 */
	/*
	 * @Override public ProductVO detailProduct(int productId) {
	 * System.out.println("용호dao2"); // TODO Auto-generated method stub return
	 * sqlSession.selectOne("product.detailProduct", productId); }
	 */
	/* 상품목록 */
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList(NAMESPACE + ".productList", pvo);
	}

	/* 상품상세 */
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		return session.selectOne(NAMESPACE + ".productDetail", pvo);
	}
	
	// 전체 레코드 건수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".productListCnt", pvo);
	}

}
