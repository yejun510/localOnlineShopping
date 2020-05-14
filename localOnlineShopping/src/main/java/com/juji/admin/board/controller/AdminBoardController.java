package com.juji.admin.board.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.juji.client.common.page.Paging;

/* 컨트롤러 */
@Controller
@RequestMapping(value = "/board")
public class AdminBoardController {
	private Logger log = LoggerFactory.getLogger(AdminBoardController.class);
	@Autowired
	private AdminBoardService adminBoardService;

	@Autowired
	private AdminReplyService adminreplyservice;

	// 글 목록 구현
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, @ModelAttribute BoardVO bvo) {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		int total;
		// 페이징 세팅	
		Paging.setPage(bvo);

		total = adminBoardService.listCnt(bvo);
		System.out.println("total"+total);
		
		if (bvo.getQ_category() != null) {
			if (bvo.getQ_category().equals("환불/반품") || bvo.getQ_category().equals("기타")) {
				boardList = adminBoardService.boardCategory(bvo);
			} else {
				boardList = adminBoardService.boardList(bvo);
			}
		} else {
			boardList = adminBoardService.boardList(bvo);
		}
		
		
		log.info("adminBoardList 호출 성공");
		// 전체 리스트 개수
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("data", bvo);
		model.addAttribute("total",total);
		return "board/adminBoardList";
	}

	// 문의게시판 상세 호출
	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model, @ModelAttribute ReplyVO rvo) {
		log.info("boardDetail 호출 성공");
		log.info("q_num=" + bvo.getQ_num());

		BoardVO detail = new BoardVO();
		detail = adminBoardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		List<ReplyVO> replyWrite = adminreplyservice.replyWrite(rvo);
		model.addAttribute("replyWrite", replyWrite);

		return "board/adminBoardDetail";

	}

}
