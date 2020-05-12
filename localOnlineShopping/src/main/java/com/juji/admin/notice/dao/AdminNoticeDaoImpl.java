package com.juji.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.notice.vo.NoticeVO;

public class AdminNoticeDaoImpl implements AdminNoticeDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	}

	// 글 입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	// 글 수정 구현
	@Override
	public void noticeUpdate(NoticeVO nvo) {
		session.update("noticeUpdate", nvo);
	}

	// 글 삭제 구현
	@Override
	public int noticeDelete(int n_num) {
		return session.delete("noticeDelete", n_num);
	}

	// 조회수 구현
	@Override
	public int updateViewCnt(int n_num) {
		return session.update("updateViewCnt", n_num);
	}

	// 페이징 처리
	@Override
	public int listCnt(NoticeVO nvo) {
		return session.selectOne("listCnt");
	}

}
