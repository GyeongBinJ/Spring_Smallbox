package com.project.Smallbox.vo;

import java.sql.Date;

public class MemberVO {

	// 회원가입, 로그인 등 필요한 개인정보 변수 선언
	private int member_idx;
	private String member_name;
	private String member_id;
	private String member_passwd;
	private String member_email;
	private String member_phone;
	private Date member_join_date;
	private Date member_birth_date;
	private String member_authStatus;
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_passwd() {
		return member_passwd;
	}
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
	public Date getMember_birth_date() {
		return member_birth_date;
	}
	public void setMember_birth_date(Date member_birth_date) {
		this.member_birth_date = member_birth_date;
	}
	public String getMember_authStatus() {
		return member_authStatus;
	}
	
	public void setMember_authStatus(String member_authStatus) {
		this.member_authStatus = member_authStatus;
	}
	@Override
	public String toString() {
		return "MemberBean [member_idx=" + member_idx + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", member_passwd=" + member_passwd + ", member_email=" + member_email + ", member_phone="
				+ member_phone + ", member_join_date=" + member_join_date + ", member_birth_date=" + member_birth_date
				+ ", member_authStatus=" + member_authStatus + "]";
	}
}
