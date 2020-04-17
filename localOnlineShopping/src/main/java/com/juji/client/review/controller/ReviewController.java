package com.juji.client.review.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.review.service.ReviewService;
import com.juji.client.review.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	private Logger log = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewservice;

	// 리뷰 작성
	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String writeReview(@ModelAttribute ReviewVO rvo, HttpSession session) {
		log.info("리뷰작성");

		
		rvo.setId((String) session.getAttribute("id"));
		rvo.setP_num("100a");
		rvo.setO_serialnum(1);
		
		reviewservice.writeReview(rvo);


		return "redirect:/mypage/mypageOrder";
	}


}
