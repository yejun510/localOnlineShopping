package com.juji.client.review.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.review.service.ReviewService;
import com.juji.client.review.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	private Logger log = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewservice;

	// 리뷰 작성
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String writeReview(@ModelAttribute ReviewVO rvo, HttpSession session,HttpServletRequest req) throws IOException {
		log.info("리뷰작성");

		System.out.println(rvo.getR_file());
		
		
		  if(!rvo.getR_file().isEmpty()) {
			  String file = FileUploadUtil.fileUpload(rvo.getR_file(),req,"review"); rvo.setR_image(file);
		  }
		 
		 
		
		rvo.setId((String) session.getAttribute("id"));
		
		
		
		reviewservice.writeReview(rvo);


		return "redirect:/mypage/mypageOrder";
	}


}
