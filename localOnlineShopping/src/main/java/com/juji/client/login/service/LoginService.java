package com.juji.client.login.service;

import com.juji.client.login.vo.LoginVO;

public interface LoginService {

	public LoginVO selectLogin(LoginVO lvo) throws Exception;
	public String selectHash(String id);
}
