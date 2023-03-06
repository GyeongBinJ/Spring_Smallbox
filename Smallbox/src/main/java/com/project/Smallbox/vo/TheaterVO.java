package com.project.Smallbox.vo;

import java.sql.Date;
import java.sql.Time;

public class TheaterVO {
	private int theater_idx;
	private String theater_title;
	private Date theater_date;
	private Time theater_time;
	private int theater_seat_cnt;
	
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
	public Date getTheater_date() {
		return theater_date;
	}
	public void setTheater_date(Date theater_date) {
		this.theater_date = theater_date;
	}
	public Time getTheater_time() {
		return theater_time;
	}
	public void setTheater_time(Time theater_time) {
		this.theater_time = theater_time;
	}
	public int getTheater_seat_cnt() {
		return theater_seat_cnt;
	}
	public void setTheater_seat_cnt(int theater_seat_cnt) {
		this.theater_seat_cnt = theater_seat_cnt;
	}
	@Override
	public String toString() {
		return "TheaterBean [theater_idx=" + theater_idx + ", theater_title=" + theater_title + ", theater_date="
				+ theater_date + ", theater_time=" + theater_time + ", theater_seat_cnt=" + theater_seat_cnt + "]";
	}
}
