package com.project.Smallbox.vo;

public class MovieLikeVO {
	
	private int movie_idx;
	private String member_id;
	
	public int getMovie_idx() {
		return movie_idx;
	}
	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "MovieLikeBean [movie_idx=" + movie_idx + ", member_id=" + member_id + "]";
	}
	
}
