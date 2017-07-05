package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.vo.FAQVO;

@Repository
@Transactional
public class FAQDaoImpl implements FAQDao {

	@Autowired
	SqlSession SqlSession;


	// 02. 게시글 상세보기
	@Override
	public FAQVO read(int faq_no) throws Exception {
		return SqlSession.selectOne("faqview", faq_no);
	}



	// 05. 게시글 전체 목록
	@Override
	public List<FAQVO> listAll( FAQVO fvo) throws Exception {
		return SqlSession.selectList("faqlistAll",fvo);
	}

	// 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int faq_no) throws Exception {
		SqlSession.update("faqincreaseViewcnt", faq_no);
	}

	@Override
	public int listCnt(FAQVO fvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("listCnt",fvo);
	}

}
