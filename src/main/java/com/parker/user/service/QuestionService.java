package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.parker.user.vo.QuestionVO;

public interface QuestionService {
	// 1:1문의게시판 리스트
	public List<QuestionVO> questionList(QuestionVO QVO);
	public QuestionVO questionUser(QuestionVO QVO);
	
	//글쓰기
	public int questionInsert(QuestionVO QVO);
	//상세보기
	public QuestionVO questionDetail(int question_number);
	
	//수정하기
	public int questionUpdate(QuestionVO QVO);
	
	//레코드건수
	public int questionListCnt(QuestionVO QVO);
	
	//게시판 조회수 증가
	//public void questionViewCount(int question_number, HttpSession session);
}
