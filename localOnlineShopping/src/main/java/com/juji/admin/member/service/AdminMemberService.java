package com.juji.admin.member.service;

import java.util.List;

import com.juji.client.member.vo.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> memberList(MemberVO mvo);

	public MemberVO memberDetail(MemberVO mvo);

	public int memberListCnt(MemberVO mvo);

}
