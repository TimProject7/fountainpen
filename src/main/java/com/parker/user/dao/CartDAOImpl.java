package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession session;

	private static final String NAMESPACE = "com.parker.user.dao.CartMapper";

	// 1. 장바구니 추가

	@Override
	public int cartInsert(CartVO cvo) {
		return session.insert(NAMESPACE + ".cartInsert", cvo);
	}

	// 2. 장바구니 목록
	@Override
	public List<CartVO> cartList(CartVO cvo) {
		return session.selectList(NAMESPACE + ".cartList", cvo);
	}
	// 3. 장바구니 삭제

	@Override
	public int cartDelete(int cartlistId) {
		return session.delete(NAMESPACE + ".cartDelete", cartlistId);
	}

	// 4. 장바구니 금액 합계
	@Override
	public int sumMoney(int userId) {
		session.selectOne(NAMESPACE + ".sumMoney", userId);
		return session.selectOne(NAMESPACE + ".sumMoney", userId);
	}

	// 5. 장바구니 수정
	@Override
	public int cartUpdate(CartVO cvo) {
		return session.update(NAMESPACE + ".cartUpdate",cvo);
	}
	
	

	/*
	 * // 4. 장바구니 수정
	 * 
	 * @Override public int update(CartVO vo) { return
	 * session.update(NAMESPACE+"modifyCart", vo); }
	 */
	// 5. 장바구니 금액 합계
	/*
	 * @Override public int sumMoney(int userId) {
	 * session.selectOne(NAMESPACE+"sumMoney", userId); return
	 * session.selectOne(NAMESPACE+"sumMoney", userId); } // 6. 장바구니 동일한 상품 레코드
	 * 확인
	 * 
	 * @Override public int countCart(int productId, int userId) { Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("productId",
	 * productId); map.put("userId", userId); return
	 * session.selectOne(NAMESPACE+"countCart", map); } // 7. 장바구니 상품수량 변경
	 * 
	 * @Override public void updateCart(CartVO vo) {
	 * session.update(NAMESPACE+"updateCart", vo); }
	 */

}
