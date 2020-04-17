package com.juji.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.member.vo.MemberVO;

public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertMember(MemberVO mvo) {
		session.insert("memberInsert",mvo);
	}
	
	@Override
	public MemberVO idCheck(String id) {
		return session.selectOne("idCheck",id);
	}
	
	@Override
	public MemberVO telCheck(String tel) {
		return session.selectOne("telCheck",tel);
	}
	
	@Override
	public MemberVO emailCheck(String email) {
		return session.selectOne("emailCheck",email);
	}
	
	@Override
	public MemberVO idSearch(MemberVO mvo) {
		return session.selectOne("idSearch",mvo);
	}
	
	@Override
	public MemberVO passwdSearch(MemberVO mvo) {
		return session.selectOne("passwdSearch",mvo);
	}
	
	@Override
	public void temporaryPasswd(MemberVO mvo) {
		session.update("temporaryPasswd",mvo);
	}
	
	@Override
	public MemberVO myProfile(MemberVO mvo) {
		return session.selectOne("myProfile",mvo);
	}
	
	@Override
	public void modifyProfile(MemberVO mvo) {
		session.update("modifyProfile",mvo);
	}
	
	@Override
	public MemberVO addressInfo(MemberVO mvo) {
		return session.selectOne("addressInfo",mvo);
	}
	
	@Override
	public void addressModify(MemberVO mvo) {
		session.update("addressModify",mvo);
	}

}



















