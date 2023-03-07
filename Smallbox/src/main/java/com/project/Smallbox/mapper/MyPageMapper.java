package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.MypageVO;
import com.project.Smallbox.vo.PosterVO;
import com.project.Smallbox.vo.QnaVO;
import com.project.Smallbox.vo.ReserveVO;

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

	// 마이페이지 - 예매 내역 조회
		public List<ReserveVO> selectReserveList(
				@Param("member_id") String member_id,
				@Param("startRow") int startRow, 
				@Param("reserveLimit") int reserveLimit);
		
	// 마이페이지 - 회원아이디로 예매 내역 개수 조회
	public int selectReserveListCount(String member_id);

	// 마이페이지 - 예매 내역 삭제
	public int deleteReserve(int res_idx);

	// 마이페이지 - 1:1문의 작성 작업
	public int insertQna(QnaVO qna);

	// 마이페이지 - 1:1문의 내역
	public List<QnaVO> selectQnaList(
			@Param("member_id") String member_id,
			@Param("startRow") int startRow, 
			@Param("qnaLimit") int qnaLimit);

	// 마이페이지 - 회원아이디로 문의 내역 개수 조회
	public int selectQnaListCount(String member_id);

	// 마이페이지 - 1:1문의 상세보기
	public QnaVO selectQna(int qna_idx);

	// 마이페이지 1:1문의 관리자 답변 작업 전, 원본글의 qna_re_ref, qna_re_seq 조정하는 작업
	public int updateOriginal(
			@Param("qna_re_ref") int qna_re_ref,
			@Param("qna_re_seq") int qna_re_seq);

	// 마이페이지 - 1:1문의 관리자 답변 작업
	public int insertReply(QnaVO qna);

	// 마이페이지 - 1:1문의 삭제 작업
	public int deleteQna(int qna_idx);

	// 마이페이지 - 영화상세메뉴의 리뷰창으로의 이동을 위해 예약번호로 영화번호 찾는 작업
	public int selectMovie_idx(int res_idx);

	// 마이페이지 - 예매취소 가능시간 판별 작업
	public int selectTimeOk(int res_idx);



}
