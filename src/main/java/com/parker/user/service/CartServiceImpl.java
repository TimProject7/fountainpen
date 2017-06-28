package com.parker.user.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.CartDAO;
import com.parker.user.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	Logger logger = Logger.getLogger(CartServiceImpl.class);

	@Autowired
	private CartDAO cartDao;

	// 1. 장바구니 추가
	@Override
	public int cartInsert(CartVO cvo) {

		return cartDao.cartInsert(cvo);
	}

	// 2. 장바구니 목록
	@Override
	public List<CartVO> cartList(CartVO cvo) {

		return cartDao.cartList(cvo);

	}
	// 3. 장바구니 삭제

	@Override
	public int cartDelete(int cartlistId) {
		int result = 0;
		result = cartDao.cartDelete(cartlistId);
		return result;
	}
	
	// 장바구니 금액 합계
	@Override
	public int sumMoney(int userId){
		return cartDao.sumMoney(userId);
	}
	
	// 장바구니 수정
	/*
	 * // 4. 장바구니 수정
	 * 
	 * @Override public int update(CartVO vo) { int result = 0; result =
	 * cartDao.update(vo); return result; }
	 */
	/*
	 * // 5. 장바구니 금액 합계
	 * 
	 * @Override public int sumMoney(int userId) { return
	 * cartDao.sumMoney(userId); } // 6. 장바구니 상품 확인
	 * 
	 * @Override public int countCart(int productId, int userId) { return
	 * cartDao.countCart(productId, userId); } // 7. 장바구니 상품 수량 변경
	 * 
	 * @Override public void updateCart(CartVO vo) { cartDao.updateCart(vo); }
	 */

	

}
