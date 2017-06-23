 package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//구매내역
public class BuyListVO extends PagingVO {
	private int buy_number; // 구매번호
	private String product_image; // 구매상품이미지
	private String product_name; // 구매상품명
	private int product_price; // 구매상품가격
	private int buy_quantity; // 구매수량
	private Date buy_day; // 구매날짜
	private int product_total; // 상품합계
	private int user_number; // 회원번호

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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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
		return "BuyListVO [buy_number=" + buy_number + ", product_image=" + product_image + ", product_name="
				+ product_name + ", product_price=" + product_price + ", buy_quantity=" + buy_quantity + ", buy_day="
				+ buy_day + ", product_total=" + product_total + ", user_number=" + user_number + "]";
	}


}
