package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.parker.user.vo.UserBoardVO;
import com.parker.user.vo.UserVO;

public interface UserBoardService {
	// 전체 리스트 가져오기
	public List<UserBoardVO> userBoardList(UserBoardVO UBVO);

	public int userBoardListCnt(UserBoardVO UBVO);

	// 글쓰기
	public int userBoardInsert(UserBoardVO UBVO);

	// 상세보기
	public UserBoardVO userBoardDetail(int userboard_number);

	//회원게시판 상세보기 수정
	public int userBoardDetailUpdate(UserBoardVO UBVO);
	
	// 게시판 조회수 증가
	public void userBoardViewCnt(int userboard_number, HttpSession session);
	
}
