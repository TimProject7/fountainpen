package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.BuyVO;

@Repository
public class BuyListDAOImpl implements BuyListDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<BuyVO> buyListlist(BuyVO bvo) {
		
		System.out.println("DAO bvo.toString()1 : " + bvo.toString());
		
		return session.selectList("buyListlist", bvo);
	}

	@Override
	public int buyListCnt(BuyVO bvo) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO bvo.toString()2 : " + bvo.toString());
		
		return  session.selectOne("buyListCnt",bvo);
	}

}
