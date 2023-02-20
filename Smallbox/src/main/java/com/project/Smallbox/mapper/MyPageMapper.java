package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.MypageVO;
import com.project.Smallbox.vo.PosterVO;

public interface MyPageMapper {

	// 마이페이지 - 찜 목록 조회
	public List<MovieVO> selectLikeList(String member_id);
	
	// 마이페이지 - 리뷰 목록 조회 
	public List<PosterVO> selectReviewList(String member_id);

	// 마이페이지 - 리뷰 삭제
	public int deleteComment(int comment_idx);

	// 마이페이지 - 각 회원(member_id)의 쿠폰 내역 조회
	public List<CouponVO> selectMemberCouponList(
			@Param("member_id") String member_id, 
			@Param("startRow") int startRow, 
			@Param("couponLimit") int couponLimit);

	// 마이페이지 - 각 회원이 가진 전체 쿠폰 수 조회
	public int selectMemberCouponCount(String member_id);

	// 마이페이지 - 리뷰 목록 조회 
	public List<PosterVO> selectReviewList(
			@Param("member_id") String member_id,
			@Param("startRow") int startRow, 
			@Param("commentLimit") int commentLimit);

	// 마이페이지 - 각 회원의 총 리뷰 갯수 조회
	public int selectCommentListCount(String member_id);

	// 각 회원 아이디(member_id)가 찜한 영화의 정보 가져오기
	public List<MovieVO> selectLikeList(
			@Param("member_id") String member_id, 
			@Param("startRow") int startRow, 
			@Param("movieLimit") int movieLimit);
	
	// 마이페이지 - 각 회원이 찜한 영화 수 조회 (DB 작업 필요)
	public int selectLikeMovieCount(String member_id);

	// 마이페이지 - 메인 정보 조회
	public MypageVO selectMypageInfo(String member_id);

}
