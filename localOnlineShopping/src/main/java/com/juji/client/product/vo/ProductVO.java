package com.juji.client.product.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.juji.client.common.vo.CommonVO;

public class ProductVO extends CommonVO {
	private String p_num; // 상품번호
	private String p_name; // 상품명
	private String p_weight; // 중량
	private int p_price; // 상품가격
	private String p_origin; // 원산지
	private Date p_date; // 상품등록일
	private String p_detail; // 상품상세정보
	private String p_grade; // 등급
	private String p_history; // 이력번호

	private MultipartFile file; // 첨부파일(상품이미지)
	private String p_file = ""; // 실제서버에 저장한 파일명

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_weight() {
		return p_weight;
	}

	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_origin() {
		return p_origin;
	}

	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public String getP_grade() {
		return p_grade;
	}

	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}

	public String getP_history() {
		return p_history;
	}

	public void setP_history(String p_history) {
		this.p_history = p_history;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getP_file() {
		return p_file;
	}

	public void setP_file(String p_file) {
		this.p_file = p_file;
	}

}
