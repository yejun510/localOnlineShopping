package com.juji.admin.reply.controller;

import java.io.IOException;

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

import com.juji.admin.board.service.AdminBoardService;
import com.juji.admin.reply.service.AdminReplyService;
import com.juji.admin.reply.vo.ReplyVO;
import com.juji.client.board.vo.BoardVO;
import com.juji.client.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminReplyController {
	private Logger log = LoggerFactory.getLogger(AdminReplyController.class);

	@Autowired
	private AdminReplyService adminReplyService;

	@Autowired
	private AdminBoardService adminBoardService;

	@RequestMapping(value = "/reply/replyWrite.do", method = RequestMethod.GET)
	public String replyWrite(Model model, @ModelAttribute ReplyVO rvo) {
		log.info("replyWrite 호출 성공");

		List<ReplyVO> replyWrite = adminReplyService.replyWrite(rvo);
		
		System.out.println(replyWrite);
		model.addAttribute("replyWrite", replyWrite);
		model.addAttribute("data");

		return "admin/reply/replyWrite";

	}

	// 관리자 답변 등록
	@RequestMapping(value = "/reply/replyInsert.do", method = RequestMethod.POST)
	public String replyInsert(@ModelAttribute ReplyVO rvo, Model model, @ModelAttribute BoardVO bvo, HttpServletRequest request) throws IllegalStateException, IOException{
		log.info("replyInsert 호출 성공");

		rvo.setA_name("주지육림 관리자");
		int result = 0;
		String url = "";
		
		
		if (rvo.getA_file() != null) {
			String a_image = FileUploadUtil.fileUpload(rvo.getA_file(), request, "reply");
			rvo.setA_image(a_image);
		}

		result = adminReplyService.replyInsert(rvo);
		adminBoardService.boardUpdate(bvo);
		
		if (result == 1) {
			url = "/admin/board/boardDetail.do?q_num=" + rvo.getQ_num();
		} else {
			url = "/admin/board/boardDetail.do";
		}
		return "redirect:" + url;

	}

	// 관리자 댓글 삭제
	@RequestMapping(value = "/reply/replyDelete.do", method = RequestMethod.POST)
	public String ReplyDelete(@ModelAttribute ReplyVO rvo, Model model, @ModelAttribute BoardVO bvo,HttpServletRequest request) throws IllegalStateException, IOException{
		log.info("ReplyDelete 호출 성공");
		int cnt;
		int result = 0;
		String url = "";
		
		if(rvo.getA_image()!=null && rvo.getA_image().length() != 0) {
			FileUploadUtil.fileDelete(rvo.getA_image(), request);
		}
		
		result = adminReplyService.replyDelete(rvo);
		cnt = adminReplyService.replyCnt(rvo);
		
		if(cnt == 0) {
			 bvo.setQ_reply("답변 대기");
			 adminBoardService.boardUpdate(bvo);
		}
		
		if (result == 1) {
			url = "/admin/board/boardDetail.do?q_num=" + rvo.getQ_num();
		} else {
			url = "/admin/board/boardDetail.do";
		}
		return "redirect:" + url;

	}
}
