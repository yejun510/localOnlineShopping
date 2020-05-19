package com.juji.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juji.admin.member.service.AdminMemberService;
import com.juji.client.common.page.Paging;
import com.juji.client.common.util.Util;
import com.juji.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminMemberController {
	private Logger log = LoggerFactory.getLogger(AdminMemberController.class);

	@Autowired
	private AdminMemberService adminMemberService;

	// 회원목록 구현하기
	@RequestMapping(value = "/member/memberList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberList(@ModelAttribute MemberVO mvo, Model model) {
		log.info("memberList 호출 성공");

		// 페이지 세팅
		Paging.setPage(mvo);

		// 전체 레코드수 구현
		int total = adminMemberService.memberListCnt(mvo);
		log.info("total = " + total);

		// 번호 재설정
		int count = total - (Util.nvl(mvo.getPage()) - 1) * Util.nvl(mvo.getPageSize());
		log.info("count = " + count);

		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", mvo);

		return "admin/member/memberList";
	}

	// 회원 상세보기 구현
	@RequestMapping(value = "/member/memberDetail.do", method = RequestMethod.GET)
	public String memberDetail(@ModelAttribute MemberVO mvo, Model model) {
		log.info("memberDetail 호출 성공");
		log.info("id = " + mvo.getId());

		MemberVO detail = new MemberVO();
		detail = adminMemberService.memberDetail(mvo);

		detail.setPage(mvo.getPage());
		detail.setPageSize(mvo.getPageSize());

		model.addAttribute("detail", detail);

		return "admin/member/memberDetail";
	}

}
