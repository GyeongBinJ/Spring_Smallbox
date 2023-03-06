package com.project.Smallbox.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.Smallbox.service.AdminService;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MemberVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.PageInfo;
import com.project.Smallbox.vo.QnaVO;
import com.project.Smallbox.vo.StarMovieVO;
import com.project.Smallbox.vo.TheaterVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	// 관리자 페이지 - 영화 등록폼
	@GetMapping(value = "/MovieInsertForm.ad")
	public String movieInsert() {
		return "admin/admin_movie_insert";
	}
	
	// 관리자 페이지 - 영화 등록 비즈니스 로직
	@PostMapping(value = "/MovieInsertPro.ad")
	public String movieInsertPro(@ModelAttribute MovieVO movie, Model model, HttpSession session) {
		
		String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("saveDir : " + saveDir);
		
		// Path 객체 얻어오기
		Path path = Paths.get(saveDir);
		// Files 클래스의 createDirectories() 메서드를 호출하여 지정된 경로 또는 파일 생성
		try {
			Files.createDirectories(path);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// ----------------------------------------------------------

		// MultipartFile 객체 꺼내기
		MultipartFile mFile = movie.getFile();
		
		String originalFileName = mFile.getOriginalFilename(); // 원본 파일명
		String realFileName = "";
		System.out.println("originalFileName : " + originalFileName);
		
		// 중복 방지를 위해 랜덤값을 파일명에 결합
		String uuid = UUID.randomUUID().toString();
		realFileName += uuid + "_" + originalFileName;
		movie.setMovie_picture(realFileName); // UUID를 결합한 파일명을 객체에 저장
		movie.setMovie_real_picture(""); // 삭제할 컬럼이므로 임시로 널스트링값 저장
		
		// 영화 등록
		int insertCount = service.registMovie(movie);
		
		if(insertCount > 0) { // 등록 성공시
			// 해당 파일을 실제 위치로 이동
			try {
				mFile.transferTo(new File(saveDir, realFileName));
//					System.out.println("saveDir : " + saveDir + ", realFileName : " + realFileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 관리자 영화 목록으로 이동
			return "redirect:/AdminMovieList.ad";
		} else { // 등록 실패시
			model.addAttribute("msg", "영화 등록 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 영화 목록 조회 비즈니스 로직 (페이징 처리)
	@GetMapping(value = "/AdminMovieList.ad")
	public String adminMovieList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNum) {
		
		int listLimit = 8; // 한 페이지에 출력될 게시물 수
		int startRow = (pageNum-1) * listLimit; // 현재 페이지의 첫 게시물의 행번호(=시작 글번호)
		
		List<StarMovieVO> starmovieList = service.getStarMovieList(keyword, startRow, listLimit);
		
		int listCount = service.getMovieListCount(keyword);
		
		int pageListLimit = 10; // 한 페이지에 표시할 페이지 목록 수
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("starmovieList", starmovieList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_movie_list";
	}
	
	// 관리자 페이지 - 영화 상세정보 조회 비즈니스 로직
	@GetMapping(value = "/AdminMovieDetailPro.ad")
	public String adminMovieDetail(@RequestParam int movie_idx, Model model) {
		
		// 각 영화의 상세정보 조회
		MovieVO movie = service.getAdminMovieDetail(movie_idx);
		
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie_view";
	}
	
	// 관리자 페이지 - 영화 수정폼 비즈니스 로직
	@GetMapping(value = "/MovieModifyForm.ad")
	public String movieModify(@RequestParam int movie_idx, Model model) {
		
		MovieVO movie = service.getAdminMovieDetail(movie_idx);
		
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie_modify";
	}
	
	// 관리자 페이지 - 영화 수정 비즈니스 로직
	@PostMapping(value = "/MovieModifyPro.ad")
	public String movieModifyPro(@ModelAttribute MovieVO movie, 
			@RequestParam(defaultValue = "1") int pageNum,
			Model model, HttpSession session,
			@RequestParam(value="movie_picture",required = false) String movie_picture) {
	
		if(movie.getMovie_picture() == null) {
			String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			// --------------- java.nio 패키지(Files, Path, Paths) 객체 활용 -----------------
			// 1. Paths.get() 메서드를 호출하여 대상 파일 또는 경로에 대한 Path 객체 얻어오기
			Path path = Paths.get(saveDir);
			// 2. Files 클래스의 createDirectories() 메서드를 호출하여
			//    지정된 경로 또는 파일 생성하기
			try {
				Files.createDirectories(path);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			// -------------------------------------------------------------------------------
			// MultipartFile 객체 꺼내기
			MultipartFile mFile = movie.getFile();
			
			String originalFileName = mFile.getOriginalFilename(); // 원본 파일명
			String realFileName = "";
			
			// 중복 방지를 위해 랜덤값을 파일명에 결합
			String uuid = UUID.randomUUID().toString();
			realFileName += uuid + "_" + originalFileName;
			
			movie.setMovie_picture(realFileName);
			movie.setMovie_real_picture(""); // 삭제할 컬럼이므로 임시로 널스트링값 저장
			
			// 영화 등록
			int updateCount = service.modifyMovie(movie);
			
			if(updateCount > 0) { // 등록 성공시
				// 해당 파일을 실제 위치로 이동
				try {
					mFile.transferTo(new File(saveDir, realFileName));
					System.out.println("saveDir : " + saveDir + ", realFileName : " + realFileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 관리자 영화 목록으로 이동
				return "redirect:/AdminMovieList.ad?pageNum=" + pageNum;
			} else { // 등록 실패시
				model.addAttribute("msg", "영화 수정 실패!");
				return "fail_back";
			}
		} else { // 파일 수정 없이 영화 수정
			// 영화 등록
			int updateCount = service.modifyMovie(movie);
			
			if(updateCount > 0) { // 등록 성공시
				// 관리자 영화 목록으로 이동
				return "redirect:/AdminMovieList.ad?pageNum=" + pageNum;
			} else { // 등록 실패시
				model.addAttribute("msg", "영화 수정 실패!");
				return "fail_back";
			}
		}
	}
	
	// 관리자 페이지 - 글 수정 파일 삭제 처리를 별도로 수행(AJAX 요청)
	@ResponseBody
	@PostMapping("/PosterDelete")
	public void deletePoster(
			@RequestParam int movie_idx,
			@RequestParam String movie_pictue,
			HttpSession session, HttpServletResponse response) {
		System.out.println(movie_idx + ", " + movie_pictue);
		
		response.setCharacterEncoding("UTF-8");
		
		try {
			// 영화 번호가 일치할 경우 파일 삭제
			int deleteCount = service.removePoster(movie_idx, movie_pictue);
			
			// DB 파일 삭제 성공 시 실제 파일 삭제
			if(deleteCount > 0) { // 삭제 성공
				String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				Path path = Paths.get(saveDir + "/" + movie_pictue);
				Files.deleteIfExists(path);
				
				response.getWriter().print("true");
			} else { // 삭제 실패
				response.getWriter().print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 관리자 페이지 - 영화 삭제 비즈니스 로직 (서버에서 파일 삭제 추가)
	@GetMapping(value = "/MovieDeletePro.ad")
	public String movieDelete(@RequestParam int movie_idx, Model model, HttpSession session) {
		
		// 영화 삭제 전 해당 영화의 파일명 조회
		String movie_poster = service.getPoster(movie_idx);
		
		// 영화 삭제
		int deleteCount = service.deleteMovie(movie_idx);
		
		if(deleteCount>0) { // 삭제 성공
			String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			// 서버에서 파일 삭제
			Path path = Paths.get(saveDir + "/" + movie_poster);
			// Files 클래스의 deleteIfExists() 메서드를 호출하여 지정된 파일 삭제하기
			try {
				Files.deleteIfExists(path);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			// 영화 삭제 성공시 영화 목록으로 이동
			return "redirect:/AdminMovieList.ad";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	// ---------------------------------- 관리자 페이지 - 영화 관리 끝!
	
	// 관리자 페이지 - 회원 목록
	@GetMapping("/MemberList.ad") // 회원목록
	public String memberListTotal(Model model,
				HttpSession session, 
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int pageNum) {
		String id = (String)session.getAttribute("sId");
		if(id == null || id.equals("") || !id.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
//			 ---------------------------------------------------------------------------
			int listLimit = 10; 
			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

			// ---------------------------------------------------------------------------
			List<MemberVO> memberList = service.getMemberList(keyword, startRow, listLimit);
			// ---------------------------------------------------------------------------
			// 페이징 처리
			// 한 페이지에서 표시할 페이지 목록(번호) 갯수 계산
			int listCount = service.getMemberListCount(keyword);
			System.out.println("총 회원 수 : " + listCount);
			
			// 2. 한 페이지에서 표시할 페이지 목록 갯수 설정
			int pageListLimit = 10; 
			
			// 3. 전체 페이지 목록 수 계산
			int maxPage = listCount / listLimit 
							+ (listCount % listLimit == 0 ? 0 : 1); 
			
			// 4. 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 5. 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
			//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// PageInfo 객체 생성 후 페이징 처리 정보 저장
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			model.addAttribute("memberList", memberList);
			model.addAttribute("pageInfo", pageInfo);
			
		return "admin/admin_member";
		}
	}
	
	// 관리자 페이지 - 쿠폰 목록
		@GetMapping("/CouponListTotal.ad") // 회원목록
		public String couponListTotal(Model model,
					HttpSession session, 
					@RequestParam(defaultValue = "") String keyword,
					@RequestParam(defaultValue = "1") int pageNum) {
			String id = (String)session.getAttribute("sId");
			if(id == null || id.equals("") || !id.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "fail_back";
			} else {
//				 ---------------------------------------------------------------------------
				int listLimit = 10; 
				int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

				// ---------------------------------------------------------------------------
				List<CouponVO> couponList = service.getTotalCouponList(keyword, startRow, listLimit);
				// ---------------------------------------------------------------------------
				// 페이징 처리
				// 한 페이지에서 표시할 페이지 목록(번호) 갯수 계산
				int listCount = service.getCouponListCount(keyword);
				System.out.println("총 쿠폰 개수 : " + listCount);
				
				// 2. 한 페이지에서 표시할 페이지 목록 갯수 설정
				int pageListLimit = 10; 
				
				// 3. 전체 페이지 목록 수 계산
				int maxPage = listCount / listLimit 
								+ (listCount % listLimit == 0 ? 0 : 1); 
				
				// 4. 시작 페이지 번호 계산
				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
				
				// 5. 끝 페이지 번호 계산
				int endPage = startPage + pageListLimit - 1;
				
				// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
				//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				// PageInfo 객체 생성 후 페이징 처리 정보 저장
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				model.addAttribute("couponList", couponList);
				model.addAttribute("pageInfo", pageInfo);
				
			return "admin/admin_couponList_total";
			}
		}
	
	// 관리자 페이지 - 쿠폰 수정 폼 이동
		@GetMapping("/CouponModify.ad")
		public String couponModify() {
			return "admin/admin_coupon_modify";
		}
		
	// 관리자 페이지 - 쿠폰 수정 작업
	@PostMapping(value = "/CouponModifyPro.ad")
	public String couponModifyPro(
			@ModelAttribute CouponVO coupon, 
			@RequestParam(defaultValue = "") String member_id,
			Model model, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		if(id == null || id.equals("") || !id.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			int updateCount = service.modifyCoupon(coupon);
			
			if(updateCount > 0) { 
				// 해당 회원에 해당하는 쿠폰 목록으로 이동
				return "redirect:/CouponList.ad?member_id=" + member_id;
			} else { 
				model.addAttribute("msg", "쿠폰 수정 실패!");
				return "fail_back";
			}
		}
	}
	
	// 각 회원이 가지고 있는 쿠폰목록
	@GetMapping("/CouponList.ad")
	public String couponList(Model model,
		HttpSession session, 
		@RequestParam(defaultValue = "") String member_id
		) {
			String id = (String)session.getAttribute("sId");
			if(id == null || id.equals("") || !id.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "fail_back";
			} else {
				// ---------------------------------------------------------------------------
				List<CouponVO> couponList = service.getCouponList(member_id);
				model.addAttribute("couponList", couponList);
				
			return "admin/admin_coupon";
			}
    } 
	// ---------------------------------- 관리자 페이지 - 극장관리
	// 관리자 페이지 - 상영일정 등록 폼
	@GetMapping(value = "/AdminTheaterInsertForm.ad")
	public String theaterInsert(Model model) {
		
		// 상영일정 등록 폼에서 등록된 영화 조회
		List<MovieVO> movieList = service.getMovieList();
		
		model.addAttribute("movieList", movieList);
		return "admin/admin_theater_insert";
	}
	
	// 관리자 페이지 - 상영일정 등록 비지니스 로직
	@PostMapping(value = "/AdminTheaterInsertPro.ad")
	public String theaterInsertPro(@ModelAttribute TheaterVO theater, Model model, HttpSession session) {
		
		int insertCount = service.insertTheater(theater);
		
		if(insertCount > 0) {
			return "redirect:/AdminTheaterList.ad";
		} else {
			model.addAttribute("msg", "상영일정 등록 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 상영일정 목록 조회
	@GetMapping(value = "/AdminTheaterList.ad")
	public String adminTheaterList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNum) {
		
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		
		List<TheaterVO> theaterList = service.getTheaterList(keyword, startRow, listLimit);
		
		int listCount = service.getTheaterListCount(keyword);
		
		int pageListLimit = 10; // 한 페이지에 표시할 페이지 목록 수
		int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
			
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_theater_list";
	}
				
	// 관리자 페이지 - 상영일정 상세정보 조회
	@GetMapping(value = "/AdminTheaterDetail.ad")
	public String adminTheaterDetail(@RequestParam int theater_idx, Model model) {
		
		TheaterVO theater = service.getTheaterDetail(theater_idx);
		model.addAttribute("theater", theater);
		
		return "admin/admin_theater_detail";
	}
		
	// 관리자 페이지 - 상영일정 수정폼 
	@GetMapping(value = "/AdminTheaterModifyForm.ad")
	public String adminTheaterModify(@RequestParam int theater_idx, Model model) {
		
		TheaterVO theater = service.getTheaterDetail(theater_idx);
		List<MovieVO> movieList = service.getMovieList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theater", theater);
		
		return "admin/admin_theater_modify";
	}
		
	// 관리자 페이지 - 상영일정 수정 비지니스 로직
	@PostMapping(value = "/AdminTheaterModifyPro.ad")
	public String adminTheaterModifyPro(@ModelAttribute TheaterVO theater, int theater_idx, Model model) {
		
		int updateCount = service.modifyTheater(theater);
		
		if(updateCount > 0) {
			return "redirect:/AdminTheaterDetail.ad?theater_idx=" + theater_idx;
		} else {
			model.addAttribute("msg", "상영일정 수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 상영일정 삭제 비지니스 로직
	@GetMapping(value = "/AdminTheaterDeletePro.ad")
	public String adminTheaterDeletePro(@RequestParam int theater_idx, Model model) {
		
		int deleteCount = service.deleteTheater(theater_idx);
		
		if(deleteCount > 0) {
			return "redirect:/AdminTheaterList.ad";
		} else {
			model.addAttribute("msg", "상영일정 삭제 실패!");
			return "fail_back";
		}
	}

	
	// 관리자페이지 - 쿠폰 등록
	@GetMapping("/CouponInsert.ad")
	public String couponInsert(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id == null || id.equals("") || !id.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		return "admin/admin_coupon_insert";
	}
	
	// 관리자페이지 - 쿠폰 등록 비즈니스 로직
	@PostMapping("/CouponInsertPro.ad")
	public String couponInsertPro(
		Model model,
		HttpSession session,
		@RequestParam(defaultValue = "") String member_id,
		@ModelAttribute CouponVO coupon
		) {
			String id = (String)session.getAttribute("sId");
			if(id == null || id.equals("") || !id.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "fail_back";
			} else {
				int insertCount = service.registCoupon(coupon);
				if(insertCount > 0) {
					return "redirect:/CouponList.ad?member_id=" + member_id;
				} else { // 등록 실패시
					model.addAttribute("msg", "쿠폰 등록 실패!");
					return "fail_back";
				}
			
			}
		}
	
	// 관리자페이지 - 쿠폰 삭제
	@GetMapping("/CouponDelete.ad")
	public String couponDelete(
			Model model,
			HttpSession session,
			@RequestParam(defaultValue = "") String member_id,
			@RequestParam(defaultValue = "") Date coupon_end_date
			) {
		String id = (String)session.getAttribute("sId");
		if(id == null || id.equals("") || !id.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			int deleteCount = service.removeCoupon(member_id, coupon_end_date);
			if(deleteCount > 0) {
				return "redirect:/CouponList.ad?member_id=" + member_id;
			} else {
				model.addAttribute("msg", "쿠폰 삭제 실패!");
				return "fail_back";
			}
		}
	}
	// ---------------------------------- 관리자 페이지 - 쿠폰 끝!
	
	// 관리자페이지 - (관리자용) 1:1문의 내역
	@GetMapping(value = "QnaList.ad")
	public String qnaList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int pageNum) {
		
			int qnaLimit = 10;
			int startRow = (pageNum-1) * qnaLimit;
			
			List<QnaVO> qnaList = service.getAdminQnaList(startRow, qnaLimit);
			
			int listCount = service.getAdminQnaListCount();
			int pageListLimit = 10;
			int maxPage = listCount/qnaLimit + (listCount%qnaLimit!=0? 1 : 0);
			int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
			int endPage = startPage * pageListLimit - 1;
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			
			// PageInfo 객체 생성 후 페이징 처리 정보 저장
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "admin/admin_qna_list";
	}
	// 관리자페이지 - (관리자용) 1:1문의 상세보기
	@GetMapping(value = "QnaDetail.ad")
	public String qnaDetail(HttpSession session, Model model,
			@RequestParam int qna_idx) {
		QnaVO qna = service.getAdminQnaDetail(qna_idx);
		
		model.addAttribute("qna", qna);
		
		return "admin/admin_qna_view";
	}
}