package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.BuyVO;

public interface BuyService {

	// 주문/결제 카트리스트 추가
	public int buyInsert(BuyVO bvo);
	
	// 주문/결제 목록확인
	public List<BuyVO> buyList(BuyVO bvo);

	// 주문/결제 총결제금액
	public int sumMoney(int user_number);

	
}
