package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.CartVO;

public interface CartService {

	// 장바구니 추가
	public int cartInsert(CartVO cvo);

	// 장바구니 목록
	public List<CartVO> cartList(CartVO vo);

	// 장바구니 삭제
	public int cartDelete(int cartlistId);

	// 장바구니 금액 합계
	public int sumMoney(int userId);

	// 장바구니 수정
	/*
	 * // 장바구니 수정 public int update(CartVO vo);
	 */
	/*
	 * // 장바구니 금액 합계 public int sumMoney(int userId); // 장바구니 상품확인 public int
	 * countCart(int productId, int userId); //장바구니 상품수량 변경 public void
	 * updateCart(CartVO vo);
	 */

}
