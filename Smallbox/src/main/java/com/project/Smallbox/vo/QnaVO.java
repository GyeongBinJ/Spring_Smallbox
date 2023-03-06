package com.project.Smallbox.vo;

import java.sql.Timestamp;

public class QnaVO {
	private int qna_idx;
	private String qna_subject;
	private String qna_content;
	private Timestamp qna_date;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private String member_id;
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public int getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public int getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "QnaBean [qna_idx=" + qna_idx + ", qna_subject=" + qna_subject + ", qna_content=" + qna_content
				+ ", qna_date=" + qna_date + ", qna_re_ref=" + qna_re_ref + ", qna_re_lev=" + qna_re_lev
				+ ", qna_re_seq=" + qna_re_seq + ", member_id=" + member_id + "]";
	}

}
