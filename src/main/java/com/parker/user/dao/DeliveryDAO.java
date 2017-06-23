package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.DeliveryVO;

public interface DeliveryDAO {
	//전체리스트
	public List<DeliveryVO> DeliveryList(DeliveryVO DVO);
	
	//전체 레코드 건수
	public int DeliveryListCnt(DeliveryVO DVO);
}
