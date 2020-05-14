package com.juji.client.review.vo;


import org.springframework.web.multipart.MultipartFile;


public class ReviewVO {
	private int r_num;
	private String p_num;
	private String id;
	private int o_serialnum;
	private String r_writer;
	private String r_date;
	private MultipartFile r_file;
	private String r_image;
	private String r_content;
	private String r_satisfaction;
	
	
	
	public MultipartFile getR_file() {
		return r_file;
	}
	public void setR_file(MultipartFile r_file) {
		this.r_file = r_file;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	public String getR_image() {
		return r_image;
	}
	public void setR_image(String r_image) {
		this.r_image = r_image;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_satisfaction() {
		return r_satisfaction;
	}
	public void setR_satisfaction(String r_satisfaction) {
		this.r_satisfaction = r_satisfaction;
	}
	public int getO_serialnum() {
		return o_serialnum;
	}
	public void setO_serialnum(int o_serialnum) {
		this.o_serialnum = o_serialnum;
	}
	
	
	
	
	
	
}
