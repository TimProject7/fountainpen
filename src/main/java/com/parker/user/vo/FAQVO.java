package com.parker.user.vo;

import java.util.Date;

import com.parker.user.boardcommon.PagingVO;

public class FAQVO extends PagingVO {

	private int faq_no; // 게시글 번호
	private String faq_title; // 게시글 제목
	private String faq_content; // 게시글 내용
	private String faq_writer; // 게시글 작성자
	private Date faq_regdate; // 게시글 작성일자 util.Date
	private int faq_viewcnt; // 게시글 조회수
	private int admin_number; 

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_writer() {
		return faq_writer;
	}

	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}

	public Date getFaq_regdate() {
		return faq_regdate;
	}

	public void setFaq_regdate(Date faq_regdate) {
		this.faq_regdate = faq_regdate;
	}

	public int getFaq_viewcnt() {
		return faq_viewcnt;
	}

	public void setFaq_viewcnt(int faq_viewcnt) {
		this.faq_viewcnt = faq_viewcnt;
	}

	@Override
	public String toString() {
		return "FAQVO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_content=" + faq_content + ", faq_writer="
				+ faq_writer + ", faq_regdate=" + faq_regdate + ", faq_viewcnt=" + faq_viewcnt + "]";
	}

}
