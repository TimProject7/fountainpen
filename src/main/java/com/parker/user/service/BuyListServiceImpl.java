package com.parker.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.BuyListDAO;
import com.parker.user.vo.BuyVO;

@Service
@Transactional
public class BuyListServiceImpl implements BuyListService {
	@Inject
	BuyListDAO BDAO;
	
	//구매리스트
	@Override
	public List<BuyVO> buyListlist(BuyVO bvo) {
		List<BuyVO> buyListlist= null;
		buyListlist = BDAO.buyListlist(bvo);
		
		System.out.println("서비스 buyListlist.toString()1 : " + buyListlist.toString());
		return buyListlist;
	}

	@Override
	public int buyListCnt(BuyVO bvo) {
		// TODO Auto-generated method stub
		
		System.out.println("서비스 bvo.toString()2 : " +bvo.toString());
		return BDAO.buyListCnt(bvo);
	}

}
