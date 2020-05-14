package com.juji.client.notice.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList",nvo);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO)session.selectOne("noticeDetail",nvo);
	}

	@Override
	public void noticeView(int n_num) {
		session.update("noticeView",n_num);
		
	}

	@Override
	public int noticeCnt() {
		return session.selectOne("noticeCnt");
	}
	
	

}
