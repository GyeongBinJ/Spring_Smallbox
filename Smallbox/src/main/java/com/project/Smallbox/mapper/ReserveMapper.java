package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.TheaterVO;

public interface ReserveMapper {
	
// 예매 페이지 조회를 위한 영화 전체 목록 조회(페이징 X)
	List<MovieVO> selectMovieList();

	List<TheaterVO> selectTheaterList(@Param("movie_title") String movie_title, 
									  @Param("reserve_date") String reserve_date);

}
