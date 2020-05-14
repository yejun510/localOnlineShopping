package com.juji.client.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.board.service.BoardService;
import com.juji.client.board.vo.BoardVO;
import com.juji.client.common.page.Paging;
import com.juji.client.delivery.service.DeliveryService;
import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.member.service.MemberService;
import com.juji.client.member.vo.MemberVO;
import com.juji.client.review.service.ReviewService;
import com.juji.client.review.vo.ReviewVO;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private DeliveryService deliveryservice;
	
	@Autowired
	private ReviewService reviewservice;
	
	@Autowired
	private BoardService boardservice;
	
	
	
	//마이 페이지 
	@RequestMapping(value = "/mypage",method = RequestMethod.GET)
	public String MyPage() {
		log.info("MYPAGE 페이지");
		return "/mypage/mypage";
	}
	
	//PROFILE 페이지
	@RequestMapping(value = "/mypageMyInfo",method = RequestMethod.GET)
	public ModelAndView myProfile(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("PROFILE 페이지");
		
		String id = (String) session.getAttribute("id");
		
		mvo.setId(id);
		memberservice.myProfile(mvo);
		
		MemberVO member = memberservice.myProfile(mvo);
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("member",member);
		model.setViewName("/mypage/mypageMyInfo");
		
		return model;
	}
	
	//내 정보 수정 페이지
	@RequestMapping(value = "/mypageMyInfoUpdate", method = RequestMethod.GET)
	public ModelAndView myProfileUpdate(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("내 정보 수정 페이지");
		String id = (String) session.getAttribute("id");
		
		mvo.setId(id);
		
		
		MemberVO member = memberservice.myProfile(mvo);
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("member",member);
		model.setViewName("/mypage/mypageMyInfoUpdate");
		
		return model;
	}
	
	//내 정보 수정 메소드
	@RequestMapping(value = "/modify", method = {RequestMethod.GET,RequestMethod.POST})
	public String modifyProfile(@ModelAttribute MemberVO mvo, HttpSession session, HttpServletRequest req) {
		log.info("회원 정보 수정");
		
		
		String id = (String)session.getAttribute("id");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String passwd = req.getParameter("passwd");
		
		
		mvo.setId(id);
		mvo.setPasswd(passwd);
		mvo.setName(name);
		mvo.setTel(tel);
		mvo.setAddress(address);
		
		
		try {
			memberservice.modifyProfile(mvo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/mypage/mypageMyInfo";
	}
	
	//내 배송지 정보
	@RequestMapping(value = "/mypageAddress", method = RequestMethod.GET)
	public ModelAndView address(@ModelAttribute MemberVO mvo,HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		mvo.setId((String)session.getAttribute("id"));
		
		MemberVO member = memberservice.addressInfo(mvo);
		
		if(member != null) {
			
		
		model.addObject("member",member);
		
		}
		model.setViewName("/mypage/mypageAddress");
		return model;
	}
	
	//내 배송지 수정페이지
	@RequestMapping(value = "/mypageAddressUpdate", method = RequestMethod.GET)
	public ModelAndView addressModify(@ModelAttribute MemberVO mvo,HttpSession session) {
		ModelAndView model = new ModelAndView();
		mvo.setId((String)session.getAttribute("id"));
		
		MemberVO member = memberservice.addressInfo(mvo);
		
		if(member != null) {
			
			
			model.addObject("member",member);
		
		}
		model.setViewName("/mypage/mypageAddressUpdate");
		return model;
	}
	
	//배송지 수정하기 메소드
	@RequestMapping(value = "/modifyAddress", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateAddress(@ModelAttribute MemberVO mvo,HttpServletRequest req, HttpSession session) {
		ModelAndView model = new ModelAndView();
		mvo.setId((String)session.getAttribute("id"));
		
		memberservice.addressModify(mvo);
		
		MemberVO member = memberservice.addressInfo(mvo);
		
		if(member != null) {
			model.addObject("member",member);
			
		}
		model.setViewName("/mypage/mypageAddress");
		
		return model;
	}
	
	//나의 게시글 리스트
	@RequestMapping(value = "/mypagePost", method = RequestMethod.GET)
	public ModelAndView myPost(@ModelAttribute BoardVO bvo,HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		
		bvo.setId(id);
		
		int total;
		//페이지 세팅
		
		Paging.setPage(bvo);
		
		System.out.println(bvo.getQ_category());
		
		if(bvo.getQ_category() != null) {
		
		if(bvo.getQ_category().equals("기타") || bvo.getQ_category().equals("환불/반품")) {
					total = boardservice.myEctCnt(bvo);
		} else {
			total = boardservice.myBoardListCnt(bvo);	
			}
		}else {
			total = boardservice.myBoardListCnt(bvo);
		}
		System.out.println("전체 레코드 수"+total);
		
		List<BoardVO> list = boardservice.myBoardList(bvo);
		
		
		model.addObject("boardList",list);
		model.addObject("total",total);
		model.addObject("bvo",bvo);
		model.setViewName("/mypage/mypagePost");
		return model;
	}
	
	//주문 내역 조회 페이지
	@RequestMapping(value = "/mypageOrder",method = RequestMethod.GET)
	public ModelAndView myOrderList(HttpSession session,HttpServletRequest req) {
		ModelAndView model = new ModelAndView();
		
		String id =(String)session.getAttribute("id");
		
		List<DeliveryVO> list = deliveryservice.listDelivery(id);
		
		model.addObject("list",list);
		
		req.setAttribute("id", id);
		
		model.setViewName("/mypage/mypageOrder");
		return model;
	}
	
	//리뷰 작성 페이지
	@RequestMapping(value = "/mypageReview",method = RequestMethod.GET)
	public ModelAndView writeReviewForm(@ModelAttribute DeliveryVO dvo) {
		ModelAndView model = new ModelAndView();
		
		
		
		ReviewVO review = new ReviewVO();
		review.setO_serialnum(dvo.getO_serialnum());
		review.setP_num(dvo.getP_num());
		
		model.addObject("review",review);
		
		model.setViewName("/mypage/mypageReview");
		return model;
	}
	
	//이미 작성한 리뷰 페이지
	@ResponseBody
	@RequestMapping(value = "/searchReview",method = RequestMethod.GET)
	public int searchReview(@ModelAttribute DeliveryVO dvo) {
		int result;
		
		if(reviewservice.searchNum(dvo.getO_serialnum()) == null) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	
	//주문 취소	
	@RequestMapping(value = "/deleteOrder",method = RequestMethod.POST)
	public String deleteOrder(@RequestParam(value = "o_serialnum") int o_serialnum) { 
		
		 
		deliveryservice.deleteDelivery(o_serialnum);
		
		return "redirect:/mypage/mypageOrder";
	}
	
	//구매 확정					
	@RequestMapping(value = "/buyOrder", method = {RequestMethod.POST,RequestMethod.GET})
	public String buyDelivery(DeliveryVO dvo) {
		
		deliveryservice.buyDelivery(dvo);
		
		return "redirect:/mypage/mypageOrder";
	}
	
	
		
}




















