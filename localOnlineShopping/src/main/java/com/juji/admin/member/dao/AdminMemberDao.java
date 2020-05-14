package com.juji.admin.member.dao;

import java.util.List;

import com.juji.client.member.vo.MemberVO;

public interface AdminMemberDao {

	public List<MemberVO> memberList(MemberVO mvo);

	public int memberListCnt(MemberVO mvo);

	public MemberVO memberDetail(MemberVO mvo);

}
