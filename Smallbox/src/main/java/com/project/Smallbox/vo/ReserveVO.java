package com.project.Smallbox.vo;

import java.sql.Date;
import java.sql.Time;

public class ReserveVO {
	/*
	 CREATE TABLE reserve (
		res_idx INT PRIMARY KEY,    
		res_num VARCHAR(20), 
		theater_idx INT,	
		theater_title VARCHAR(20),
		member_id VARCHAR(20),
		res_date DATE,
	   	res_time TIME,
	   	res_seat VARCHAR(10), 
	   	res_pay_type INT,
	   	res_price INT
	);
	 */
		int res_idx;
		String res_num;
		int theater_idx;
		String theater_title;
		String member_id;
		Date res_date;
		Time res_time;
		String res_seat;
		int res_pay_type;
		int res_price;
		
		public int getRes_idx() {
			return res_idx;
		}
		public void setRes_idx(int res_idx) {
			this.res_idx = res_idx;
		}
		public String getRes_num() {
			return res_num;
		}
		public void setRes_num(String res_num) {
			this.res_num = res_num;
		}
		public int getTheater_idx() {
			return theater_idx;
		}
		public void setTheater_idx(int theater_idx) {
			this.theater_idx = theater_idx;
		}
		public String getTheater_title() {
			return theater_title;
		}
		public void setTheater_title(String theater_title) {
			this.theater_title = theater_title;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public Date getRes_date() {
			return res_date;
		}
		public void setRes_date(Date res_date) {
			this.res_date = res_date;
		}
		public Time getRes_time() {
			return res_time;
		}
		public void setRes_time(Time res_time) {
			this.res_time = res_time;
		}
		public String getRes_seat() {
			return res_seat;
		}
		public void setRes_seat(String res_seat) {
			this.res_seat = res_seat;
		}
		public int getRes_pay_type() {
			return res_pay_type;
		}
		public void setRes_pay_type(int res_pay_type) {
			this.res_pay_type = res_pay_type;
		}
		public int getRes_price() {
			return res_price;
		}
		public void setRes_price(int res_price) {
			this.res_price = res_price;
		}
		@Override
		public String toString() {
			return "ReserveVO [res_idx=" + res_idx + ", res_num=" + res_num + ", theater_idx=" + theater_idx
					+ ", theater_title=" + theater_title + ", member_id=" + member_id + ", res_date=" + res_date
					+ ", res_time=" + res_time + ", res_seat=" + res_seat + ", res_pay_type=" + res_pay_type
					+ ", res_price=" + res_price + "]";
		}
		
		
}
