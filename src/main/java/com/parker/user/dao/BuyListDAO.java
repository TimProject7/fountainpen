package com.parker.user.dao;

import java.util.List;


import com.parker.user.vo.BuyListVO;

public interface BuyListDAO {
	
	//구매리스트
	public List<BuyListVO> buyListlist(BuyListVO BVO);
	
	//구매리스트 카운트
	public int buyListCnt(BuyListVO BVO);
}
