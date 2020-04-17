package com.juji.client.member.dao;

import com.juji.client.member.vo.MemberVO;

public interface MemberDao {
	
	//회원가입
	public void insertMember(MemberVO mvo);
	//아이디 중복 체크
	public MemberVO idCheck(String id);
	//휴대폰 번호 중복체크
	public MemberVO telCheck(String tel);
	//이메일 중복 체크
	public MemberVO emailCheck(String email);
	//아이디 찾기
	public MemberVO idSearch(MemberVO mvo);
	//비밀번호 찾기
	public MemberVO passwdSearch(MemberVO mvo);
	//임시 비밀번호로 수정
	public void temporaryPasswd(MemberVO mvo);
	//내 정보
	public MemberVO myProfile(MemberVO mvo);
	//내 정보 수정
	public void modifyProfile(MemberVO mvo);
	//내 배송지 관리
	public MemberVO addressInfo(MemberVO mvo);
	//배송지 수정
	public void addressModify(MemberVO mvo);
	
}
