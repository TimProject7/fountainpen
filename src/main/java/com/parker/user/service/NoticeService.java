package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.parker.user.vo.NoticeVO;

public interface NoticeService {

	// 02. 게시글 상세보기
	public NoticeVO read(int notice_no) throws Exception;

	// 05. 게시글 전체 목록
	public List<NoticeVO> listAll(NoticeVO nvo) throws Exception;

	// 06. 게시글 조회
	public void increaseViewcnt(int notice_no, HttpSession session) throws Exception;

	// 07. 게시글 갯수
	public int noticeListCnt(NoticeVO nvo);

}
