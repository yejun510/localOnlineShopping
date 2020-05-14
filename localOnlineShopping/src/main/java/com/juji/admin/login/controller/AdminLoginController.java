package com.juji.admin.login.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin")
public class AdminLoginController {
	private Logger log = LoggerFactory.getLogger(AdminLoginController.class);

	// 로그인 화면 보여주기 위한 메소드
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
	public String login() {
		log.info("loginPage.do get호출 성공");
		return "login";
	}

	// 로그인 판단 메소드
	@ResponseBody
	@RequestMapping(value = "/loginCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public int loginS(HttpServletRequest req, HttpSession session) {
		int result = 0;

		String id = req.getParameter("adminId");
		String passwd = req.getParameter("adminPass");
		if (id.equals("admin") && passwd.equals("1234")) {
			result = 1;
			session.setAttribute("id", id);
		}
		return result;
	}

	// 로그아웃 처리 메소드
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "login";
	}
}
