package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.UserBoardReplyVO;

public interface UserBoardReplyService {
	// 댓글목록
	public List<UserBoardReplyVO> userBoardReplyList(Integer userboard_number);

	// 댓글 등록
	public int userBoardReplyInsert(UserBoardReplyVO UBRVO);

	// 댓글 수정
	public int userBoardReplyUpdate(UserBoardReplyVO UBRVO);

	//댓글 삭제
		public int userBoardReplyDelete(int userboardreply_number);
}
