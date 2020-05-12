package com.juji.admin.notice.service;

import java.util.List;

import com.juji.client.notice.vo.NoticeVO;

public interface AdminNoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public void noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int n_num);

	public int updateViewCnt(int n_num);

	public int listCnt(NoticeVO nvo);
}
