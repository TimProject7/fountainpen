package com.parker.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.UserBoardVO;

@Repository
public class UserBoardDAOImpl implements UserBoardDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<UserBoardVO> userBoardList(UserBoardVO UBVO) {

		System.out.println("DAO UBVO :" + UBVO.getUser_number());

		return session.selectList("userBoardList", UBVO);
	}

	@Override
	public int userBoardListCnt(UserBoardVO UBVO) {

		return session.selectOne("userBoardListCnt", UBVO);
	}

	@Override
	public int userBoardInsert(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		return session.insert("userBoardInsert", UBVO);
	}

	@Override
	public void userBoardViewCnt(int userboard_number) {
		// TODO Auto-generated method stub

		session.update("userBoardViewCnt", userboard_number);
	}

	@Override
	public UserBoardVO userBoardDetail(int userboard_number) {
		// TODO Auto-generated method stub
		return session.selectOne("userBoardDetail",userboard_number);
	}

	@Override
	public int userBoardDetailUpdate(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		System.out.println("다오 result :"+UBVO);
		return session.update("userBoardDetailUpdate",UBVO);
	}

	@Override
	public int userBoardDetailDelete(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		return session.delete("userBoardDetailDelete",UBVO);
	}

}
