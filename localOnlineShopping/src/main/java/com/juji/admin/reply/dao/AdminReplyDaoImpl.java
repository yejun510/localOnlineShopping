package com.juji.admin.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.admin.reply.vo.ReplyVO;

public class AdminReplyDaoImpl implements AdminReplyDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ReplyVO> replyWrite(ReplyVO rvo) {
		return session.selectList("adminReplyList");
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		return session.insert("boardInsert", rvo);
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		return session.delete("replyDelete", rvo);
	}

	@Override
	public int replyCnt(ReplyVO rvo) {
		return session.selectOne("replyCnt",rvo);
	}

}
