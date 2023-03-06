package com.project.Smallbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.MovieDetailMapper;
import com.project.Smallbox.vo.MovieVO;

@Service
public class MovieDetailService {
	
	@Autowired
	private MovieDetailMapper mapper;

	public MovieVO getMovieDetail(int movieIdx) {
		return mapper.selectMovieDetail(movieIdx);
	}
	
	

}
