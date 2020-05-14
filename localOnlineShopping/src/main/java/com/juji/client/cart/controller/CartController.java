package com.juji.client.cart.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.cart.dao.CartDao;
import com.juji.client.cart.service.CartService;
import com.juji.client.cart.vo.CartVO;
import com.juji.client.delivery.service.DeliveryService;
import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.member.service.MemberService;
import com.juji.client.member.vo.MemberVO;



@Controller

@RequestMapping(value = "/cart")
	public class CartController {
	
	
		@Autowired
		private CartService cartService;
		
		@Autowired
		private DeliveryService deliveryService;
		
		@Autowired
		private MemberService memberService;
	
		//1. 장바구니 넣기
				@RequestMapping (value = "/insert.do",method = RequestMethod.POST)
				public String productInsert(@ModelAttribute CartVO cvo  ,HttpSession session) {
					String id = (String) session.getAttribute("id");
					cvo.setId(id);
					
					// 
					int count = cartService.countCart(cvo);
					if(count == 0) {
						// ��ٱ��� �ֱ�
						cartService.insertCart(cvo);
					}else {
						// ��ٱ��� ����Ʈ ����
						cartService.updateCart(cvo);
						
					}
					return "redirect:/cart/cartList.do";
				}
		//2. 장바구니 리스트
		@RequestMapping(value="/cartList.do",method = RequestMethod.GET)
		public String cartList(HttpSession session, Model model) {
			String id = (String) session.getAttribute("id");
			List<CartVO> cartList = cartService.cartList(id);// ��ٱ��� ����Ʈ
			
			  int sumMoney = cartService.sumMoney(id);// ��ٱ��� ��ǰ ��ü ����
			 			
				
			model.addAttribute("cartList",cartList);
			model.addAttribute("data");
			
			
		return "/cart/cartList";
	}
		//3. 장바구니 삭제
		@RequestMapping("/delete.do")
		public String delete(@ModelAttribute CartVO cvo) {
			cartService.deleteCart(cvo);
			return "redirect:/cart/list.do";
	}

		//파라미터로 seqList(체크박스에서 체크된 input의 value를 String으로 바꿔 url뒤에 보낸 파라미터)
        @RequestMapping("/cartListBuying")
        public ModelAndView Buying(String seqList, HttpServletRequest request,HttpSession session,MemberVO mem){
        	MemberVO member = new MemberVO();
        	String id = (String)session.getAttribute("id");
        	
        	mem.setId(id);
        	
        	member =	memberService.myProfile(mem);
        	
        	Calendar calendar = Calendar.getInstance();
  	      calendar.add(Calendar.DAY_OF_MONTH, +7);
  	      Date date = calendar.getTime();
  	      String minSimple = new SimpleDateFormat("yyyy-MM-dd").format(date);
  	      
  	      Calendar calendar2 = Calendar.getInstance();
  	      calendar2.add(Calendar.DAY_OF_MONTH, +30);
  	      Date maxDate = calendar2.getTime();
  	      String maxSimple = new SimpleDateFormat("yyyy-MM-dd").format(maxDate);
           ModelAndView mv = new ModelAndView();
           List<CartVO> result = new ArrayList<>();
           //seqList가 null이거나 공백이면 (값이 없으면)
           if(seqList == null || seqList.equals("")){
              //...유저계정기준으로 모든 리스트 불러오기
        	   System.out.print("id : " + id);
              result = cartService.cartList(id);
	          //ModelAndView에 담아서 리턴
              if(result == null || result.size() == 0) {
            	  result = null;
              }else {
    	          System.out.println("Test"+result.toString());
              }
             
	          mv.addObject("product", result);
           //seqList에 값이 있으면
           }else{
        	   System.out.println(seqList);
              String[] seqArray = seqList.split(",");
              //...선택된 시퀀스를 기준으로 개별구매리스트 불러오기
              result = cartService.cartSelectList(seqArray);
	          //ModelAndView에 담아서 리턴
              if(result == null || result.size() == 0) {
            	  result = null;
              }
	          mv.addObject("product_list", result);
	          mv.addObject("seqList",seqList);
           }
           mv.addObject("member",member);
           mv.addObject("minSimple",minSimple);
           mv.addObject("maxSimple",maxSimple);
           mv.setViewName("/product/productBuying");
           
           return mv;
        }
		//4. 장바구니상품 구매페이지
		 @RequestMapping( value = "/insertCartBuying", method = RequestMethod.POST)
			public String cartBuying(@ModelAttribute DeliveryVO dvo , HttpSession session,String seqList){
			 	System.out.println("카트 전체 구매");
			 	String id = (String) session.getAttribute("id");
			 	List<CartVO> c_list = cartService.cartList(id);
			 	
			 	System.out.println("결제 방법");
			 	if(dvo.getO_paymethod().equals("무통장 입금")) {
					dvo.setO_status("입금 전");
				}else {
					dvo.setO_status("입금 확인");
				}
			  if(seqList == null || seqList.equals("")) {
			 		 
			 	for(int i=0;i<c_list.size();i++) {
			 //i = p넘버의 배열방 디비에 9개가있으면 p넘버의 배열방은 디비의 p넘버 배열방 갯수보다 작음 배열방 증가값 1씩
			 		dvo.setId(id);
			 		dvo.setP_num(c_list.get(i).getP_num());
			 		dvo.setO_product(c_list.get(i).getC_name());
			 		dvo.setO_quantity(c_list.get(i).getC_quantity());
			 		dvo.setO_price(c_list.get(i).getC_price());
			 		dvo.setO_totalprice(c_list.get(i).getC_totalprice());
			 		dvo.setO_image(c_list.get(i).getC_image());
			 		System.out.println("결제방법 : "+dvo.getO_paymethod());
			 		// 위의 포문으로 i 배열방만큼 넣음
			 		deliveryService.insertDelivery(dvo);
			 	}
			 	 cartService.deleteCartList(id);
			 	 
			 	 }else {
			 		 String[] seqArray = seqList.split(",");
			 		List<CartVO> c_list1 = cartService.cartSelectList(seqArray);
			 		for(int i=0;i<c_list1.size();i++) {
			 			System.out.println("개별구매");
						 //i = p넘버의 배열방 디비에 9개가있으면 p넘버의 배열방은 디비의 p넘버 배열방 갯수보다 작음 배열방 증가값 1씩
						 		dvo.setId(id);
						 		dvo.setP_num(c_list1.get(i).getP_num());
						 		dvo.setO_product(c_list1.get(i).getC_name());
						 		dvo.setO_quantity(c_list1.get(i).getC_quantity());
						 		dvo.setO_price(c_list1.get(i).getC_price());
						 		dvo.setO_totalprice(c_list1.get(i).getC_totalprice());
						 		dvo.setO_image(c_list1.get(i).getC_image());
						 		System.out.println("결제방법 : "+dvo.getO_paymethod());
						 		// 위의 포문으로 i 배열방만큼 넣음
						 		deliveryService.insertDelivery(dvo);
						 	}
			 		 cartService.selectDelete(seqArray);
			 	 }
			 return "redirect:/mypage/mypageOrder"; 
		 }
		 
		 @RequestMapping(value = "/cartDelete")
		 public String deleteCart(String seqList) {
			 String[] seqArray = seqList.split(",");
			 cartService.selectDelete(seqArray);
			 return "redirect:/cart/cartList.do";
		 }

}











