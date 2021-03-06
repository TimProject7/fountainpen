package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.BuyVO;

public interface DeliveryDAO {
	// 전체리스트
	public List<BuyVO> DeliveryList(BuyVO BVO);

	// 전체 레코드 건수
	public int DeliveryListCnt(BuyVO BVO);

	// 배송취소
	public int DeliveryCancle(int buynumber);

	// 배송취소
	public int DeliveryOk(int buy_number);
}
