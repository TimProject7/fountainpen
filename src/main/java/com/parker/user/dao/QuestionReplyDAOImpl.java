package com.parker.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.QuestionReplyVO;

@Repository
public class QuestionReplyDAOImpl implements QuestionReplyDAO {
	@Autowired
	SqlSession session;

	@Override
	public QuestionReplyVO questionReply(int question_number) {
		// TODO Auto-generated method stub
		return session.selectOne("questionReply", question_number);
	}

}
