package com.juji.client.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import com.juji.client.common.vo.CommonVO;

public class NoticeVO extends CommonVO {

	private int n_num; // 게시글 번호
	private String n_title; // 제목
	private String n_content; // 내용
	private String n_date; // 등록일
	private String n_writer; // 작성자
	private int n_view; // 조회수
	private String n_image1; // 이미지1
	private String n_image2; // 아미지2
	private String n_image3; // 이미지3

	private MultipartFile file1; // 첨부파일(이미지)
	private MultipartFile file2; // 첨부파일(이미지)
	private MultipartFile file3; // 첨부파일(이미지)

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

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
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

}
