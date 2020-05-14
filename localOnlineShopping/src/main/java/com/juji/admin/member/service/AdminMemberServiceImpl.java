package com.juji.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.member.dao.AdminMemberDao;
import com.juji.client.member.vo.MemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMemberDao;

	// 회원목록 구현
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> mList = null;

		// 정렬에 대한 기본값 설정
		if (mvo.getOrder_by() == null)
			mvo.setOrder_by("id");
		if (mvo.getOrder_sc() == null)
			mvo.setOrder_sc("DESC");

		mList = adminMemberDao.memberList(mvo);
		return mList;
	}

	@Override
	public int memberListCnt(MemberVO mvo) {
		return adminMemberDao.memberListCnt(mvo);
	}

	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		MemberVO detail = null;
		detail = adminMemberDao.memberDetail(mvo);
		return detail;
	}

}
