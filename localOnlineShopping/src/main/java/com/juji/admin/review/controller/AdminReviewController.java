package com.juji.admin.review.controller;
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

import com.juji.admin.review.service.AdminReviewService;
import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminReviewController {
	private Logger log = LoggerFactory.getLogger(AdminReviewController.class);
	
	@Autowired
	private AdminReviewService adminReviewService;
	
	/* 후기목록 구현하기 */
	@RequestMapping(value = "/review/reviewList.do", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute ReviewVO rvo, Model model) {
		log.info("reviewList 호출 성공");
		
		List<ReviewVO> reviewList = adminReviewService.reviewList(rvo);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("data", rvo);
		
		return "admin/review/reviewList";
	}
	
	/* 후기삭제 구현하기 */
	@RequestMapping(value = "/review/reviewDelete.do", method = RequestMethod.GET)
	public String reviewDelete(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws IOException{
		log.info("reviewDelete 호출 성공");
		
		System.out.println(rvo.getR_image());
		
		if(rvo.getR_image() != null && rvo.getR_image().length() != 0) {
			FileUploadUtil.fileDelete(rvo.getR_image(), request);
		}
		
		adminReviewService.reviewDelete(rvo.getR_num());
		
		return "redirect: /admin/review/reviewList.do";
	}

}
