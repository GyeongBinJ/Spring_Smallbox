package com.project.Smallbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.ReserveMapper;
import com.project.Smallbox.vo.MovieVO;
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
	
}
