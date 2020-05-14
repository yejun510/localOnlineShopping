package com.juji.client.notice.vo;

import java.sql.Date;

import com.juji.client.common.vo.CommonVO;

public class NoticeVO extends CommonVO {
	int n_num;
	String n_title;
	String n_content;
	Date n_date;
	String n_writer;
	int n_view;
	String n_image1;
	String n_image2;
	String n_image3;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public int getN_view() {
		return n_view;
	}
	public void setN_view(int n_view) {
		this.n_view = n_view;
	}
	public String getN_image1() {
		return n_image1;
	}
	public void setN_image1(String n_image1) {
		this.n_image1 = n_image1;
	}
	public String getN_image2() {
		return n_image2;
	}
	public void setN_image2(String n_image2) {
		this.n_image2 = n_image2;
	}
	public String getN_image3() {
		return n_image3;
	}
	public void setN_image3(String n_image3) {
		this.n_image3 = n_image3;
	}
	
	
	
	

}
