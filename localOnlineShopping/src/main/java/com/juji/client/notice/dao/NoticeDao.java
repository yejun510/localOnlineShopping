package com.juji.client.notice.dao;

import java.util.List;

import com.juji.client.notice.vo.NoticeVO;


public interface NoticeDao {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);
	
	public void noticeView(int n_num);

	public int noticeCnt();

}
