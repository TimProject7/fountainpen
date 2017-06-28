package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.UserBoardReplyVO;

@Repository
public class UserBoardReplyDAOImpl implements UserBoardReplyDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<UserBoardReplyVO> userBoardReplyList(Integer userboard_number) {
		
		return session.selectList("userBoardReplyList", userboard_number);
	}

	@Override
	public int userBoardReplyInsert(UserBoardReplyVO UBRVO) {
		// TODO Auto-generated method stub
		return session.insert("userBoardReplyInsert", UBRVO);
	}

	@Override
	public int userBoardReplyUpdate(UserBoardReplyVO UBRVO) {
		// TODO Auto-generated method stub
		return session.update("userBoardReplyUpdate", UBRVO);
	}

	@Override
	public int userBoardReplyDelete(int userboardreply_number) {
		// TODO Auto-generated method stub
		return session.delete("userBoardReplyDelete",userboardreply_number);
	}

	
}
