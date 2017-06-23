package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.BuyListVO;

@Repository
public class BuyListDAOImpl implements BuyListDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<BuyListVO> buyList(BuyListVO BVO) {
		return session.selectList("buyList", BVO);
	}

	@Override
	public int buyListCnt(BuyListVO BVO) {
		// TODO Auto-generated method stub
		return  session.selectOne("buyListCnt",BVO);
	}

}
