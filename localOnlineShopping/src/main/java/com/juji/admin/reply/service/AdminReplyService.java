package com.juji.admin.reply.service;

import java.util.List;

import com.juji.admin.reply.vo.ReplyVO;

public interface AdminReplyService {

	public List<ReplyVO> replyWrite(ReplyVO rvo);

	public int replyInsert(ReplyVO rvo);

	public int replyDelete(ReplyVO rvo);

	public int replyCnt(ReplyVO rvo);
}
