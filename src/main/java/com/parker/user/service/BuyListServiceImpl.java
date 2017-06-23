package com.parker.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.BuyListDAO;
import com.parker.user.vo.BuyListVO;

@Service
@Transactional
public class BuyListServiceImpl implements BuyListService {
	@Inject
	BuyListDAO BDAO;
	
	//구매리스트
	@Override
	public List<BuyListVO> buyList(BuyListVO BVO) {
		List<BuyListVO> buyList= null;
		buyList = BDAO.buyList(BVO);
		return buyList;
	}

	@Override
	public int buyListCnt(BuyListVO BVO) {
		// TODO Auto-generated method stub
		return BDAO.buyListCnt(BVO);
	}

}
