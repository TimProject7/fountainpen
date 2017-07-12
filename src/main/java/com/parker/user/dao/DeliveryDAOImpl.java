package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.BuyVO;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<BuyVO> DeliveryList(BuyVO BVO) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryList", BVO);
	}

	@Override
	public int DeliveryListCnt(BuyVO BVO) {
		// TODO Auto-generated method stub
		return session.selectOne("deliveryListCnt", BVO);
	}

	@Override
	public int DeliveryCancle(int buynumber) {
		// TODO Auto-generated method stub
		return session.update("deliveryCancle", buynumber);
	}

	@Override
	public int DeliveryOk(int buy_number) {
		// TODO Auto-generated method stub
		return session.update("deliveryOk", buy_number);
	}
}
