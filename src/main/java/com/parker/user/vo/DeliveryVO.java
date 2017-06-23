package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

public class DeliveryVO extends PagingVO{
	private Date buy_day; // 구매날짜
	private int buy_number; // 구매번호
	private String buy_product; // 구매상품명
	private int buy_price; // 구매금액
	private String buy_status; // 배송상태

	public Date getBuy_day() {
		return buy_day;
	}

	public void setBuy_day(Date buy_day) {
		this.buy_day = buy_day;
	}

	public int getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
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

	public String getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}

	@Override
	public String toString() {
		return "deliveryVO [buy_day=" + buy_day + ", buy_number=" + buy_number + ", buy_product=" + buy_product
				+ ", buy_price=" + buy_price + ", buy_status=" + buy_status + "]";
	}

}
