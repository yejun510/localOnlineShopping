package com.juji.client.login.dao;

import org.springframework.stereotype.Repository;

import com.juji.client.login.vo.LoginVO;

@Repository
public interface LoginDao {
	
	public LoginVO selectLogin(LoginVO lvo);
	public String selectHash(String id);
}
