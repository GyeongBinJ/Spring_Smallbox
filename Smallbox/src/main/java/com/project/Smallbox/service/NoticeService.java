package com.project.Smallbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.NoticeMapper;
import com.project.Smallbox.vo.NoticeVO;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;

	public int registNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}

	public List<NoticeVO> getNoticeList(String keyword, int startRow, int listLimit) {
		return mapper.selectNoticeList(keyword, startRow, listLimit);
	}

	public int getNoticeListCount(String keyword) {
		return mapper.selectNoticeListCount(keyword);
	}

	public NoticeVO getNotice(int notice_idx, boolean isUpdateReadcount) {
		
		NoticeVO notice = mapper.selectNotice(notice_idx);
		
		if(notice != null && isUpdateReadcount) {
			int updateCount = mapper.updateReadcount(notice_idx);
			
			if(updateCount > 0) {
				notice.setNotice_readCount(notice.getNotice_readCount() + 1);
			}
		}
		
		return notice;
	}

	public String getFile(int notice_idx) {
		return mapper.selectFile(notice_idx);
	}

	public int removeNotice(int notice_idx) {
		return mapper.deleteNotice(notice_idx);
	}

	public int modifyNotice(NoticeVO notice) {
		return mapper.updateNotice(notice);
	}

	public int removeFile(int notice_idx, String notice_file) {
		return mapper.deleteFile(notice_idx, notice_file);
	}
}
