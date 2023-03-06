package com.project.Smallbox.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import com.project.Smallbox.service.NoticeService;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.NoticeVO;
import com.project.Smallbox.vo.PageInfo;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	// 공지 작성 글 쓰기 폼 불러오기
	@GetMapping(value = "/Admin_notice_write.ad")
	public String write() {
		
		return "admin/admin_notice_insert";
	}
	// 공지 작성 글 쓰기 작업 비즈니스 로직 요청
	@PostMapping(value = "/Admin_notice_writePro.ad")
	public String writePro(@ModelAttribute NoticeVO notice, HttpSession session, Model model) {
		
		String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("saveDir : " + saveDir);
		
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
		MultipartFile mFile = notice.getFile();
		
		String originalFileName = mFile.getOriginalFilename(); // 원본 파일명
		String realFileName = "";
		System.out.println("originalFileName : " + originalFileName);
		
		// 중복 방지를 위해 랜덤값을 파일명에 결합
		String uuid = UUID.randomUUID().toString();
		realFileName += uuid + "_" + originalFileName;
		notice.setNotice_file(realFileName); // UUID를 결합한 파일명을 객체에 저장
		notice.setNotice_real_file(""); // 삭제할 컬럼이므로 임시로 널스트링값 저장
		
		
		int insertCount = service.registNotice(notice);
		
		if(insertCount > 0) { 
			
			try {
				mFile.transferTo(new File(saveDir, realFileName));
				System.out.println("saveDir : " + saveDir + ", realFileName : " + realFileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 글쓰기 성공 시 공지 목록으로 이동
			return "redirect:/Notice_list.ad";
		} else { 
			model.addAttribute("msg", "공지 등록 실패!");
			return "fail_back";
		}
		
	}
	@GetMapping(value = "/Notice_list.ad")
	public String noticeList(HttpSession session, Model model, @RequestParam(defaultValue = "") String keyword, 
							@RequestParam(defaultValue = "1") int pageNum) {
		
		int listLimit = 5; // 페이지 당 게시글 5개씩 보이기
		int startRow = (pageNum-1) * listLimit; // 시작 글번호
		
		List<NoticeVO> noticeList = service.getNoticeList(keyword, startRow, listLimit);
		
		// 한 페이지에서 표시할 페이지 목록 갯수 계산
		int listCount = service.getNoticeListCount(keyword);
		
		int pageListLimit = 5;
		int maxPage = listCount / listLimit 
				+ (listCount % listLimit == 0 ? 0 : 1);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/notice_list";
	}
	// 공지 상세 보기
	@GetMapping(value = "/NoticeDetail.ad")
	public String detail(@RequestParam int notice_idx, Model model) {
		
		NoticeVO notice = service.getNotice(notice_idx, true);
		
		model.addAttribute("notice", notice);
		
		return "notice_view";
	}
	// 공지 삭제 폼 요청
	@GetMapping(value = "/NoticeDeleteForm.ad")
	public String delete() {
		
		return "admin/notice_delete";
	}
	// 공지 삭제 비즈니스 로직 요청
	@PostMapping(value = "/NoticeDeletePro.ad")
	public String deletePro(@RequestParam int notice_idx, Model model, HttpSession session) {
		
		String notice_file = service.getFile(notice_idx);
		
		int deleteCount = service.removeNotice(notice_idx);
		
		if(deleteCount > 0) { // 삭제 성공
			String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			// 서버에서 파일 삭제
			Path path = Paths.get(saveDir + "/" + notice_file);
			// Files 클래스의 deleteIfExists() 메서드를 호출하여 지정된 파일 삭제하기
			try {
				Files.deleteIfExists(path);
			} catch (IOException e1) {
				e1.printStackTrace();
			}

			return "redirect:/Notice_list.ad";
		} else {
			model.addAttribute("msg", "공지글 삭제 실패!");
			return "fail_back";
		}
	}
	// 공지 수정 폼 요청
	@GetMapping(value = "/NoticeModifyForm.ad")
	public String modify(@RequestParam int notice_idx, Model model) {
		
		NoticeVO notice = service.getNotice(notice_idx, false);
		
		model.addAttribute("notice", notice);
		
		return "admin/admin_notice_modify";
	}
	// 공지 수정 비즈니스 로직 요청
	@PostMapping(value = "/Admin_notice_modifyPro.ad")
	public String modifyPro(@ModelAttribute NoticeVO notice, @RequestParam(defaultValue = "1") int pageNum,
							Model model, HttpSession session,
							@RequestParam(value = "notice_file", required = false) String notice_file) {
		
		if(notice.getNotice_file() == null) {
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
			MultipartFile mFile = notice.getFile();
			
			System.out.println("notice.getFile(): " + notice.getFile());
			
			String originalFileName = mFile.getOriginalFilename(); // 원본 파일명
			String realFileName = "";
			
			// 중복 방지를 위해 랜덤값을 파일명에 결합
			String uuid = UUID.randomUUID().toString();
			realFileName += uuid + "_" + originalFileName;
			
			notice.setNotice_file(realFileName);
			notice.setNotice_real_file("");
			
			int updateCount = service.modifyNotice(notice);
			
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
				
				return "redirect:/Notice_list.ad?pageNum=" + pageNum;
			} else {
				model.addAttribute("msg", "글 수정 실패!");
				return "fail_back";
			}
		} else { 
			
			int updateCount = service.modifyNotice(notice);
			
			if(updateCount > 0) { 
				
				return "redirect:/Notice_list.ad?pageNum=" + pageNum;
			} else { 
				model.addAttribute("msg", "공지 글 수정 실패!");
				return "fail_back";
			}
		}
		
	}
	
	// Ajax를 활용하여 공지 수정시 파일을 삭제할 수 있도록 함
	@ResponseBody
	@PostMapping("/DeleteFile")
	public void deleteFile(
			@RequestParam int notice_idx,
			@RequestParam String notice_file,
			HttpSession session, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		
		try {
			
			int deleteCount = service.removeFile(notice_idx, notice_file);
			
			
			if(deleteCount > 0) { 
				String uploadDir = "/resources/upload"; 
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				Path path = Paths.get(saveDir + "/" + notice_file);
				Files.deleteIfExists(path);
				
				response.getWriter().print("true");
			} else { 
				response.getWriter().print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
