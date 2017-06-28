package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.UserBoardReplyDAO;
import com.parker.user.vo.UserBoardReplyVO;

@Service
@Transactional
public class UserBoardReplyServiceImpl implements UserBoardReplyService{
	@Autowired
	UserBoardReplyDAO UBRDAO;
	@Override
	public List<UserBoardReplyVO> userBoardReplyList(Integer userboard_number) {
		List<UserBoardReplyVO> userBoardReplyList;
		userBoardReplyList = UBRDAO.userBoardReplyList(userboard_number);
		return userBoardReplyList;
	}
	@Override
	public int userBoardReplyInsert(UserBoardReplyVO UBRVO) {
		// TODO Auto-generated method stub
		return UBRDAO.userBoardReplyInsert(UBRVO);
	}
	@Override
	public int userBoardReplyUpdate(UserBoardReplyVO UBRVO) {
		// TODO Auto-generated method stub
		return UBRDAO.userBoardReplyUpdate(UBRVO);
	}
	@Override
	public int userBoardReplyDelete(int userboardreply_number) {
		// TODO Auto-generated method stub
		return UBRDAO.userBoardReplyDelete(userboardreply_number);
	}

}
