package com.project.Smallbox.service;

import java.sql.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.AdminMapper;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MemberVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.QnaVO;
import com.project.Smallbox.vo.StarMovieVO;
import com.project.Smallbox.vo.TheaterVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 관리자 페이지 - 영화 목록 조회
	public List<StarMovieVO> getStarMovieList(String keyword, int startRow, int listLimit) {
		return mapper.selectStarMovieList(keyword, startRow, listLimit);
	}

	// 관리자 페이지 - 영화 상세정보 조회
	public MovieVO getAdminMovieDetail(int movie_idx) {
		return mapper.selectMovie(movie_idx);
	}

	// 관리자 페이지 - 영화 삭제
	public int deleteMovie(int movie_idx) {
		return mapper.removeMovie(movie_idx);
	}

	// 관리자 페이지 - 영화 삭제 전 등록된 파일명 조회
	public String getPoster(int movie_idx) {
		return mapper.selectPoster(movie_idx);
	}
	
	// 관리자 페이지 - 영화 갯수 조회
	public int getMovieListCount(String keyword) {
		return mapper.selectBoardListCount(keyword);
	}

	// 관리자 페이지 - 게시물 등록 작업 요청
	public int registMovie(MovieVO movie) {
		return mapper.insertAdminMovie(movie);
	}

	// 관리자 페이지 - 영화 수정
	public int modifyMovie(MovieVO movie) {
		return mapper.updateMovie(movie);
	}

	// 관리자 페이지 - 글 수정 파일 삭제
	public int removePoster(int movie_idx, String movie_pictue) {
		return mapper.deletePoster(movie_idx, movie_pictue);
	}

	public List<MemberVO> getMemberList(String keyword, int startRow, int listLimit) {
		return mapper.selectMemberList(keyword, startRow, listLimit);
	}

	public int getMemberListCount(String keyword) {
		return mapper.selectMemberListCount(keyword);
	}

	public List<CouponVO> getTotalCouponList(String keyword, int startRow, int listLimit) {
		return mapper.selectCouponListTotal(keyword, startRow, listLimit);
	}

	public int getCouponListCount(String keyword) {
		return mapper.selectCouponListCount(keyword);
	}

	public int modifyCoupon(CouponVO coupon) {
		return mapper.updateCoupon(coupon);
	}

	public List<CouponVO> getCouponList(String member_id) {
		return mapper.selectCouponList(member_id);
	}

	public int registCoupon(CouponVO coupon) {
		return mapper.insertCoupon(coupon);
	}

	public int removeCoupon(String member_id, Date coupon_end_date) {
		return mapper.deleteCoupon(member_id, coupon_end_date);
	}

	// 관리자 페이지 - 상영일정 목록 조회
	public List<TheaterVO> getTheaterList(String keyword, int startRow, int listLimit) {
		return mapper.selectTheaterList(keyword, startRow, listLimit);
	}

	// 관리자 페이지 - 등록된 상영일정 갯수 조회
	public int getTheaterListCount(String keyword) {
		return mapper.selectTheaterListCount(keyword);
	}

	// 관리자 페이지 - 상영일정 등록
	public int insertTheater(TheaterVO theater) {
		return mapper.insertAdminTheater(theater);
	}

	// 관리자 페이지 - 상영일정 등록을 위한 영화 목록 조회
	public List<MovieVO> getMovieList() {
		return mapper.selectMovie2();
	}

	// 관리자 페이지 - 상영일정 상세정보 조회
	public TheaterVO getTheaterDetail(int theater_idx) {
		return mapper.selectTheater(theater_idx);
	}

	// 관리자 페이지 - 상영일정 수정 비지니스 로직
	public int modifyTheater(TheaterVO theater) {
		return mapper.updateTheater(theater);
	}

	// 관리자 페이지 - 상영일정 삭제 비지니스 로직
	public int deleteTheater(int theater_idx) {
		return mapper.deleteTheater(theater_idx);
	}

	// 관리자페이지 - (관리자용) 1:1문의 내역
	public List<QnaVO> getAdminQnaList(int startRow, int qnaLimit) {
		return mapper.selectAdminQnaList(startRow, qnaLimit);
	}

	// 관리자 페이지 - (관리자용) 1:1문의내역 개수 조회
	public int getAdminQnaListCount() {
		return mapper.selectAdminQnaListCount();
	}

	// 관리자 페이지 - (관리자용) 1:1문의 상세 조회
	public QnaVO getAdminQnaDetail(int qna_idx) {
		return mapper.selectAdminQna(qna_idx);
	}

}

