package com.parker.user.dao;

import java.util.List;


import com.parker.user.vo.BuyVO;

public interface BuyListDAO {
	
	//구매리스트
	public List<BuyVO> buyListlist(BuyVO bvo);
	
	//구매리스트 카운트
	public int buyListCnt(BuyVO bvo);
}
