package com.juji.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.notice.dao.AdminNoticeDao;
import com.juji.client.notice.vo.NoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDao dao;

	// 글 목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;

		myList = dao.noticeList(nvo);
		return myList;
	}

	// 글 입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
		try {
			result = dao.noticeInsert(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = dao.noticeDetail(nvo);
		return detail;
	}

	// 글 수정 구현
	@Override
	public void noticeUpdate(NoticeVO nvo) {

		dao.noticeUpdate(nvo);

	}

	// 글 삭제 구현
	@Override
	public int noticeDelete(int n_num) {
		int result = 0;
		try {
			result = dao.noticeDelete(n_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 조회수 구현
	@Override
	public int updateViewCnt(int n_num) {
		return dao.updateViewCnt(n_num);
	}

	// 페이징 처리
	@Override
	public int listCnt(NoticeVO nvo) {
		return dao.listCnt(nvo);
	}

}
