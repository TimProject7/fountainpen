package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO{
	@Autowired
	SqlSession session;
	
	//1:1문의게시판 리스트
	@Override
	public List<QuestionVO> questionList(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return session.selectList("questionList",QVO);
	}

	@Override
	public QuestionVO questionUser(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return session.selectOne("questionUser", QVO);
	}

	@Override
	public int questionInsert(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return session.insert("questionInsert", QVO);
	}

	@Override
	public QuestionVO questionDetail(int question_number) {
		// TODO Auto-generated method stub
		return session.selectOne("questionDetail", question_number);
	}

	@Override
	public int questionUpdate(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return session.update("DetailUpdate", QVO);
	}

	@Override
	public int questionListCnt(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return session.selectOne("questionListCnt", QVO);
	}
	
	//게시판 조회수증가
	/*@Override
	public void questionViewCount(int question_number) {
		
		session.update("questionViewCount",question_number);
	}*/

}
