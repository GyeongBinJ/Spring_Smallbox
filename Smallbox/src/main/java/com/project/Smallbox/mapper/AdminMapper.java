package com.project.Smallbox.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MemberVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.QnaVO;
import com.project.Smallbox.vo.StarMovieVO;
import com.project.Smallbox.vo.TheaterVO;

public interface AdminMapper {

	// 관리자 페이지 - 영화 목록 조회
	public List<StarMovieVO> selectStarMovieList(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 관리자 페이지 - 영화 상세정보 조회
	public MovieVO selectMovie(int movie_idx);

	// 관리자 페이지 - 영화 삭제
	public int removeMovie(int movie_idx);

	// 관리자 페이지 - 영화 삭제 전 등록된 파일명 조회
	public String selectPoster(int movie_idx);
	
	// 관리자 페이지 - 영화 갯수 조회
	public int selectBoardListCount(String keyword);

	// 관리자 페이지 - 게시물 등록 작업 요청
	public int insertAdminMovie(MovieVO movie);

	// 관리자 페이지 - 영화 수정
	public int updateMovie(MovieVO movie);

	// 관리자 페이지 - 글 수정 파일 삭제
	public int deletePoster(
			@Param("movie_idx") int movie_idx, 
			@Param("movie_pictue") String movie_pictue);

	public List<MemberVO> selectMemberList(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	public int selectMemberListCount(String keyword);

	public List<CouponVO> selectCouponListTotal(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	public int selectCouponListCount(String keyword);

	public int updateCoupon(CouponVO coupon);

	public List<CouponVO> selectCouponList(
			@Param("member_id") String member_id);

	public int insertCoupon(CouponVO coupon);

	public int deleteCoupon(
			@Param("member_id") String member_id, 
			@Param("coupon_end_date") Date coupon_end_date);

	// 관리자 페이지 - 상영일정 목록 조회
	public List<TheaterVO> selectTheaterList(@Param("keyword") String keyword, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 관리자 페이지 - 등록된 상영일정 갯수 조회
	public int selectTheaterListCount(String keyword);

	// 관리자 페이지 - 상영일정 등록
	public int insertAdminTheater(TheaterVO theater);

	// 관리자 페이지 - 상영일정 등록을 위한 영화 목록 조회
	public List<MovieVO> selectMovie2();

	// 관리자 페이지 - 상영일정 상세정보 조회
	public TheaterVO selectTheater(int theater_idx);

	// 관리자 페이지 - 상영일정 수정 비지니스 로직
	public int updateTheater(TheaterVO theater);

	// 관리자 페이지 - 상영일정 삭제 비지니스 로직
	public int deleteTheater(int theater_idx);

	// 관리자페이지 - (관리자용) 1:1문의 내역
	public List<QnaVO> selectAdminQnaList(
			@Param("startRow") int startRow, 
			@Param("qnaLimit") int qnaLimit);

	// 관리자 페이지 - (관리자용) 1:1문의내역 개수 조회
	public int selectAdminQnaListCount();

	// 관리자 페이지 - (관리자용) 1:1문의 상세 조회
	public QnaVO selectAdminQna(int qna_idx);


}
