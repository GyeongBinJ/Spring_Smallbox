package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.PageInfo;
import com.project.Smallbox.vo.StarMovieVO;

public interface MovieMapper {
	
	// 영화 전체 목록 조회 (박스오피스)
	public List<StarMovieVO> selectStarMovieList(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	// 박스오피스 영화 총 개수
	public int StarMovieListCount(String keyword);
	
	// 영화 목록 페이지 접속시 각 회원별 찜 목록 가져오기 (Integer)
	public List<Integer> selectLikeList2(String member_id);

	// 개봉 예정작 조회
	public List<MovieVO> selectComingMovieList(
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	// 개봉 예정작 총 개수
	public int ComingMovieListCount(String keyword);
	
	// 찜이 되어있는지 판별
	public int selectLike(
			@Param("movie_idx") int movie_idx,
			@Param("member_id") String member_id);

	// 찜 해제 작업 수행
	public int deleteMovieLike(
			@Param("movie_idx") int movie_idx, 
			@Param("member_id") String member_id);

	// 찜 작업 수행
	public int insertMovieLike(
			@Param("movie_idx") int movie_idx, 
			@Param("member_id") String member_id);


}
