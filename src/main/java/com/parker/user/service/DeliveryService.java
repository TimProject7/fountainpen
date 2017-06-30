package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.BuyVO;
import com.parker.user.vo.DeliveryVO;

public interface DeliveryService {

	// 전체리스트
	public List<BuyVO> DeliveryList(BuyVO BVO);

	// 전체 레코드 건수
	public int DeliveryListCnt(BuyVO BVO);
}
