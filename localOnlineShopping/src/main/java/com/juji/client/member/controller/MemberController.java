package com.juji.client.member.controller;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.member.controller.MemberController;
import com.juji.client.member.service.MemberService;
import com.juji.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	//회원가입 페이지 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		log.info("회원가입 페이지");
		return "/member/join";
	}
	
	//회원가입 처리 겟 방식
	@RequestMapping(value = "/insertMember",method = RequestMethod.GET)
	public void getInsertMember() {
		log.info("회원가입 성공");
	}
	
	//회원 가입 처리 포스트 방식
	@RequestMapping(value = "/insertMember",method = RequestMethod.POST)
	public String insertMember(@ModelAttribute MemberVO mvo) {
		log.info("회원가입 성공");
		
		
		try {
			memberService.insertMember(mvo);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
		
		return "redirect:/login/loginForm";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck",method = {RequestMethod.GET,RequestMethod.POST})
	public int checkId(HttpServletRequest req) {
		log.info("아이디 중복 체크");
		int result = 0;
		
		String id = req.getParameter("id");
		
		
		
		MemberVO idCheck = memberService.idCheck(id);
		
			
		
		if(idCheck != null) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		
		return result;
	}
	
	
	//휴대폰 번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "/telCheck",method = {RequestMethod.GET,RequestMethod.POST})
	public int checkTel(@RequestParam(value = "tel", required = false) String tel) {
		int result = 0;
		
		MemberVO telCheck = memberService.telCheck(tel);
		
		if(telCheck != null) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
		
	}
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck",method = {RequestMethod.GET,RequestMethod.POST})
	public int checkEmail(@ModelAttribute MemberVO mvo,HttpServletRequest req) {
		int result = 0;
		
		String email = req.getParameter("email");
		
		MemberVO member = memberService.emailCheck(email);
		
		if(member != null) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
}























