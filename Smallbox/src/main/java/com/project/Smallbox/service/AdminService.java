package com.project.Smallbox.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.AdminMapper;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.StarMovieVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 관리자 페이지 - 영화 목록 조회
	public List<StarMovieVO> getStarMovieList(String keyword, int startRow, int listLimit) {
		return mapper.selectStarMovieList(keyword, startRow, listLimit);
	}

	// 관리자 페이지 - 영화 상세정보 조회
	public MovieVO getAdminMovieDetail(int movie_idx) {
		return mapper.selectMovie(movie_idx);
	}

	// 관리자 페이지 - 영화 삭제
	public int deleteMovie(int movie_idx) {
		return mapper.removeMovie(movie_idx);
	}

	// 관리자 페이지 - 영화 삭제 전 등록된 파일명 조회
	public String getPoster(int movie_idx) {
		return mapper.selectPoster(movie_idx);
	}
	
	// 관리자 페이지 - 영화 갯수 조회
	public int getMovieListCount(String keyword) {
		return mapper.selectBoardListCount(keyword);
	}

	// 관리자 페이지 - 게시물 등록 작업 요청
	public int registMovie(MovieVO movie) {
		return mapper.insertAdminMovie(movie);
	}

	// 관리자 페이지 - 영화 수정
	public int modifyMovie(MovieVO movie) {
		return mapper.updateMovie(movie);
	}

	// 관리자 페이지 - 글 수정 파일 삭제
	public int removePoster(int movie_idx, String movie_pictue) {
		return mapper.deletePoster(movie_idx, movie_pictue);
	}

}

