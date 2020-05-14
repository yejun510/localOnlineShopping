package com.juji.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.member.vo.MemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSession session;

	// 회원목록
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		return session.selectList("memberList");
	}

	// 회원상세
	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		return (MemberVO) session.selectOne("memberDetail", mvo);
	}

	// 회원전체 레코드
	@Override
	public int memberListCnt(MemberVO mvo) {
		return (Integer) session.selectOne("memberListCnt");
	}

}
