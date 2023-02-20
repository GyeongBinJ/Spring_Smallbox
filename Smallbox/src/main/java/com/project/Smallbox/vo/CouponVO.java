package com.project.Smallbox.vo;

import java.sql.Date;

public class CouponVO {
	
	private String member_id;
	private int coupon_idx;
	private String coupon_type;
	private int coupon_rate;
	private Date coupon_date;
	private Date coupon_end_date;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public int getCoupon_rate() {
		return coupon_rate;
	}
	public void setCoupon_rate(int coupon_rate) {
		this.coupon_rate = coupon_rate;
	}
	public Date getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}
	public Date getCoupon_end_date() {
		return coupon_end_date;
	}
	public void setCoupon_end_date(Date coupon_end_date) {
		this.coupon_end_date = coupon_end_date;
	}
	
	@Override
	public String toString() {
		return "CouponBean [member_id=" + member_id + ", coupon_idx=" + coupon_idx + ", coupon_type=" + coupon_type
				+ ", coupon_rate=" + coupon_rate + ", coupon_date=" + coupon_date + ", coupon_end_date="
				+ coupon_end_date + "]";
	}

}
