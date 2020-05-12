package com.juji.admin.notice.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juji.admin.notice.service.AdminNoticeService;
import com.juji.client.common.page.Paging;
import com.juji.client.notice.vo.NoticeVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value = "/notice")
public class AdminNoticeController {
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);

	@Autowired
	private AdminNoticeService adminNoticeService;

	/* 글 목록 구현하기 */

	@RequestMapping(value = "/noticeList.do", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noitceList 호출 성공");

		
		int total;
		// 페이징 세팅
		nvo.setPageSize("5");
		Paging.setPage(nvo);
		List<NoticeVO> adminNoticeList = adminNoticeService.noticeList(nvo);	
		System.out.println("시작 "+nvo.getStart_row());
		System.out.println("끝   "+ nvo.getEnd_row());
		
		
		total = adminNoticeService.listCnt(nvo);
		model.addAttribute("noticeList", adminNoticeList);
		model.addAttribute("data",nvo);
		model.addAttribute("total", total);

		return "notice/adminNoticeList";
	}

	/* 글 쓰기 페이지로 이동 */

	@RequestMapping(value = "/noticeWrite.do")
	public String adminNoticeWrite() {
		log.info("adminNoticeWrite 호출 성공");
		return "notice/adminNoticeWrite";

	}

	/* 글 쓰기 구현하기 */

	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url = "";

		result = adminNoticeService.noticeInsert(nvo);
		if (result == 1) {
			url = "/notice/noticeList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/notice/noticeWrite.do";
		}

		return "redirect:" + url;

	}

	/* 글 상세보기 구현 */

	@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");
		log.info("n_num=" + nvo.getN_num());

		// 조회수 증가
		nvo.setN_view(nvo.getN_view() + 1);
		adminNoticeService.updateViewCnt(nvo.getN_num());

		NoticeVO detail = new NoticeVO();
		detail = adminNoticeService.noticeDetail(nvo);

		if (detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "notice/adminNoticeDetail";

	}

	/* 글 수정 페이지로 이동 */

	/*
	 * @param : n_num
	 * 
	 * @return : notiveVO
	 */

	@RequestMapping(value = "/updateForm.do")
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("updateForm 호출 성공");

		log.info("n_num=" + nvo.getN_num());

		NoticeVO updateData = new NoticeVO();
		updateData = adminNoticeService.noticeDetail(nvo);

		model.addAttribute("updateData", updateData);

		return "notice/adminNoticeUpdate";

	}

	/* 글 수정 구현하기 */

	@RequestMapping(value = "/noticeUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeUpdate(@ModelAttribute NoticeVO nvo) {
		log.info("noticeUpdate 호출 성공");

		adminNoticeService.noticeUpdate(nvo);
		return "redirect:/notice/noticeDetail.do?n_num=" + nvo.getN_num();

	}

	/* 글 삭제 구현하기 */

	/* @throws IOException */

	@RequestMapping(value = "/noticeDelete.do", method = RequestMethod.GET)
	public String noticeDelete(@ModelAttribute NoticeVO nvo) {
		log.info("boardDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		result = adminNoticeService.noticeDelete(nvo.getN_num());

		if (result == 1) {
			url = "/notice/noticeList.do";
		} else {
			url = "/notice/noticeDetail.do?n_num=" + nvo.getN_num();
		}
		return "redirect:" + url;

	}

}
