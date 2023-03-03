package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.CommentVO;

public interface CommentMapper {

	//파라미터 2개 이상이면 @Param("abcd") String abcd 꼭 추가하기!
	List<CommentVO> selectCommentList(int movieIdx);

	double selectStarAvg(int movieIdx);

	int selectUser(@Param("movieIdx") int movieIdx, @Param("member_id") String member_id );

	int insertComment(CommentVO comment);

	int deleteComment(int commentIdx);
	

	

}
