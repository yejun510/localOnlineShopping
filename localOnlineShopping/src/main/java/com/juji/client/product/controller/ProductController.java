package com.juji.client.product.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.juji.client.delivery.service.DeliveryService;
import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.member.service.MemberService;
import com.juji.client.member.vo.MemberVO;
import com.juji.client.product.service.ProductService;
import com.juji.client.product.vo.ProductVO;
import com.juji.client.review.service.ReviewService;
import com.juji.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value="/product")
public class ProductController {
		
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private DeliveryService deliveryService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	//1-1. 상품리스트
	@RequestMapping(value="/productListBeef.do",method = RequestMethod.GET)
	public String beefList(Model model) {
			
			List<ProductVO> beefList = productService.beefList();
			
			
			
			model.addAttribute("beefList",beefList);
			model.addAttribute("data");
			
			
		return "/product/productListBeef";
	}
	//1-2. 돼지고기 상품 리스트
	@RequestMapping(value ="/productListPork.do",method = RequestMethod.GET)
	public String porkList(Model model) {
		
			List<ProductVO> porkList = productService.porkList();
			
			model.addAttribute("porkList",porkList);
			model.addAttribute("data");
			
		return "/product/productListPork";
	}
	//2. 상품상세페이지
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	public String productBeefDetail (@ModelAttribute ProductVO pvo ,Model model) {
		
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		List<ReviewVO> list = reviewService.reviewList(pvo.getP_num());
		
		
		if(detail != null) {
			detail.setP_detail(detail.getP_detail().toString().replaceAll("\n","<br>"));
		}
		model.addAttribute("detail",detail);
		model.addAttribute("reviewList", list);
		
		return "/product/productDetail";
	}
	//3. 구매페이지
	@RequestMapping("/productBuying")
	public String productBuying(HttpSession session , Model model ,ProductVO pvo,HttpServletRequest req,MemberVO mem) {
		ProductVO pvo2 = new ProductVO(); 
		MemberVO member = new MemberVO();
		String id = (String)session.getAttribute("id");
		mem.setId(id);
		
		Calendar calendar = Calendar.getInstance();
	      calendar.add(Calendar.DAY_OF_MONTH, +7);
	      Date date = calendar.getTime();
	      String minSimple = new SimpleDateFormat("yyyy-MM-dd").format(date);
	      
	      Calendar calendar2 = Calendar.getInstance();
	      calendar2.add(Calendar.DAY_OF_MONTH, +30);
	      Date maxDate = calendar2.getTime();
	      String maxSimple = new SimpleDateFormat("yyyy-MM-dd").format(maxDate);
	   
	      member = memberService.myProfile(mem);
	      
	      pvo2 = productService.productDetail(pvo);
	      
	      model.addAttribute("minSimple",minSimple);
	      model.addAttribute("maxSimple",maxSimple);
		
	    model.addAttribute("member",member);  
		model.addAttribute("p_quantity",req.getParameter("p_quantity"));
		model.addAttribute("product_one",pvo);
		
		return "/product/productBuying";
	}
	
		


	// 4. 구매한 내역 넣기
	 @RequestMapping(value = "/buyingInsert.do", method = RequestMethod.POST )
	 public String buyingInsert(HttpServletRequest request,@ModelAttribute DeliveryVO dvo,HttpSession session) {
		 
		 String result;
		 
		 String id = (String)session.getAttribute("id");
			dvo.setId(id);
			
			if(dvo.getO_paymethod().equals("무통장 입금")) {
				dvo.setO_status("입금 전");
			}else {
				dvo.setO_status("입금 확인");
			}
			
			deliveryService.insertDelivery(dvo);
			

			 result = "/mypage/mypageOrder";
		
		 return "redirect:"+ result;
	 }
	 

}
