package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.NoticeVO;

public interface NoticeDao {


	// 02. 게시글 상세보기
	public NoticeVO read(int notice_no) throws Exception;
;

	// 05. 게시글 전체 목록
	public List<NoticeVO> listAll(NoticeVO nvo) throws Exception;

	// 06. 게시글 조회 증가
	public void increaseViewcnt(int notice_no) throws Exception;

	public int noticeListCnt(NoticeVO nvo);

}
