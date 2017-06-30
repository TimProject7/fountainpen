package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//구매내역
public class BuyListVO extends PagingVO {
	private int buy_number; // 구매번호
	private String buy_image; // 구매상품이미지
	private String buy_product; // 구매상품명
	private int buy_price; // 구매상품가격
	private int buy_quantity; // 구매수량
	private Date buy_day; // 구매날짜
	private int user_number; // 회원번호
	private int product_number; // 상품번호
	private String user_id;

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	public int getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
	}

	public String getBuy_image() {
		return buy_image;
	}

	public void setBuy_image(String buy_image) {
		this.buy_image = buy_image;
	}

	public String getBuy_product() {
		return buy_product;
	}

	public void setBuy_product(String buy_product) {
		this.buy_product = buy_product;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public Date getBuy_day() {
		return buy_day;
	}

	public void setBuy_day(Date buy_day) {
		this.buy_day = buy_day;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

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

	@Override
	public String toString() {
		return "BuyListVO [buy_number=" + buy_number + ", buy_image=" + buy_image + ", buy_product=" + buy_product
				+ ", buy_price=" + buy_price + ", buy_quantity=" + buy_quantity + ", buy_day=" + buy_day
				+ ", user_number=" + user_number + ", product_number=" + product_number + ", user_id=" + user_id
				+ ", search=" + search + ", keyword=" + keyword + "]";
	}

}
