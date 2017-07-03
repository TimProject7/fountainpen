package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//상품qna 리플 게시판
public class ProductQnaReplyVO extends PagingVO {
	private int productqna_number; // 상품qna번호 프라이머리키
	private String productqna_content;// --상품qna내용
	private Date productqna_writedate;// --상품등록날짜
	private String user_id; // 회원아이디
	private int user_number;// --회원번호
	private int productId; // 상품번호
	private int admin_number;// --관리자번호 외래키

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProductqna_number() {
		return productqna_number;
	}

	public void setProductqna_number(int productqna_number) {
		this.productqna_number = productqna_number;
	}

	public String getProductqna_content() {
		return productqna_content;
	}

	public void setProductqna_content(String productqna_content) {
		this.productqna_content = productqna_content;
	}

	public Date getProductqna_writedate() {
		return productqna_writedate;
	}

	public void setProductqna_writedate(Date productqna_writedate) {
		this.productqna_writedate = productqna_writedate;
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
		return "ProductQnaReplyVO [productqna_number=" + productqna_number + ", productqna_content="
				+ productqna_content + ", productqna_writedate=" + productqna_writedate + ", user_id=" + user_id
				+ ", user_number=" + user_number + ", productId=" + productId + ", admin_number=" + admin_number + "]";
	}

}
