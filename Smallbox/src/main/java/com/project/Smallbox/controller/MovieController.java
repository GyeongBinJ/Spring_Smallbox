package com.project.Smallbox.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	// 영화 전체 목록 조회 (박스오피스)
	@GetMapping(value = "/MovieList.mv")
//	public String movieList(HttpSession session, Model model, @RequestParam(value = "keyword", required=false) String keyword) {
	public String movieList(HttpSession session, Model model, @RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장 (찜여부 판별을 위함)
		String member_id = (String)session.getAttribute("sId");
		
		int listLimit = 8;
		int startRow = (pageNum-1) * listLimit; // 조회 시작 행번호 계산
		
		// 영화 목록 조회 (StarMovieVO View 사용한 이유 : 평점 출력하기 위해서)
		List<StarMovieVO> starmovieList = service.getStarMovieList(keyword, startRow, listLimit);
		
		// 영화 목록 페이지 접속시 각 회원별 찜 목록 가져오기
		List<Integer> likeList = service.getLikeList(member_id);
//		System.out.println("likeList : " + likeList);
//		String like = Integer.toString(likeList.get(0));
//		System.out.println("like : " + like);
			
	  	int listCount = service.getStarMovieListCount(keyword);
		int pageListLimit = 10;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
			
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("starmovieList", starmovieList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "movie/movie_list";
	}
	
	// 개봉 예정작 조회 (페이징 처리)
	@GetMapping(value = "/ComingMovieList.mv")
	public String comingMovieList(HttpSession session, Model model, @RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장 (찜여부 판별을 위함)
		String member_id = (String)session.getAttribute("sId");
		
		int listLimit = 8;
		int startRow = (pageNum-1) * listLimit; // 조회 시작 행번호 계산
		
		// 개봉 예정작 목록 조회
		List<MovieVO> comingMovieList = service.getComingMovieList(keyword, startRow, listLimit);
		
		// 영화 목록 페이지 접속시 각 회원별 찜 목록 가져오기
		List<Integer> likeList = service.getLikeList(member_id);
		
		int listCount = service.getComingMovieListCount(keyword);
		int pageListLimit = 10;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("comingMovieList", comingMovieList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "movie/coming_movie_list";
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
