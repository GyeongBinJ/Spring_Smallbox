package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.ReserveVO;
import com.project.Smallbox.vo.TheaterVO;

public interface ReserveMapper {
	
// 예매 페이지 조회를 위한 영화 전체 목록 조회(페이징 X)
	List<MovieVO> selectMovieList();

	List<TheaterVO> selectTheaterList(@Param("movie_title") String movie_title, 
									  @Param("reserve_date") String reserve_date);

	
	//=============================================혜연 추가한곳=============================================
		int selectTheaterIdx(TheaterVO theater);

		List<String> selectReservedSeatList(ReserveVO reserve);

		List<CouponVO> selectCouponList(String sId);

		boolean insertReserve(ReserveVO reserve);

		boolean updateSeatCnt(@Param("theater_idx") String theater_idx, @Param("people") int people);

		boolean deleteCoupon(int couponIdx);
		
	//============================================혜연 추가한곳 끝============================================	
}
