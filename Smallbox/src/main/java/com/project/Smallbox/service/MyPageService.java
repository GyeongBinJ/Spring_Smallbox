package com.project.Smallbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.MovieMapper;
import com.project.Smallbox.mapper.MyPageMapper;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.MypageVO;
import com.project.Smallbox.vo.PosterVO;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	// 마이페이지 - 찜 목록 조회
	public List<MovieVO> getMovieLikeList(String member_id) {
		return mapper.selectLikeList(member_id);
	}
	
	// 마이페이지 - 리뷰 삭제
	public int deleteReview(int comment_idx) {
		return mapper.deleteComment(comment_idx);
	}
	
	// 마이페이지 - 각 회원(member_id)의 쿠폰 내역 조회
	public List<CouponVO> getCouponList(String member_id, int startRow, int couponLimit) {
		return mapper.selectMemberCouponList(member_id, startRow, couponLimit);
	}

	// 마이페이지 - 각 회원이 가진 전체 쿠폰 수 조회
	public int getCouponListCount(String member_id) {
		return mapper.selectMemberCouponCount(member_id);
	}

	// 마이페이지 - 리뷰 목록 조회 
	public List<PosterVO> getReviewList(String member_id, int startRow, int commentLimit) {
		return mapper.selectReviewList(member_id, startRow, commentLimit);
	}

	// 마이페이지 - 각 회원의 총 리뷰 갯수 조회
	public int getCommentListCount(String member_id) {
		return mapper.selectCommentListCount(member_id);
	}

	// 마이페이지 - 각 회원 아이디(member_id)가 찜한 영화의 정보 가져오기
	public List<MovieVO> getMovieLikeList(String member_id, int startRow, int movieLimit) {
		return mapper.selectLikeList(member_id, startRow, movieLimit);
	}

	// 마이페이지 - 각 회원이 찜한 영화 수 조회
	public int getMovieListCount(String member_id) {
		return mapper.selectLikeMovieCount(member_id);
	}

	// 마이페이지 - 메인 정보 조회
	public MypageVO getMypageInfo(String member_id) {
		return mapper.selectMypageInfo(member_id);
	}


}
