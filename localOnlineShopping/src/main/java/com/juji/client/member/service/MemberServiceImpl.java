package com.juji.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.common.util.BCrypt;
import com.juji.client.common.util.SHA256;
import com.juji.client.member.dao.MemberDao;
import com.juji.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public void insertMember(MemberVO mvo) throws Exception {
		SHA256 sha = SHA256.getInsatnce();
		String Passwd = mvo.getPasswd();
		
		String shaPass = sha.getSha256(Passwd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setPasswd(bcPass);
		
		
		dao.insertMember(mvo);
	}
	
	@Override
	public MemberVO idCheck(String id) {
		return dao.idCheck(id);
	}
	
	@Override
	public MemberVO telCheck(String tel) {
		return dao.telCheck(tel);
	}
	
	@Override
	public MemberVO emailCheck(String email) {
		return dao.emailCheck(email);
	}
	
	@Override
	public MemberVO idSearch(MemberVO mvo) {
		return dao.idSearch(mvo);
	}
	
	@Override
	public MemberVO passwdSearch(MemberVO mvo) {
		return dao.passwdSearch(mvo);
	}
	
	@Override
	public void temporaryPasswd(MemberVO mvo) throws Exception {
		
		SHA256 sha = SHA256.getInsatnce();
		String Passwd = mvo.getPasswd();
		String shaPass = sha.getSha256(Passwd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setPasswd(bcPass);
		dao.temporaryPasswd(mvo);
	}
	
	@Override
	public MemberVO myProfile(MemberVO mvo) {
		return dao.myProfile(mvo);
	}
	
	@Override
	public void modifyProfile(MemberVO mvo) throws Exception {
		SHA256 sha = SHA256.getInsatnce();
		String orgPasswd = mvo.getPasswd();
		
		String shaPass = sha.getSha256(orgPasswd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setPasswd(bcPass);
		dao.modifyProfile(mvo);
	}
	
	@Override
	public MemberVO addressInfo(MemberVO mvo) {
		return dao.addressInfo(mvo);
	}
	
	@Override
	public void addressModify(MemberVO mvo) {
		dao.addressModify(mvo);
	}

}

















