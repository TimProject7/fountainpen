package com.parker.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.QuestionReplyDAO;
import com.parker.user.vo.QuestionReplyVO;

@Service
@Transactional
public class QuestionReplyServiceImpl implements QuestionReplyService {
	@Autowired
	QuestionReplyDAO QRDAO;

	@Override
	public QuestionReplyVO questionReply(int question_number) {
		// TODO Auto-generated method stub
		return QRDAO.questionReply(question_number);
	}

}
