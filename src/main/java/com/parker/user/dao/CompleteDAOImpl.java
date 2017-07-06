package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.CompleteVO;

@Repository
public class CompleteDAOImpl implements CompleteDAO {

	@Autowired
	private SqlSession session;

	private static final String NAMESPACE = "com.parker.user.dao.BuyMapper";

	// 구매내역 목록
	@Override
	public List<CompleteVO> CompleteList(CompleteVO cpvo) {
		System.out.println("DAOIMPL 확인 = " + cpvo);
		return session.selectList(NAMESPACE + ".completeList", cpvo);
	}

	// 결제완료
	@Override
	public int completeUpdate(CompleteVO cpvo) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".completeUpdate", cpvo);
	}

	@Override
	public int completeDelete(int user_number) {
		// TODO Auto-generated method stub
		return session.delete(NAMESPACE+".completeDelete", user_number);
	}

	
}
