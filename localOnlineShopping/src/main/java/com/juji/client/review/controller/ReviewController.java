package com.juji.client.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.cart.vo.CartVO;
import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.product.vo.ProductVO;
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


		return "redirect:/product/productDetail.do?p_num="+rvo.getP_num();
	}
	
	@RequestMapping(value = "/reviewUpdateForm", method=RequestMethod.GET)
	public String reviewUpdateForm(@ModelAttribute ReviewVO rvo, Model model) {
		
		ReviewVO review = new ReviewVO();
		review = reviewservice.reviewUpdateForm(rvo.getR_num());
		model.addAttribute("review",review);
		
		return "/review/reviewUpdate";
	}
	
	@RequestMapping(value = "/reviewUpdate", method = {RequestMethod.POST,RequestMethod.GET})
	public String reivewUpdate(@ModelAttribute ReviewVO rvo,HttpServletRequest req) throws IOException {
		log.info("리뷰수정");
		System.out.println(rvo.getR_num()+"<<<넘버");
		System.out.println(rvo.getR_file()+"<<파일");
		System.out.println(rvo.getR_image()+"<<이미지");
		System.out.println(rvo.getR_content()+"<<<내용");
		System.out.println(req.getParameter("r_num")+"리퀘스트 넘");
		System.out.println(req.getParameter("r_content")+"리퀘스트 내용");
		
	      if(!rvo.getR_file().isEmpty()) {
	          if(rvo.getR_image() != null && rvo.getR_image().length() != 0) {
	             FileUploadUtil.fileDelete(rvo.getR_image(), req);
	             rvo.setR_image(null);
	          }
	             String file1 = FileUploadUtil.fileUpload(rvo.getR_file(),req,"review");
	             rvo.setR_image(file1);
	       }
	   
					reviewservice.reviewUpdate(rvo);
		
			return "redirect:/product/productDetail.do?p_num="+rvo.getP_num();
		
		}
	
	@RequestMapping(value = "/reviewDelete",method = RequestMethod.POST)
	public String reviewDelete(@ModelAttribute ReviewVO rvo,HttpServletRequest req) throws IOException {
		System.out.println(rvo.getR_image()+"<<이미지 파일명");
		System.out.println(rvo.getP_num()+"<<<상품 번호");
		System.out.println(rvo.getR_num()+"<<<<댓글 번호");
		if(rvo.getR_image() != null && rvo.getR_image().length() != 0) {
			System.out.println("파일 삭제");
			FileUploadUtil.fileDelete(rvo.getR_image(), req);
		}
		
		reviewservice.reviewDelete(rvo.getR_num());
		return "redirect:/product/productDetail.do?p_num="+rvo.getP_num();
	}



	
}
