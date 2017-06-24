package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//구매내역
public class BuyListVO extends PagingVO {
	private int buy_number; // 구매번호
	private String product_image; // 구매상품이미지
	private String buy_product; // 구매상품명
	private int buy_price; // 구매상품가격
	private int buy_quantity; // 구매수량
	private Date buy_day; // 구매날짜
	private int product_total; // 상품합계
	private int user_number; // 회원번호

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

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_product() {
		return buy_product;
	}

	public void setBuy_product(String buy_product) {
		this.buy_product = buy_product;
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

	public int getProduct_total() {
		return product_total;
	}

	public void setProduct_total(int product_total) {
		this.product_total = product_total;
	}

	@Override
	public String toString() {
		return "BuyListVO [buy_number=" + buy_number + ", product_image=" + product_image + ", buy_product="
				+ buy_product + ", buy_price=" + buy_price + ", buy_quantity=" + buy_quantity + ", buy_day=" + buy_day
				+ ", product_total=" + product_total + ", user_number=" + user_number + ", search=" + search
				+ ", keyword=" + keyword + "]";
	}

}
