package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.StarMovieVO;

public interface AdminMapper {

	// 관리자 페이지 - 영화 목록 조회
	public List<StarMovieVO> selectStarMovieList(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 관리자 페이지 - 영화 상세정보 조회
	public MovieVO selectMovie(int movie_idx);

	// 관리자 페이지 - 영화 삭제
	public int removeMovie(int movie_idx);

	// 관리자 페이지 - 영화 삭제 전 등록된 파일명 조회
	public String selectPoster(int movie_idx);
	
	// 관리자 페이지 - 영화 갯수 조회
	public int selectBoardListCount(String keyword);

	// 관리자 페이지 - 게시물 등록 작업 요청
	public int insertAdminMovie(MovieVO movie);

	// 관리자 페이지 - 영화 수정
	public int updateMovie(MovieVO movie);

	// 관리자 페이지 - 글 수정 파일 삭제
	public int deletePoster(
			@Param("movie_idx") int movie_idx, 
			@Param("movie_pictue") String movie_pictue);



}
