package com.juji.admin.notice.controller;

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

import com.juji.admin.notice.service.AdminNoticeService;
import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.common.page.Paging;
import com.juji.client.notice.vo.NoticeVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value = "/admin")
public class AdminNoticeController {
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);

	@Autowired
	private AdminNoticeService adminNoticeService;

	/* 글 목록 구현하기 */

	@RequestMapping(value = "/notice/noticeList.do", method = RequestMethod.GET)
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

		return "admin/notice/adminNoticeList";
	}

	/* 글 쓰기 페이지로 이동 */

	@RequestMapping(value = "/notice/noticeWrite.do")
	public String adminNoticeWrite() {
		log.info("adminNoticeWrite 호출 성공");
		return "admin/notice/adminNoticeWrite";
	}

	/* 글 쓰기 구현하기 */

	@RequestMapping(value = "/notice/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url = "";
		
		if (nvo.getFile1() != null) {
			String n_image1 = FileUploadUtil.fileUpload(nvo.getFile1(), request, "notice");
			nvo.setN_image1(n_image1);
		}
		
		if (nvo.getFile2() != null) {
			String n_image2 = FileUploadUtil.fileUpload(nvo.getFile2(), request, "notice");
			nvo.setN_image2(n_image2);
		}
		
		if (nvo.getFile3() != null) {
			String n_image3 = FileUploadUtil.fileUpload(nvo.getFile3(), request, "notice");
			nvo.setN_image3(n_image3);
		}

		result = adminNoticeService.noticeInsert(nvo);
		if (result == 1) {
			url = "/admin/notice/noticeList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/admin/notice/noticeWrite.do";
		}

		return "redirect:" + url;

	}

	/* 글 상세보기 구현 */

	@RequestMapping(value = "/notice/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");
		log.info("n_num = " + nvo.getN_num());

		// 조회수 증가
		nvo.setN_view(nvo.getN_view() + 1);
		adminNoticeService.updateViewCnt(nvo.getN_num());

		NoticeVO detail = new NoticeVO();
		detail = adminNoticeService.noticeDetail(nvo);

		if (detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "admin/notice/adminNoticeDetail";

	}

	/* 글 수정 페이지로 이동 */
	@RequestMapping(value = "/notice/updateForm.do")
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("updateForm 호출 성공");

		log.info("n_num = " + nvo.getN_num());

		NoticeVO updateData = new NoticeVO();
		updateData = adminNoticeService.noticeDetail(nvo);

		model.addAttribute("updateData", updateData);

		return "admin/notice/adminNoticeUpdate";

	}

	/* 글 수정 구현하기 */
	@RequestMapping(value = "/notice/noticeUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, HttpServletRequest request) throws IllegalStateException, IOException{
		log.info("noticeUpdate 호출 성공");
			
		System.out.println(nvo.getN_image1()+"<<<이미지1");
		System.out.println(nvo.getN_image2()+"<<<이미지2");
		System.out.println(nvo.getN_image3()+"<<<이미지3");
		
		if(!nvo.getFile1().isEmpty()) {
			log.info("======== file = " + nvo.getFile1().getOriginalFilename());
			if(nvo.getN_image1()!=null && nvo.getN_image1().length() != 0) {
				System.out.println("1");
				FileUploadUtil.fileDelete(nvo.getN_image1(), request);
			}
			 String n_image1 = FileUploadUtil.fileUpload(nvo.getFile1(), request,"notice");
			nvo.setN_image1(n_image1);
		}else {
			log.info("첨부파일 없음");
		}
		
		if(!nvo.getFile2().isEmpty()) {
			log.info("======== file = " + nvo.getFile2().getOriginalFilename());
			if(nvo.getN_image2()!=null && nvo.getN_image2().length() != 0) {
				FileUploadUtil.fileDelete(nvo.getN_image2(), request);
			}
			String n_image2 = FileUploadUtil.fileUpload(nvo.getFile2(), request,"notice");
			nvo.setN_image2(n_image2);
		}else {
			log.info("첨부파일 없음");
		}
		
		if(!nvo.getFile3().isEmpty()) {
			log.info("======== file = " + nvo.getFile3().getOriginalFilename());
			if(nvo.getN_image3()!=null && nvo.getN_image3().length() != 0) {
				FileUploadUtil.fileDelete(nvo.getN_image3(), request);
			}
			String n_image3 = FileUploadUtil.fileUpload(nvo.getFile3(), request,"notice");
			nvo.setN_image3(n_image3);
		}else {
			log.info("첨부파일 없음");
		}
		
		adminNoticeService.noticeUpdate(nvo);
		return "redirect:/admin/notice/noticeDetail.do?n_num=" + nvo.getN_num();

	}

	/* 글 삭제 구현하기 */

	@RequestMapping(value = "/notice/noticeDelete.do", method = RequestMethod.GET)
	public String noticeDelete(@ModelAttribute NoticeVO nvo, HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("noticeDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		System.out.println(nvo.getN_image1());
		System.out.println(nvo.getN_image2());
		System.out.println(nvo.getN_image3());
		
		if(nvo.getN_image1()!=null && nvo.getN_image1().length() != 0) {
			FileUploadUtil.fileDelete(nvo.getN_image1(), request);
		}
		if(nvo.getN_image2()!=null && nvo.getN_image2().length() != 0) {
			FileUploadUtil.fileDelete(nvo.getN_image2(), request);
		}
		if(nvo.getN_image3()!=null && nvo.getN_image3().length() != 0) {
			FileUploadUtil.fileDelete(nvo.getN_image3(), request);
		}

		result = adminNoticeService.noticeDelete(nvo.getN_num());

		if (result == 1) {
			url = "/admin/notice/noticeList.do";
		} else {
			url = "/admin/notice/noticeDetail.do?n_num=" + nvo.getN_num();
		}
		return "redirect:" + url;

	}

}
