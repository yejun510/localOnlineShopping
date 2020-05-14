package com.juji.admin.product.controller;

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

import com.juji.admin.product.service.AdminProductService;
import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.common.page.Paging;
import com.juji.client.common.util.Util;
import com.juji.client.product.vo.ProductVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminProductController {
	private Logger log = LoggerFactory.getLogger(AdminProductController.class);

	@Autowired
	private AdminProductService adminProductService;

	// 상품목록 구현하기
	@RequestMapping(value = "/product/productList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productList 호출 성공");

		// 페이지 세팅
		Paging.setPage(pvo);

		// 전체 레코드수 구현
		int total = adminProductService.productListCnt(pvo);
		log.info("total = " + total);

		// 상품번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		log.info("count = " + count);

		List<ProductVO> productList = adminProductService.productList(pvo);
		model.addAttribute("productList", productList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);

		return "admin/product/productList";
	}

	// 상품 등록 폼 출력하기
	@RequestMapping(value = "/product/registForm.do")
	public String registForm() {
		log.info("registForm 호출 성공");
		return "admin/product/registForm";
	}

	// 상품등록 구현하기
	@RequestMapping(value = "/product/productRegist.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String productRegist(@ModelAttribute ProductVO pvo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("productRegist 호출 성공");

		// 확인 후 주석 처리
		log.info("fileName : " + pvo.getFile().getOriginalFilename());
		log.info("p_name : " + pvo.getP_name());

		int result = 0;
		String url = "";

		if (pvo.getFile() != null) {
			String p_file = FileUploadUtil.fileUpload(pvo.getFile(), request, "product");
			pvo.setP_file(p_file);
		}

		result = adminProductService.productRegist(pvo);
		if (result == 1) {
			url = "/admin/product/productList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/admin/product/productRegist.do";
		}
		return "redirect:" + url;
	}

	// 상품 상세보기 구현
	@RequestMapping(value = "/product/productDetail.do", method = RequestMethod.GET)
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		log.info("p_name = " + pvo.getP_name());

		ProductVO detail = new ProductVO();
		detail = adminProductService.productDetail(pvo);

		if (detail != null) {
			detail.setP_detail(detail.getP_detail().toString().replaceAll("\n", "<br>"));
		}
		
		detail.setPage(pvo.getPage());
		detail.setPageSize(pvo.getPageSize());
		
		model.addAttribute("detail", detail);

		return "admin/product/productDetail";
	}

	// 상품정보 수정 폼 출력하기
	@RequestMapping(value = "/product/updateForm.do")
	public String updateForm(@ModelAttribute ProductVO pvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("p_num = " + pvo.getP_num());

		ProductVO updateData = new ProductVO();
		updateData = adminProductService.productDetail(pvo);

		model.addAttribute("updateData", updateData);
		return "admin/product/updateForm";
	}

	// 상품정보 수정 구현하기
	@RequestMapping(value = "/product/productUpdate.do", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO pvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("productUpdate 호출 성공");

		int result = 0;
		String url = "";
		String p_file = "";
		
		if(!pvo.getFile().isEmpty()) {
			log.info("======== file = " + pvo.getFile().getOriginalFilename());
			if(pvo.getP_file()!= null && pvo.getP_file().length() !=0) {
				FileUploadUtil.fileDelete(pvo.getP_file(), request);
			}
			p_file = FileUploadUtil.fileUpload(pvo.getFile(), request,"product");
			pvo.setP_file(p_file);
		}else {
			log.info("첨부파일 없음");
			pvo.setP_file("");
		}
		log.info("==========p_file = " + pvo.getP_file());
		result = adminProductService.productUpdate(pvo);

		if (result == 1) {
			url = "/admin/product/productList.do";
		}else {
			url = "/admin/product/updateForm.do?p_num=" + pvo.getP_num();
		}
		return "redirect:" + url;
	}

	// 상품삭제 구현하기
	@RequestMapping(value = "/product/productDelete.do")
	public String productDelete(@ModelAttribute ProductVO pvo, HttpServletRequest request) throws IOException{
		log.info("productDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다. (1 or 0)
		int result = 0;
		String url = "";
		
		if(pvo.getP_file() != null && pvo.getP_file().length() != 0) {
			FileUploadUtil.fileDelete(pvo.getP_file(), request);
		}

		result = adminProductService.productDelete(pvo.getP_name());

		if (result == 1) {
			url = "/admin/product/productList.do";
		} else {
			url = "/admin/product/productDetail.do?p_name=" + pvo.getP_name();
		}
		return "redirect:" + url;
	}
}
