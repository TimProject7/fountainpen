package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.BuyListVO;

public interface BuyListService {
	//전체 리스트
	public List<BuyListVO> buyList(BuyListVO BVO);
	
	//구매리스트 카운트
	public int buyListCnt(BuyListVO BVO);
}
