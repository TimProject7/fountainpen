package com.parker.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.DeliveryDAO;
import com.parker.user.vo.BuyVO;
import com.parker.user.vo.DeliveryVO;

@Service
@Transactional
public class DeliveryServiceImpl implements DeliveryService{
	@Inject
	DeliveryDAO deliveryDAO;
	
	//배송정보 리스트
	@Override
	public List<BuyVO> DeliveryList(BuyVO BVO) {
		List<BuyVO> deliveryList;
		deliveryList = deliveryDAO.DeliveryList(BVO);
		// TODO Auto-generated method stub
		return deliveryList;
	}

	@Override
	public int DeliveryListCnt(BuyVO BVO) {
		// TODO Auto-generated method stub
		return deliveryDAO.DeliveryListCnt(BVO);
	}
}
