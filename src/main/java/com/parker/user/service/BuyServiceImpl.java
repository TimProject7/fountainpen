package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.BuyDAO;
import com.parker.user.vo.BuyVO;

@Service
@Transactional
public class BuyServiceImpl implements BuyService {

	@Autowired
	private BuyDAO buyDao;

	@Override
	public int buyInsert(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.buyInsert(bvo);
	}

	@Override
	public List<BuyVO> buyList(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.buyList(bvo);
	}
	
	// 주문/결제 총결제금액
		@Override
		public int sumMoney(int user_number){
			return buyDao.sumMoney(user_number);
		}
	
}
