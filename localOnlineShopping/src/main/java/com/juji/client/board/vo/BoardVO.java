package com.juji.client.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.juji.client.common.vo.CommonVO;

public class BoardVO extends CommonVO{

	private int q_num;
	private String id;
	private String q_title;
	private String q_date;
	private String q_content;
	private String q_writer;
	private String q_category;
	private int q_reply;
	private int q_passwd;
	private int q_view;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private String q_image1;
	private String q_image2;
	private String q_image3;
	
	
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public int getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(int q_reply) {
		this.q_reply = q_reply;
	}
	public int getQ_passwd() {
		return q_passwd;
	}
	public void setQ_passwd(int q_passwd) {
		this.q_passwd = q_passwd;
	}
	public int getQ_view() {
		return q_view;
	}
	public void setQ_view(int q_view) {
		this.q_view = q_view;
	}
	public String getQ_image1() {
		return q_image1;
	}
	public void setQ_image1(String q_image1) {
		this.q_image1 = q_image1;
	}
	public String getQ_image2() {
		return q_image2;
	}
	public void setQ_image2(String q_image2) {
		this.q_image2 = q_image2;
	}
	public String getQ_image3() {
		return q_image3;
	}
	public void setQ_image3(String q_image3) {
		this.q_image3 = q_image3;
	}
	
	
}
