package com.project.Smallbox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Smallbox.service.CommentService;
import com.project.Smallbox.service.MovieDetailService;
import com.project.Smallbox.vo.CommentVO;
import com.project.Smallbox.vo.MovieVO;

@Controller
public class MovieDetailController {

	@Autowired
	private MovieDetailService service;
	
	@Autowired
	private CommentService cservice;
	
	/*
	영화 상세정보 컨트롤러
	
	< 관련>
		1. 영화 상세 페이지 MovieDetail(line 38)
	*/
	//============================================ 1. 영화 상세 페이지  ============================================
	@GetMapping(value = "/MovieDetail.mv")
	public String movieDetail(@RequestParam(defaultValue = "") String movie_idx,  
											@RequestParam(defaultValue = "1") int pageNum, 
											HttpSession session, Model model) {
		int movieIdx = Integer.parseInt(movie_idx);
//		System.out.println("movie_idx : " + movieIdx); -> 확인 완
		
		//영화 정보 출력
		MovieVO movie = service.getMovieDetail(movieIdx);
		model.addAttribute("movie", movie);
	
		//댓글 출력
				List<CommentVO> commentList = cservice.getCommentList(movieIdx);
//				System.out.println("commentList ?" + commentList);
//				System.out.println("commentList size ?" + commentList.size());
				model.addAttribute("reviewList", commentList);
				if(commentList.size() == 0) {
//					System.out.println("댓글이 없을 경우");
					//평균 평점 출력
					double staravg = 0;
					model.addAttribute("staravg", staravg);
				} else {
//					System.out.println("댓글이 있을 경우");
					//평균 평점 출력
					double staravg = cservice.getStarAvg(movieIdx);
					model.addAttribute("staravg", staravg);
				}
		
		return "movie/movie_detail";
	}
	//==========================================================================================================
	
	
	
	
}
