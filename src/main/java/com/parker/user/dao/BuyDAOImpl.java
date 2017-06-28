package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.BuyVO;

@Repository
public class BuyDAOImpl implements BuyDAO {

	@Autowired
	private SqlSession session;

	private static final String NAMESPACE = "com.parker.user.dao.BuyMapper";

	@Override
	public int buyInsert(BuyVO bvo) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".buyInsert", bvo);
	}

	@Override
	public List<BuyVO> buyList(BuyVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".buyList", bvo);
	}

	// 주문/결제 총결제금액
	@Override
	public int sumMoney(int user_number) {
		session.selectOne(NAMESPACE + ".sumMoney", user_number);
		return session.selectOne(NAMESPACE + ".sumMoney", user_number);
	}

}
