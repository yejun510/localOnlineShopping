package com.juji.client.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juji.client.common.page.Paging;
import com.juji.client.notice.service.NoticeService;
import com.juji.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {

			
		private Logger log = LoggerFactory.getLogger(NoticeController.class);
		
		@Autowired
		private NoticeService noticeService;
		
		//1. ��ǰ����Ʈ
		@RequestMapping(value="/noticeList.do",method = RequestMethod.GET)
		public String noticeList(Model model,@ModelAttribute NoticeVO nvo) {
				log.info("noticeList Starting");
				int total;
				//페이지 세팅
				
				Paging.setPage(nvo);
				total = noticeService.noticeCnt();
			
				List<NoticeVO> noticeList = noticeService.noticeList(nvo);
				
				
				model.addAttribute("noticeList",noticeList);
				model.addAttribute("total",total);
				model.addAttribute("nvo",nvo);
				
				
			return "/notice/noticeList";
		}
		//2. ��ǰ��������
		@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
		public String noticeDetail (@ModelAttribute NoticeVO nvo ,Model model) {
			log.info("noticeDetail Starting");

			noticeService.noticeView(nvo.getN_num());
			
			NoticeVO noticeDetail = new NoticeVO();
			noticeDetail = noticeService.noticeDetail(nvo);
			noticeDetail.setPage(nvo.getPage());
			model.addAttribute("noticeDetail",noticeDetail);
			
			return "/notice/noticeDetail";
		}

}
