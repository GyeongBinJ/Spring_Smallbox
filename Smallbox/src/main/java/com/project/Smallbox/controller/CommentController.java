package com.project.Smallbox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Smallbox.service.CommentService;
import com.project.Smallbox.vo.CommentVO;


@Controller
public class CommentController {

	@Autowired
	private CommentService service;
	/*
	댓글 컨트롤러
	
	< 관련>
		1. 품목 그룹 조회 Group List(line 179)
		2. 품목 그룹 등록 Group Regist(line 112), Group Regist Pro(line 144)
		3. 품목 그룹 삭제 Delete Group(line 230)
	
	*/
	//=============================================== 댓글 작성 ================================================
	@PostMapping(value = "/CommentWritePro.mv")
	public String writeComment(@ModelAttribute CommentVO comment,
												@RequestParam String movie_idx, 
												@RequestParam String movie_title, 
												@RequestParam String member_id, 
												@RequestParam String star, 
												@RequestParam String comment_content, 
												Model model) {
		
		System.out.println("movie_idx = " + movie_idx + ", movie_title = " + movie_title + ", member_id = " + member_id  + ", star = " + star + ", comment_content = " + comment_content);
		
		//별 갯수, 영화 번호 형변환
		int movieIdx = Integer.parseInt(movie_idx);
		int commentStar = Integer.parseInt(star);
		
		comment.setMovie_idx(movieIdx);
		comment.setComment_star(commentStar);
		comment.setMember_id(member_id);
		comment.setComment_content(comment_content);
		
		System.out.println("comment = " + comment);
		
		//리뷰 테이블 안에 SELECT member_id FROM comment WHERE movie_idx=? AND member_id=?
		//해서 조회가 된다면 1 리턴 이미 리뷰를 작성한 회원입니다. 히스토리 백
		// 조회가 안된다면 0리턴,  밑에 코드 실행 
		int containsUser = service.containsUser(movieIdx, member_id);
	
		if(containsUser > 0) { // 영화에 댓글 쓴 아이디가 조회 될 경우(=댓글 이미 썼을 경우)
			model.addAttribute("msg", "리뷰는 한 번만 작성할 수 있습니다!");
			return "fail_back";
		} else { // 영화에 댓글 쓴 아이디가 없을 경우(=댓글을 쓴 기록이 없을 경우)
			int insertCommentCount = service.registComment(comment);
			
			if(insertCommentCount > 0) { // success
				return "redirect:/MovieDetail.mv?movie_idx="+movie_idx;
				} else { // fail
					model.addAttribute("msg", "리뷰 등록 실패!");
					return "fail_back";
				} // 댓글 작성 성공, 실패 if-else end
	
		} // 댓글 작성 기록 판별 if-else end
	}
	//========================================================================================================
		@GetMapping(value = "/DelComment.mv")
		public String delComment(@RequestParam String comment_idx, @RequestParam String movie_idx, Model model) {
			int commentIdx = Integer.parseInt(comment_idx);
			int delCommentCount = service.deleteComment(commentIdx);
			
			if(delCommentCount > 0) {
				return "redirect:/MovieDetail.mv?movie_idx=" + movie_idx;
			} else {
				model.addAttribute("msg", "리뷰 등록 실패!");
				return "fail_back";
			}
			
		}
	
	
}
