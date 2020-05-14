package com.juji.admin.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.reply.dao.AdminReplyDao;
import com.juji.admin.reply.vo.ReplyVO;

@Service
@Transactional
public class AdminReplyServiceImpl implements AdminReplyService {

	@Autowired
	private AdminReplyDao dao;

	@Override
	public List<ReplyVO> replyWrite(ReplyVO rvo) {
		return dao.replyWrite(rvo);
	}

	// 관리자 댓글 등록
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		try {
			dao.replyInsert(rvo);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 관리자 댓글 삭제
	@Override
	public int replyDelete(ReplyVO rvo) {
		int result = 0;
		try {
			result = dao.replyDelete(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int replyCnt(ReplyVO rvo) {
		return dao.replyCnt(rvo);
	}

}
