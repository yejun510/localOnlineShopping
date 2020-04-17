package com.juji.client.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.juji.client.login.service.LoginService;
import com.juji.client.login.vo.LoginVO;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	private LoginService loginservice;
	
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/loginForm",method = RequestMethod.GET)
	public String loginForm() {
		log.info("로그인 페이지");
	
		return "/login/login";
	}
	
	//로그인 처리 메소드
	@ResponseBody
	@RequestMapping(value = "/loginSelect",method = {RequestMethod.GET,RequestMethod.POST})
	public int selectLogin(@ModelAttribute LoginVO lvo, HttpSession session) {
		
		int result = 0;
		
		LoginVO list = new LoginVO();
		
		try {
			list = loginservice.selectLogin(lvo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(list == null) {
			result = 0;
		}else {
			result = 1;
		}
		
		
		
		if(result == 1) {
			session.setAttribute("id", list.getId());
		}
		
		return result;
		
		
	}
	//로그아웃 처리 메소드
	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//아이디 비밀번호 찾기 페이지 메소드
	@RequestMapping(value = "/find")
	public String findPage() {
		log.info("아이디/비밀번호 찾기 페이지");
		return "/login/find";
	}
}




























