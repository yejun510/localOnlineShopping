package com.juji.client.mail.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.juji.client.member.service.MemberService;
import com.juji.client.member.vo.MemberVO;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value = "/sendId", method = {RequestMethod.POST,RequestMethod.GET})
	public int sendMailId(@ModelAttribute MemberVO mvo,HttpServletRequest req) {
		int result = 0;
		
		MemberVO member = new MemberVO();
		
		member = memberService.idSearch(mvo);

		
		if(member != null) {
		
		String setForm = "samm11271@gamil.com";
		String toMail = req.getParameter("email");
		String title = "주지육림 회원 아이디";
		
		String content = "회원님의 아이디는[" + member.getId() + "]입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			 messageHelper.setFrom(setForm);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(toMail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		    mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
			result = 1;
		}else {
			result = 0;		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendPass", method = {RequestMethod.POST,RequestMethod.GET})
	public int sendMailPasswd(@ModelAttribute MemberVO mvo, HttpServletRequest req) {
		int result = 0;
		String passwd = (int)(Math.random()*1000000)+"";
		
		
		mvo.setPasswd(passwd);
		try {
			memberService.temporaryPasswd(mvo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		
		MemberVO member = memberService.passwdSearch(mvo);
		

		if(member != null) {
		
		String setForm = "samm11271@gamil.com";
		String toMail = req.getParameter("email");
		String title = "주지육림 회원 비밀번호";
		
		String content = "회원님의 비밀번호는[" + passwd + "]입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			 messageHelper.setFrom(setForm);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(toMail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		    mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
			result = 1;
		}
		return result;
	}
}

























