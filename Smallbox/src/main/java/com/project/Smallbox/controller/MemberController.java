package com.project.Smallbox.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Smallbox.service.MailSendService;
import com.project.Smallbox.service.MemberService;
import com.project.Smallbox.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private MailSendService mailService;

// ================================= 폼 모음 ================================================
	// 로그인 폼
	@GetMapping("/MemberLoginForm.sm")
	public String login() {
		return "member/login";
	}
	
	// ID 찾기 폼
	@GetMapping("/FindIdForm.sm")
	public String findId() {
		return "member/find_id_form";
	}
		
	// 비밀번호 찾기 폼
	@GetMapping("/FindPasswdForm.sm")
	public String findPass() {
		return "member/find_passwd_form";
	}
	
	// 약관사항 동의폼
	@GetMapping("/MemberTermsForm.sm")
	public String terms() {
		return "terms/terms_form";
	}
	
	// 회원가입 폼
	@GetMapping("/MemberJoinForm.sm")
	public String join() {
		return "member/join_form";
	}
	
	// 회원정보 수정 폼
	@GetMapping("/MemberModifyForm.sm")
	public String modifyForm(String member_id, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 1. 세션 아이디가 없을 경우 "잘못된 접근"
		if(sId == null || sId.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			// 2. 세션 아이디가 있을 경우
			// 2-1) 세션 아이디와 전달받은 아이디가 다르고, 관리자가 아니면 "권한없음"
			// !id.equals("")
			System.out.println("세션 아이디 있음. 아이디 : " + member_id);
			if(member_id != null && !member_id.equals("") && !member_id.equals(sId) && !sId.equals("admin")) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "fail_back";
			} else if(member_id.equals("")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "fail_back";
			}
			
			// 2-2) 세션 아이디와 전달받은 아이디가 같거나, 관리자이면 조회 작업 수행
			// Service 객체의 getMemberInfo() 메서드 호출하여 회원 상세정보 조회
			// => 파라미터 : 아이디(id)   리턴타입 : MemberVO(member)
			MemberVO member = service.getMemberInfo(member_id);
			
			// -----------------------------------------------------------------
			// 만약, 리턴타입을 MemberVO 객체가 아닌 
			// -----------------------------------------------------------------
			
			// 조회 결과를 Model 객체에 "member" 속성명으로 저장
			model.addAttribute("member", member);
					System.out.println("폼 호출 : " + member);
			
			// member/member_info.jsp 페이지로 포워딩
			return "member/member_modify_form";
		}
	}
	
	// 회원 삭제 폼
	@GetMapping("/MemberDelete.sm")
	public String delete(HttpSession session, @ModelAttribute MemberVO member, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 1. 세션 아이디가 없을 경우 "잘못된 접근"
		if(sId == null || sId.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			// 2. 세션 아이디가 있을 경우
			// "권한없음" 판별
			if(member.getMember_id() != null && !member.getMember_id().equals("") && !member.getMember_id().equals(sId) && !sId.equals("admin")) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "fail_back";
			} else if(member.getMember_id().equals("")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "fail_back";
			}
				return "member/member_delete";
		}
	}

// ================================= 폼 모음 끝 ================================================

	
	// 아이디 DB 존재여부 확인 작업
	@ResponseBody
	@GetMapping("/MemberCheckId.sm")
	public void checkId(@RequestParam("id") String id, HttpServletResponse response) {
		
		int insertCount = service.getIdList(id);
		if(insertCount != 0) {
			try {
				response.getWriter().print("1");
				System.out.println(id + " : 사용중인 아이디");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println(id + " : 사용 가능한 아이디");
		}
	}
	
	// 이메일 인증
	@ResponseBody
	@GetMapping("/mailCheck.sm")
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	// 회원가입처리 비즈니스로직
	@PostMapping("/MemberJoinPro.sm")
	public String joinPro(@ModelAttribute MemberVO member, Model model) {
		// ------------------- BCryptPasswordEncoder 객체 활용한 해싱 -------------------
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwdEncoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePasswd);
		// --------------------------------------------------------------------------
		
		int insertCount = service.joinMember(member);
		
		// 가입 성공/실패에 따른 포워딩 작업 수행
		if(insertCount > 0) { // 성공
			// 메인페이지로 리다이렉트
			return "member/join_result";
		} else { // 실패
			// 오류 메시지 출력 및 이전 페이지로 돌아가는 기능을 공통으로 수행할
			// fail_back.jsp 페이지로 포워딩(Dispatch)
			// => 출력할 메세지를 해당 페이지로 전달
			// => Model 객체를 통해 "msg" 속성명으로 "가입 실패!" 메세지 전달
			model.addAttribute("msg", "가입 실패!");
			return "fail_back";
		}
		
	}
	
	// 로그인 작업
	@PostMapping(value = "/MemberLoginPro.sm")
	public String loginPro(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
		
		String passwd = service.getPasswd(member.getMember_id());
		System.out.println("암호문 : " + passwd);
		
		if(passwd == null || !passwdEncoder.matches(member.getMember_passwd(), passwd)) { // 실패
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		} else { // 성공
			session.setAttribute("sId", member.getMember_id());
			return "redirect:/";
		}
//		session.setAttribute("sId", member.getMember_id());
//		return "redirect:/";
	}
	
	// 로그아웃 작업
	@GetMapping("/MemberLogout.sm")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// ID 찾기 작업
	@PostMapping("/findIdPro.sm")
	public String searchIdResult(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "member_name") String member_name, 
	    @RequestParam(required = true, value = "member_phone") String member_phone,
	    MemberVO member) {
	try {
		member.setMember_name(member_name);
		member.setMember_phone(member_phone);
		MemberVO serchId = service.findId(member);
	    
	    model.addAttribute("member", serchId);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	return "member/find_id_result";
	}
	
	// 회원 정보 수정 작업
	@PostMapping("/MemberModifyPro.sm")
	public String memberUpdate(
			@ModelAttribute MemberVO member, // 기본 정보가 저장될 객체 파라미터
			@RequestParam String member_id,
			@RequestParam String oldPasswd, // 기존 패스워드가 저장될 파라미터
			@RequestParam(required = false) String newPasswd, // 새 패스워드가 저장될 파라미터
			@RequestParam(required = false) String newPasswdCheck, // 새 패스워드 확인이 저장될 파라미터
			Model model) {
		

		// 입력받은 패스워드 확인 작업을 위해
		// Service 객체의 getPasswd() 메서드 재사용
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
		String passwd = service.getPasswd(member.getMember_id());
		
		System.out.println("기존 비밀번호 : " + oldPasswd);
		System.out.println("새 비밀번호 : " + newPasswd);
		System.out.println("새 비밀번호 확인 : " + newPasswdCheck);
		
		// 패스워드 판별
		if(passwd == null || !passwdEncoder.matches(oldPasswd, passwd)) { // 실패
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		} 
		
		System.out.println("새 비밀번호 확인 : " + newPasswdCheck);

		
		// 패스워드 확인이 성공했을 경우
		// 새 패스워드가 존재하면, 해당 패스워드도 암호화(해싱) 수행
		if(newPasswd != null && !newPasswd.isBlank()) {
			if(newPasswd.equals(newPasswdCheck)) {
				newPasswd = passwdEncoder.encode(newPasswd);
			}
		}
		
		System.out.println("새 비밀번호 확인 : " + newPasswdCheck);
		
		// Service 객체의 modifyMemberInfo() 메서드 호출하여 수정 작업 수행
		// => 파라미터 : MemberVO 객체, 새 패스워드    리턴타입 : int(updateCount)
		int updateCount = service.modifyMemberInfo(member, member_id, newPasswd);
		
		// 수정 성공/실패에 따른 포워딩 작업 수행
		if(updateCount > 0) { // 성공
			// 메인페이지로 리다이렉트
			return "redirect:/";
		} else { // 실패
			// "msg" 속성명으로 "수정 실패!" 메세지 전달 후 fail_back 포워딩
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 비밀번호 찾기 이메일 전송
    @PostMapping("/FindPasswdPro.sm")   
    public String searchPwResult(
			@ModelAttribute MemberVO member, // 기본 정보가 저장될 객체 파라미터
			@RequestParam String member_id,
			@RequestParam String member_email, // 기존 패스워드가 저장될 파라미터
			Model model) {
        // DB에 아이디와 이메일 확인 후 일치 시 임시 비밀번호 생성 후 데이터베이스 저장 후 메일 전송
        // DB 아이디 이메일 확인
        // db에서 아이디
    	System.out.println("member_id : " + member_id);
    	System.out.println("member_email : " + member_email);
    	
    	MemberVO findId = service.findSerachId(member);
    	
    	System.out.println("findId : " + findId);
    	
        if( findId != null) {
//        	$10$AI95DeiSmCFtLEzbBmOqpe8fRt1QSYfiRQeYi2Inav1mRgZH9XNQC
//        	$10$17darLw9ivUe1UvBQLwQUO7OmDRAEMAuRskIyqyFB7aT7RGLQRHw6
            //  1. 임시 난수 비밀번호 생성
            String newPasswd = UUID.randomUUID().toString().replaceAll("-", "");
            newPasswd = newPasswd.substring(0, 10);
            String tempPasswd = newPasswd;
            // 임시 패스워드 해싱
    		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
            newPasswd = passwdEncoder.encode(newPasswd);
            //  2. 임시 비밀번호 데이터베이스 업데이트
            member.setMember_passwd(newPasswd);
            service.modifyMemberInfo(member, member.getMember_id(), newPasswd);
            //  3. 메일 전송
            String subject = "[SMALLBOX] 임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + tempPasswd + "입니다.");
            sb.append("로그인 후 비밀번호를 변경하여 사용하세요.");
            
            System.out.println("해쉬 비밀번호 : " + newPasswd);            
            System.out.println("임시 비밀번호 : " + tempPasswd);

            
            try {
                mailService.sendPw(subject, sb.toString(), "tmahfqkrtm@gmail.com",member.getMember_email());
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            model.addAttribute("msg", "일치하는 회원 정보가 없습니다.");
            return "fail_back";
        }
		return "redirect:/";
    }
    
    // 회원탈퇴 기능 구현
    @PostMapping("/MemberDeletePro.sm")
    public String deletePro(
    		HttpSession session,
            @ModelAttribute MemberVO member, // 기본 정보가 저장될 객체 파라미터
            @RequestParam String member_passwd,
            Model model) {
    	
    	System.out.println("member_passwd : " + member_passwd);
    	System.out.println("member.getMember_passwd() : " + member.getMember_passwd());
        // 비밀번호 일치 여부 확인
    	
        String dbPasswd = service.getPasswd(member.getMember_id());
        BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
        if(!passwdEncoder.matches(member_passwd, dbPasswd)) {
            // "msg" 속성명으로 "비밀번호가 일치하지 않습니다." 메세지 전달 후 fail_back 포워딩
            model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "fail_back";
        }
    	
        member.setMember_passwd(dbPasswd);
        int deleteCount = service.removeMember(member);
        
        //2bd0d014b9
        // 탈퇴 성공/실패에 따른 포워딩 작업 수행
        if(deleteCount > 0) { // 성공
        	session.invalidate();
            // 메인페이지로 리다이렉트
            return "redirect:/";
        } else { // 실패
            // "msg" 속성명으로 "탈퇴 실패!" 메세지 전달 후 fail_back 포워딩
            model.addAttribute("msg", "탈퇴 실패!");
            return "fail_back";
        }
    }


    
    
}