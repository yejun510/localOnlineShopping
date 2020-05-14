package com.juji.client.notice.service;

import java.util.List;

import com.juji.client.notice.vo.NoticeVO;
import com.juji.client.product.vo.ProductVO;

public interface NoticeService {

	List<NoticeVO> noticeList(NoticeVO nvo);
	NoticeVO noticeDetail(NoticeVO nvo);
	public void noticeView(int n_num);
	public int noticeCnt();

}
