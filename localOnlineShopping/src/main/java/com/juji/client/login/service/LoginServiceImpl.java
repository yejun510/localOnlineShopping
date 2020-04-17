package com.juji.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.common.util.BCrypt;
import com.juji.client.common.util.SHA256;
import com.juji.client.login.dao.LoginDao;
import com.juji.client.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao dao;
	
	
	
	@Override
	public LoginVO selectLogin(LoginVO lvo) throws Exception {
		SHA256 sha = SHA256.getInsatnce();
	
		
		
		String passwd = lvo.getPasswd();
	
			String shaPass = sha.getSha256(passwd.getBytes());
			String dbPass = selectHash(lvo.getId());
			if(dbPass != null) { //셀렉트 해쉬가 널이 아닐경우
			if(BCrypt.checkpw(shaPass, dbPass)) {
				System.out.println("비밀번호 일치");
				lvo.setPasswd(dbPass);
			}else {
				System.out.println("비밀번호 불일치"); //비밀번호 틀릴경우
			}	
		}
			return dao.selectLogin(lvo);
	}
	
	@Override
	public String selectHash(String id) {
		return dao.selectHash(id);
	}

}
