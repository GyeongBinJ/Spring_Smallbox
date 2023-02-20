package com.project.Smallbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.MovieMapper;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.PageInfo;
import com.project.Smallbox.vo.StarMovieVO;

@Service
public class MovieService {
	
	@Autowired
	private MovieMapper mapper;
	
	// 영화 전체 목록 조회 (박스오피스)
	public List<StarMovieVO> getStarMovieList(String keyword, int startRow, int listLimit) {
		return mapper.selectStarMovieList(keyword, startRow, listLimit);
	}

	// 박스오피스 영화 총 개수
	public int getStarMovieListCount(String keyword) {
		return mapper.StarMovieListCount(keyword);
	}
	
	// 영화 목록 페이지 접속시 각 회원별 찜 목록 가져오기 (Integer)
	public List<Integer> getLikeList(String member_id) {
		return mapper.selectLikeList2(member_id);
	}

	// 개봉 예정작 조회
	public List<MovieVO> getComingMovieList(String keyword, int startRow, int listLimit) {
		return mapper.selectComingMovieList(keyword, startRow, listLimit);
	}
	
	// 개봉 예정작 총 개수
	public int getComingMovieListCount(String keyword) {
		return mapper.ComingMovieListCount(keyword);
	}

	// 찜이 되어있는지 판별
	public int selectLike(int movie_idx, String member_id) {
		return mapper.selectLike(movie_idx, member_id);
	}

	// 찜 해제 작업 수행
	public int CancelMovieLike(int movie_idx, String member_id) {
		return mapper.deleteMovieLike(movie_idx, member_id);
	}

	// 찜 작업 수행
	public int MovieLike(int movie_idx, String member_id) {
		return mapper.insertMovieLike(movie_idx, member_id);
	}



}
