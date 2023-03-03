package com.project.Smallbox.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.CommentMapper;
import com.project.Smallbox.vo.CommentVO;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper mapper;

	public List<CommentVO> getCommentList(int movieIdx) {
		return mapper.selectCommentList(movieIdx);
	}

	public double getStarAvg(int movieIdx) {
		return mapper.selectStarAvg(movieIdx);
	}

	public int containsUser(int movieIdx, String member_id) {
		return mapper.selectUser(movieIdx, member_id);
	}

	public int registComment(CommentVO comment) {
		return mapper.insertComment(comment);
	}

	public int deleteComment(int commentIdx) {
		return mapper.deleteComment(commentIdx);
	}

	


}
