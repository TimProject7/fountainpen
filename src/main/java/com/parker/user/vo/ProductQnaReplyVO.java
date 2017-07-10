package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//상품qna 리플 게시판
public class ProductQnaReplyVO extends PagingVO {
	private int productQnaReply_number; // 상품qna번호 프라이머리키
	private String productQnaReply_content;// --상품qna내용
	private Date productQnaReply_writedate;// --상품등록날짜
	private String user_id; // 회원아이디
	private int user_number;// --회원번호
	private int productId; // 상품번호
	private int admin_number;// --관리자번호 외래키

	public int getProductQnaReply_number() {
		return productQnaReply_number;
	}

	public void setProductQnaReply_number(int productQnaReply_number) {
		this.productQnaReply_number = productQnaReply_number;
	}

	public String getProductQnaReply_content() {
		return productQnaReply_content;
	}

	public void setProductQnaReply_content(String productQnaReply_content) {
		this.productQnaReply_content = productQnaReply_content;
	}

	public Date getProductQnaReply_writedate() {
		return productQnaReply_writedate;
	}

	public void setProductQnaReply_writedate(Date productQnaReply_writedate) {
		this.productQnaReply_writedate = productQnaReply_writedate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	@Override
	public String toString() {
		return "ProductQnaReplyVO [productQnaReply_number=" + productQnaReply_number + ", productQnaReply_content="
				+ productQnaReply_content + ", productQnaReply_writedate=" + productQnaReply_writedate + ", user_id="
				+ user_id + ", user_number=" + user_number + ", productId=" + productId + ", admin_number="
				+ admin_number + "]";
	}

}