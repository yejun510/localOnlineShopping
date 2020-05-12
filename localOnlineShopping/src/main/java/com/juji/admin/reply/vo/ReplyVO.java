package com.juji.admin.reply.vo;

import com.juji.client.common.vo.CommonVO;

public class ReplyVO extends CommonVO {

	private int a_num; // 댓글번호
	private int q_num; // 게시글번호
	private String a_name; // 작성자
	private String a_date; // 등록일
	private String a_content; // 내용
	private String a_image; // 이미지

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_image() {
		return a_image;
	}

	public void setA_image(String a_image) {
		this.a_image = a_image;
	}

}
