package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.BuyVO;

public interface BuyDAO {
	
	// 주문/결제 장바구니에서 추가
	public int buyInsert(BuyVO bvo);
	
	// 주문/결제 목록
	public List<BuyVO> buyList(BuyVO bvo);

	// 주문/결제 총결제금액
		public int sumMoney(int user_number);
	
}
