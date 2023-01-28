package com.project.Smallbox.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.Smallbox.service.LoginService;
import com.project.Smallbox.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	
	@GetMapping(value = "/MemberLoginForm.sm")
	public String login() {
		return "member/login";
	}
	
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
		
	}
	
	@GetMapping(value = "/MemberLogout.sm")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
