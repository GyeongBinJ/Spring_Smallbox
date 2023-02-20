package com.project.Smallbox.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;

import com.project.Smallbox.service.MyPageService;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.MypageVO;
import com.project.Smallbox.vo.PageInfo;
import com.project.Smallbox.vo.PosterVO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService service;
	
	// 마이페이지 - 메인
	@GetMapping(value = "/MyPageMain.my")
	public String mypage(HttpSession session, Model model) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장
		String member_id = (String)session.getAttribute("sId");
		
		// 마이페이지 메인 정보 조회
		MypageVO mypage = service.getMypageInfo(member_id);
		
		model.addAttribute("mypage", mypage);
		System.out.println("mypage : " + mypage);
		
		return "mypage/mypage_main";
	}
	
	// 마이페이지 - 찜 목록 조회
	@GetMapping(value = "MovieLikeList.my")
	public String myLikeList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장
		String member_id = (String)session.getAttribute("sId");
		
		int movieLimit = 8; // 한 페이지에 출력될 영화의 수
		int startRow = (pageNum-1) * movieLimit; // 현재 페이지의 첫 영화의 행번호(=시작 글번호)
		
		// 각 회원 아이디(member_id)가 찜한 영화의 정보 가져오기
		// movie_like 테이블의 movie_idx와 movie 테이블의 movie_idx를 조인하는 작업 요청
		List<MovieVO> likeList = service.getMovieLikeList(member_id, startRow, movieLimit);
		
		// 각 회원이 찜한 영화 수 조회 (DB 작업 필요)
		int movieCount = service.getMovieListCount(member_id);
		
		int pageListLimit = 10; // 한 페이지에 표시할 페이지 목록 수
		int maxPage = movieCount/movieLimit + (movieCount%movieLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(movieCount, pageListLimit, maxPage, startPage, endPage);
		
		// MovieBean 객체에 저장된 movie 테이블의 정보를 request의 likeList 속성에 저장해서 view로 전달
		// 찜 목록에 뿌릴거라서 이름을 likeList라고 했는데 헷갈리시면 바꿔도 돼요 
		// 이름은 likeList지만 안에 든 정보는 MovieBean(영화정보) 입니다.
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("likeList", likeList);
		
		return "mypage/movie_like_list";
	}
	
	// 마이페이지 - 쿠폰 목록 조회
	@GetMapping(value = "CouponList.my")
	public String myCouponList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장
		String member_id = (String)session.getAttribute("sId");
		
		int couponLimit = 10;
		int startRow = (pageNum-1) * couponLimit; // 조회 시작 행번호 계산
		
		List<CouponVO> couponList = service.getCouponList(member_id, startRow, couponLimit);
		
		int listCount = service.getCouponListCount(member_id);
		int pageListLimit = 10;
		int maxPage = listCount/couponLimit + (listCount%couponLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
			
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypage/mypage_coupon_list";
	}
	
	// 마이페이지 - 리뷰 목록 조회 
	@GetMapping(value = "ReviewList.my")
	public String myReviewList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		// 로그인 한 회원을 식별하기 위해 세션아이디 저장
		String member_id = (String)session.getAttribute("sId");
		
		int commentLimit = 5; // 한 페이지에 출력될 리뷰의 수
		int startRow = (pageNum-1) * commentLimit; // 현재 페이지의 첫 리뷰의 행번호(=시작 글번호)
		
		List<PosterVO> reviewList = service.getReviewList(member_id, startRow, commentLimit);
		
		int commentCount = service.getCommentListCount(member_id);
		
		int pageListLimit = 10; // 한 페이지에 표시할 페이지 목록 수
		int maxPage = commentCount/commentLimit + (commentCount%commentLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(commentCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypage/mypage_review_list";
	}
	
	// 마이페이지 - 리뷰 삭제
	@PostMapping(value = "ReviewDelete.my")
	public String myReviewDelete(@RequestParam int comment_idx, Model model) {
		
		int deleteCount = service.deleteReview(comment_idx);
		
		if(deleteCount>0) { // 삭제 성공
			// 리뷰 삭제 성공시 리뷰 목록으로 이동
			return "redirect:/ReviewList.my";
		} else { // 삭제 실패
			model.addAttribute("msg", "리뷰 삭제 실패!");
			return "fail_back";
		}
	}
	
}
