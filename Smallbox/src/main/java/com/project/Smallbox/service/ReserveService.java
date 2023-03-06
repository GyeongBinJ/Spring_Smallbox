package com.project.Smallbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.ReserveMapper;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.ReserveVO;
import com.project.Smallbox.vo.TheaterVO;

@Service
public class ReserveService {
	@Autowired
	private ReserveMapper mapper;

	// 영화 전체 목록
	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList();
	}

	// 영화 제목과 날짜 선택시 출력할 상영시간 목록
	public List<TheaterVO> getTheaterList(String movie_title, String reserve_date) {
		return mapper.selectTheaterList(movie_title, reserve_date);
	}
	
	//=============================================혜연 추가한곳=============================================
		public int getTheaterIdx(TheaterVO theater) {
			return mapper.selectTheaterIdx(theater);
		}

		public List<String> getReservedSeatList(ReserveVO reserve) {
			return mapper.selectReservedSeatList(reserve);
		}

		public List<CouponVO> getCouponList(String sId) {
			return mapper.selectCouponList(sId);
		}

		public boolean reserveAndPayment(ReserveVO reserve) {
			return mapper.insertReserve(reserve);
		}

		public boolean substractSeat(String theater_idx, int people) {
			return mapper.updateSeatCnt(theater_idx, people);
		}

		public boolean deleteCoupon(int couponIdx) {
			return mapper.deleteCoupon(couponIdx);
		}
		
	//============================================혜연 추가한곳 끝============================================	
	
}
