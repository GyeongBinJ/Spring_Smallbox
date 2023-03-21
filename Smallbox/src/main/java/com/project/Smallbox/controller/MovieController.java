package com.project.Smallbox.controller;

import java.io.IOException;


import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Smallbox.service.MovieService;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.PageInfo;
import com.project.Smallbox.vo.StarMovieVO;

@Controller
public class MovieController {

	@Autowired
	private MovieService service;
	
	// 영화 전체 목록(박스오피스)으로 이동
	@GetMapping(value = "/MovieList.mv")
	public String movieList() {
		return "movie/movie_list";
	}
	
	// AJAX 요청을 통한 영화목록 조회
	@ResponseBody
	@GetMapping("/MovieListJson.mv")
	public void movieListJson(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model,
			HttpServletResponse response, HttpSession session) {
		
		int listLimit = 8; // 한 페이지에서 표시할 게시물 목록을 8개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 영화 목록 조회 (StarMovieVO View 사용한 이유 : 평점 출력하기 위해서)
		List<StarMovieVO> starmovieList = service.getStarMovieList(keyword, startRow, listLimit);
		// ---------------------------------------------------------------------------
		// 자바 데이터를 JSON 형식으로 변환
		JSONArray starMovieArray = new JSONArray();
		
		for(StarMovieVO starmovie : starmovieList) {
			JSONObject jsonStarMovie = new JSONObject(starmovie);
			System.out.println("jsonstarmovie : " + jsonStarMovie);
			
			starMovieArray.put(jsonStarMovie); // JSONObject 객체 추가
		}
		
//		System.out.println("starMovieArray : " + starMovieArray);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(starMovieArray); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// AJAX 요청을 통해 영화 목록 페이지 접속시 각 회원별 찜 목록 가져오기
	@ResponseBody
	@GetMapping("/LikeListJson.mv")
	public void LikelistJson(
			@RequestParam(defaultValue = "") String member_id,
			Model model,
			HttpServletResponse response, HttpSession session) {
		
		// 각 회원의 찜목록 조회
		List<Integer> likeList = service.getLikeList(member_id);
		
		// 자바 데이터를 JSON 형식으로 변환
		JSONArray likeListArray = new JSONArray();
		
		for(Integer like : likeList) {
			JSONObject jsonLike = new JSONObject(like);
			
			jsonLike.put("like", Integer.toString(like)); // 정수타입의 like를 문자열로 변환
			likeListArray.put(jsonLike);
		}
		
		System.out.println("likeListArray : " + likeListArray);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(likeListArray); // toString() 생략됨
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	// 개봉 예정작 목록으로 이동
	@GetMapping(value = "/ComingMovieList.mv")
	public String comingMovieList() {
		return "movie/coming_movie_list";
	}
	
	// AJAX 요청을 통한 영화목록 조회
	@ResponseBody
	@GetMapping("/ComingMovieListJson.mv")
	public void comingMovieListJson(
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model,
			HttpServletResponse response, HttpSession session) {
		
		int listLimit = 8; // 한 페이지에서 표시할 게시물 목록을 8개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 개봉 예정작 목록 조회
		List<MovieVO> comingMovieList = service.getComingMovieList(keyword, startRow, listLimit);
		// ---------------------------------------------------------------------------
		// 자바 데이터를 JSON 형식으로 변환
		JSONArray comingMovieArray = new JSONArray();
		
		for(MovieVO comingmovie : comingMovieList) {
			JSONObject jsonComingMovie = new JSONObject(comingmovie);
			System.out.println("jsonComingMovie : " + jsonComingMovie);
			
			comingMovieArray.put(jsonComingMovie); // JSONObject 객체 추가
		}
		
//		System.out.println("comingMovieArray : " + comingMovieArray);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(comingMovieArray); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 찜 작업
	@PostMapping(value = "/MovieLikePro.mv")
	public void Like(HttpSession session, 
			@RequestParam(defaultValue = "1") int movie_idx, 
			HttpServletResponse response) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장 (찜여부 판별을 위함)
		String member_id = (String)session.getAttribute("sId");
		
		// 찜에 필요한 정보 : 멤버 아이디와 영화 번호
		int likeCount = service.selectLike(movie_idx, member_id);
		
		try {
			if(likeCount > 0) { // 찜이 되어있으면
				service.CancelMovieLike(movie_idx, member_id);

				response.setCharacterEncoding("UTF-8");
				response.getWriter().print("찜");
			
			} else { // 찜이 되어있지 않으면
				service.MovieLike(movie_idx, member_id);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print("찜해제");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 찜 해제 작업 
	@PostMapping(value = "/CancelMovieLikePro.mv")
	public void cancleLike(HttpSession session,
			@RequestParam(defaultValue = "1") int movie_idx,
			HttpServletResponse response) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장 (찜여부 판별을 위함)
		String member_id = (String)session.getAttribute("sId");
				
		int deletelikeCount = service.CancelMovieLike(movie_idx, member_id);
		
	}
	
}
