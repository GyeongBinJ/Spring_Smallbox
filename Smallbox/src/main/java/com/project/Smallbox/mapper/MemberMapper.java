package com.project.Smallbox.mapper;

import org.apache.ibatis.annotations.Param;

import com.project.Smallbox.vo.MemberVO;

public interface MemberMapper {

	// 아이디 DB 존재여부 확인작업
	public int checkIdList(String id);

	// 회원가입 작업
	public int insertMember(MemberVO member);

	// 로그인 작업
	public String selectPasswd(String id);

	// 아이디 찾기 작업
	public MemberVO findId(MemberVO member);

	// 회원 상세정보 조회
	public MemberVO selectMemberInfo(String member_id);

	// 회원정보 수정작업
	public int updateMemberInfo(
			@Param("member") MemberVO member,
			@Param("member_id") String member_id,
			@Param("newPasswd") String newPasswd);

	// 비밀번호 찾기시 아이디 호출 작업
	public MemberVO findSerachId(MemberVO member);

	// 회원탈퇴 작업
	public int deleteMember(MemberVO member);



}
