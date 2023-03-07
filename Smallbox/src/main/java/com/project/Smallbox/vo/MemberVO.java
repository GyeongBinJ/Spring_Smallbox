package com.project.Smallbox.vo;

import java.sql.Date;

public class MemberVO {

	// 회원가입, 로그인 등 필요한 개인정보 변수 선언
	private int member_idx;
	private String member_name;
	private String member_id;
	private String member_passwd;
	private String member_email;
	private String member_email1;
	private String member_email2;
	private String member_phone;
	private Date member_join_date;
	private Date member_birth_date;
	
	
	public MemberVO() {
		super();
	}

	public MemberVO(int member_idx, String member_name, String member_id, String member_passwd, String member_email,
			String member_email1, String member_email2, String member_phone, Date member_join_date,
			Date member_birth_date) {
		super();
		this.member_idx = member_idx;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_passwd = member_passwd;
		this.member_email = member_email;
		this.member_email1 = member_email1;
		this.member_email2 = member_email2;
		this.member_phone = member_phone;
		this.member_join_date = member_join_date;
		this.member_birth_date = member_birth_date;
	}
	
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
		
		// 전체 이메일을 결합된 상태로 email 멤버변수에 저장 시
		// "@" 기호 기준 문자열 분리를 통해 email1, email2 에 각각 저장 작업 추가
		member_email1 = member_email.split("@")[0];
		member_email2 = member_email.split("@")[1];
	}

	public String getMember_email1() {
		return member_email1;
	}

	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}

	public String getMember_email2() {
		return member_email2;
	}

	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
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

	@Override
	public String toString() {
		return "MemberVO [member_idx=" + member_idx + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", member_passwd=" + member_passwd + ", member_email=" + member_email + ", member_email1="
				+ member_email1 + ", member_email2=" + member_email2 + ", member_phone=" + member_phone
				+ ", member_join_date=" + member_join_date + ", member_birth_date=" + member_birth_date + "]";
	}

	
	
	
}
