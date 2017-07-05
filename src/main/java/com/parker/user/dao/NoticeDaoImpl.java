package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.vo.NoticeVO;

@Repository
@Transactional
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession SqlSession;

	
	// 02. 게시글 상세보기
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		return SqlSession.selectOne("noticeview", notice_no);
	}
	
    // 05. 게시글 전체 목록
	@Override
	public List<NoticeVO> listAll(NoticeVO nvo) throws Exception {
		return SqlSession.selectList("noticelistAll", nvo);
	}
    // 06.게시글 조회수 증가
	@Override
	public void increaseViewcnt(int notice_no) throws Exception {
		SqlSession.update("noticeincreaseViewcnt", notice_no);		
	}
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("noticeListCnt", nvo);
	}
	
}
