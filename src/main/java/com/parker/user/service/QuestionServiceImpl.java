package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.QuestionDAO;
import com.parker.user.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDAO QDAO;

	// 1:1문의게시판 리스트
	@Override
	public List<QuestionVO> questionList(QuestionVO QVO) {
		List<QuestionVO> questionList = null;
		questionList = QDAO.questionList(QVO);
		return questionList;
	}

	@Override
	public QuestionVO questionUser(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return QDAO.questionUser(QVO);
	}

	@Override
	public int questionInsert(QuestionVO QVO) {
		int result = 0;
		result = QDAO.questionInsert(QVO);
		return result;
	}

	@Override
	public QuestionVO questionDetail(int question_number) {
		
		return QDAO.questionDetail(question_number);
	}

	@Override
	public int questionUpdate(QuestionVO QVO) {
		int result=0;
		result=QDAO.questionUpdate(QVO);
		return result;
	}

	@Override
	public int questionListCnt(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return QDAO.questionListCnt(QVO);
	}

}
