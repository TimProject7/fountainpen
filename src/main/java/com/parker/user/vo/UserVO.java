package com.parker.user.vo;

import java.sql.Date;

//회원 VO
public class UserVO {
	private int user_number; // 회원번호
	private String user_name; // 회원이름
	private String user_id; // 회원아이디
	private String user_password; // 회원비밀번호
	private String user_email; // 회원이메일
	private String zip_code; // 우편번호
	private String user_address; // 주소
	private String detail_address; // 상세주소
	private String user_birthday; // 생년월일
	private String user_cell; // 전화번호
	private String user_phone; // 핸드폰번호
	private String user_gender; // 성별
	private String user_privacyconsignment; // 이용약관1
	private String user_termsofuse; // 이용약관2
	private String user_receiveadvertising; // 이용약관3
	private String user_status; // 회원상태
	private Date user_regdate; // 가입날짜
	private String user_deleteCondition;// 탈퇴사유

	public String getUser_deleteCondition() {
		return user_deleteCondition;
	}

	public void setUser_deleteCondition(String user_deleteCondition) {
		this.user_deleteCondition = user_deleteCondition;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_cell() {
		return user_cell;
	}

	public void setUser_cell(String user_cell) {
		this.user_cell = user_cell;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_privacyconsignment() {
		return user_privacyconsignment;
	}

	public void setUser_privacyconsignment(String user_privacyconsignment) {
		this.user_privacyconsignment = user_privacyconsignment;
	}

	public String getUser_termsofuse() {
		return user_termsofuse;
	}

	public void setUser_termsofuse(String user_termsofuse) {
		this.user_termsofuse = user_termsofuse;
	}

	public String getUser_receiveadvertising() {
		return user_receiveadvertising;
	}

	public void setUser_receiveadvertising(String user_receiveadvertising) {
		this.user_receiveadvertising = user_receiveadvertising;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	@Override
	public String toString() {
		return "UserVO [user_number=" + user_number + ", user_name=" + user_name + ", user_id=" + user_id
				+ ", user_password=" + user_password + ", user_email=" + user_email + ", zip_code=" + zip_code
				+ ", user_address=" + user_address + ", detail_address=" + detail_address + ", user_birthday="
				+ user_birthday + ", user_cell=" + user_cell + ", user_phone=" + user_phone + ", user_gender="
				+ user_gender + ", user_privacyconsignment=" + user_privacyconsignment + ", user_termsofuse="
				+ user_termsofuse + ", user_receiveadvertising=" + user_receiveadvertising + ", user_status="
				+ user_status + ", user_regdate=" + user_regdate + ", user_deleteCondition=" + user_deleteCondition
				+ "]";
	}

}
