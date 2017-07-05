package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.parker.user.vo.FAQVO;

public interface FAQService {


    // 02. 게시글 상세보기
    public FAQVO read(int faq_no) throws Exception;
   
    // 05. 게시글 전체 목록
    public List<FAQVO> listAll( FAQVO fvo) throws Exception;
    // 06. 게시글 조회
    public void increaseViewcnt(int faq_no, HttpSession session) throws Exception;
    // 07. 게시물 갯수
	public int listCnt(FAQVO fvo);
	
}
