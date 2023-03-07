package com.project.Smallbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.MemberMapper;
import com.project.Smallbox.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	// 아이디 DB 존재여부 확인 작업
	public int getIdList(String id) {
		return mapper.checkIdList(id);
	}
	
	// 회원가입 작업
	public int joinMember(MemberVO member) {
		return mapper.insertMember(member);
	}
	
	// 로그인 작업
	public String getPasswd(String id) {
		return mapper.selectPasswd(id);
	}

	// 아이디 찾기
	public MemberVO findId(MemberVO member) {
		return mapper.findId(member);
	}


	// 회원 상세 정보 조회 작업 - getMemberInfo()
	// => 파라미터 : 아이디  리턴타입 : MemberVO
	public MemberVO getMemberInfo(String member_id) {
		return mapper.selectMemberInfo(member_id);
	}

	// 회원 정보 수정 작업
	public int modifyMemberInfo(MemberVO member,String member_id, String newPasswd) {
		return mapper.updateMemberInfo(member,member_id, newPasswd);
	}

	// 비밀번호 찾기시 아이디 호출 작업
	public MemberVO findSerachId(MemberVO member) {
		return mapper.findSerachId(member);
	}

	// 회원탈퇴 작업
	public int removeMember(MemberVO member) {
		return mapper.deleteMember(member);
	}




	
	
	

}
