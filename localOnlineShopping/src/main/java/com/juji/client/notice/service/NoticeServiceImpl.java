package com.juji.client.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.notice.dao.NoticeDao;
import com.juji.client.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	@Inject
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo){
		List<NoticeVO>noticeList = null;
		noticeList = noticeDao.noticeList(nvo);
		return noticeList;
	}
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return noticeDao.noticeDetail(nvo);
	}
	@Override
	public void noticeView(int n_num) {
		noticeDao.noticeView(n_num);
		
	}
	@Override
	public int noticeCnt() {
		return noticeDao.noticeCnt();
	}
	
}
