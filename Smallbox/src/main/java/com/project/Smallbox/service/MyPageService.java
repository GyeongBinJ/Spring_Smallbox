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
import com.project.Smallbox.vo.QnaVO;
import com.project.Smallbox.vo.ReserveVO;

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


	// 마이페이지 - 예매 내역 조회
	public List<ReserveVO> getReserveList(String member_id, int startRow, int reserveLimit) {
		return mapper.selectReserveList(member_id, startRow, reserveLimit);
	}
	
	// 마이페이지 - 회원아이디로 예매 내역 개수 조회
	public int getReserveListCount(String member_id) {
		return mapper.selectReserveListCount(member_id);
	}
	
	// 마이페이지 - 예매 취소
	public int reserveCancel(int res_idx) {
		return mapper.deleteReserve(res_idx);
	}

	// 마이페이지 - 예매취소 가능시간 판별 작업
	public int isTimeOk(int res_idx) {
		return mapper.selectTimeOk(res_idx);
	}
	
	// 마이페이지 - 1:1문의 작성 작업
	public int registQna(QnaVO qna) {
		return mapper.insertQna(qna);
	}
	
	// 마이페이지 - 1:1문의 내역
	public List<QnaVO> getQnaList(String member_id, int startRow, int qnaLimit) {
		return mapper.selectQnaList(member_id, startRow, qnaLimit);
	}

	// 마이페이지 - 회원아이디로 문의 내역 개수 조회
	public int getQnaListCount(String member_id) {
		return mapper.selectQnaListCount(member_id);
	}
	
	// 마이페이지 - 1:1문의 상세보기
	public QnaVO getQnaDetail(int qna_idx) {
		return mapper.selectQna(qna_idx);
	}

	// 마이페이지 - 1:1문의 관리자 답변 작업 전, 원본글의 qna_re_ref, qna_re_seq 조정하는 작업
	public int updateOriginal(int qna_re_ref, int qna_re_seq) {
		return mapper.updateOriginal(qna_re_ref, qna_re_seq);
	}

	// 마이페이지 - 1:1문의 관리자 답변 작업
	public int replyQna(QnaVO qna) {
		return mapper.insertReply(qna);
	}
	
	// 마이페이지 - 1:1문의 삭제 작업
	public int deleteQna(int qna_idx) {
		return mapper.deleteQna(qna_idx);
	}

	// 마이페이지 - 영화상세메뉴의 리뷰창으로의 이동을 위해 예약번호로 영화번호 찾는 작업
	public int findMovie_idx(int res_idx) {
		return mapper.selectMovie_idx(res_idx);
	}




}
