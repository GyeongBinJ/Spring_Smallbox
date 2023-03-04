package com.project.Smallbox.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.NoticeVO;

public interface NoticeMapper {

	int insertNotice(NoticeVO notice);

	List<NoticeVO> selectNoticeList(@Param("keyword") String keyword, 
									@Param("startRow") int startRow, 
									@Param("listLimit") int listLimit);

	int selectNoticeListCount(String keyword);

	NoticeVO selectNotice(@Param("notice_idx") int notice_idx, 
						  @Param("b") boolean b);

	NoticeVO selectNotice(int notice_idx);

	int updateReadcount(int notice_idx);

	String selectFile(int notice_idx);

	int deleteNotice(int notice_idx);

	int updateNotice(NoticeVO notice);

	int deleteFile(@Param("notice_idx") int notice_idx, 
					@Param("notice_file") String notice_file);

}
