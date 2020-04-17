package com.juji.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.login.vo.LoginVO;

public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	SqlSession session;
	
	@Override
	public LoginVO selectLogin(LoginVO lvo) {
		return session.selectOne("selectLogin",lvo);
	}
	
	@Override
	public String selectHash(String id) {
		return session.selectOne("selectHash",id);
	}

}
