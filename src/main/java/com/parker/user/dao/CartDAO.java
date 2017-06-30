package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.CartVO;

public interface CartDAO {

	// 장바구니 추가
	public int cartInsert(CartVO cvo);

	// 장바구니 리스트
	public List<CartVO> cartList(CartVO cvo);

	// 장바구니 삭제
	public int cartDelete(int cartlistId);

	// 장바구니 금액 합계
	public int sumMoney(int userId);

	// 장바구니 수정
	public int cartUpdate(CartVO cvo);
	
	
	/*
	 * // 장바구니 수정 public int update(CartVO vo);
	 */
	/*
	 * // 장바구니 금액 합계 public int sumMoney(int userId); // 장바구니 상품 확인 public int
	 * countCart(int productId, int userId); // 장바구니 상품수량 변경 public void
	 * updateCart(CartVO vo);
	 */

	
}