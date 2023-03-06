package com.project.Smallbox.mapper;

import com.project.Smallbox.vo.MovieVO;

public interface MovieDetailMapper {

	//파라미터 2개 이상이면 @Param("abcd") String abcd 꼭 추가하기!
	MovieVO selectMovieDetail(int movieIdx);
	

}
