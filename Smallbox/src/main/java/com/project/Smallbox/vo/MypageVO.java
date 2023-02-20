package com.project.Smallbox.vo;

public class MypageVO {
	private String member_id;
	private String member_email;
	private int cp_count;
	private int cm_count;
	private int ml_count;
	
	public MypageVO() {
		super();
	}

	public MypageVO(String member_id, String member_email, int cp_count, int cm_count, int ml_count) {
		super();
		this.member_id = member_id;
		this.member_email = member_email;
		this.cp_count = cp_count;
		this.cm_count = cm_count;
		this.ml_count = ml_count;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getCp_count() {
		return cp_count;
	}

	public void setCp_count(int cp_count) {
		this.cp_count = cp_count;
	}

	public int getCm_count() {
		return cm_count;
	}

	public void setCm_count(int cm_count) {
		this.cm_count = cm_count;
	}

	public int getMl_count() {
		return ml_count;
	}

	public void setMl_count(int ml_count) {
		this.ml_count = ml_count;
	}

	@Override
	public String toString() {
		return "MypageVO [member_id=" + member_id + ", member_email=" + member_email + ", cp_count=" + cp_count
				+ ", cm_count=" + cm_count + ", ml_count=" + ml_count + "]";
	}

}
