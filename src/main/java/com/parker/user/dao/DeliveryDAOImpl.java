package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.DeliveryVO;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO{
	
	@Autowired
	SqlSession session;

	@Override
	public List<DeliveryVO> DeliveryList(DeliveryVO DVO) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryList", DVO);
	}

	@Override
	public int DeliveryListCnt(DeliveryVO DVO) {
		// TODO Auto-generated method stub
		return session.selectOne("deliveryListCnt", DVO);
	}
}
