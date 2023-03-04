package com.project.Smallbox.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_idx;
	private String notice_subject;
	private String notice_content;
	private String notice_file;
	private String notice_real_file;
	private int notice_readCount;
	private Timestamp notice_date;
	
	// 파일 업로드를 위한 MultipartFile 객체
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public String getNotice_real_file() {
		return notice_real_file;
	}
	public void setNotice_real_file(String notice_real_file) {
		this.notice_real_file = notice_real_file;
	}
	public int getNotice_readCount() {
		return notice_readCount;
	}
	public void setNotice_readCount(int notice_readCount) {
		this.notice_readCount = notice_readCount;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_idx=" + notice_idx + ", notice_subject=" + notice_subject + ", notice_content="
				+ notice_content + ", notice_file=" + notice_file + ", notice_real_file=" + notice_real_file
				+ ", notice_readCount=" + notice_readCount + ", notice_date=" + notice_date + "]";
	}
	
}
