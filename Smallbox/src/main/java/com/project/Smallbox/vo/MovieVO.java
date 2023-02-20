package com.project.Smallbox.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {

	private int movie_idx;
	private String movie_title;
	private String movie_grade;
	private String movie_genre;
	private Date movie_open_date;
	private int movie_runtime;
	private String movie_intro; 
	private String movie_actors;
	private String movie_picture;
	private String movie_real_picture;
	private String movie_teaser;
	private int movie_viewer;
	
	// MultipartFile 타입 객체를 통한 파일 처리를 위해 MultipartFile 타입 변수 선언
	private MultipartFile file;
	
	public int getMovie_idx() {
		return movie_idx;
	}
	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public Date getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Date movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	public int getMovie_runtime() {
		return movie_runtime;
	}
	public void setMovie_runtime(int movie_runtime) {
		this.movie_runtime = movie_runtime;
	}
	public String getMovie_intro() {
		return movie_intro;
	}
	public void setMovie_intro(String movie_intro) {
		this.movie_intro = movie_intro;
	}
	public String getMovie_actors() {
		return movie_actors;
	}
	public void setMovie_actors(String movie_actors) {
		this.movie_actors = movie_actors;
	}
	public String getMovie_picture() {
		return movie_picture;
	}
	public void setMovie_picture(String movie_picture) {
		this.movie_picture = movie_picture;
	}
	public String getMovie_real_picture() {
		return movie_real_picture;
	}
	public void setMovie_real_picture(String movie_real_picture) {
		this.movie_real_picture = movie_real_picture;
	}
	public String getMovie_teaser() {
		return movie_teaser;
	}
	public void setMovie_teaser(String movie_teaser) {
		this.movie_teaser = movie_teaser;
	}
	public int getMovie_viewer() {
		return movie_viewer;
	}
	public void setMovie_viewer(int movie_viewer) {
		this.movie_viewer = movie_viewer;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "MovieVO [movie_idx=" + movie_idx + ", movie_title=" + movie_title + ", movie_grade=" + movie_grade
				+ ", movie_genre=" + movie_genre + ", movie_open_date=" + movie_open_date + ", movie_runtime="
				+ movie_runtime + ", movie_intro=" + movie_intro + ", movie_actors=" + movie_actors + ", movie_picture="
				+ movie_picture + ", movie_real_picture=" + movie_real_picture + ", movie_teaser=" + movie_teaser
				+ ", movie_viewer=" + movie_viewer + ", file=" + file + "]";
	}

	
}
