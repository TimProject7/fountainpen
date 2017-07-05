package com.parker.user.vo;

import java.util.Date;

import com.parker.user.boardcommon.PagingVO;

public class NoticeVO extends PagingVO {
	private int notice_no; // 게시글 번호
	private String notice_title; // 게시글 제목
	private String notice_content; // 게시글 내용
	private String notice_writer; // 게시글 작성자
	private Date notice_regdate; // 게시글 작성일자 util.Date
	private int notice_viewcnt; // 게시글 조회수
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

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getNotice_viewcnt() {
		return notice_viewcnt;
	}

	public void setNotice_viewcnt(int notice_viewcnt) {
		this.notice_viewcnt = notice_viewcnt;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_writer=" + notice_writer + ", notice_regdate=" + notice_regdate
				+ ", notice_viewcnt=" + notice_viewcnt + ", admin_number=" + admin_number + ", search=" + search
				+ ", keyword=" + keyword + "]";
	}

}
