package com.juji.client.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.board.vo.BoardVO;
import com.juji.client.reply.vo.ReplyVO;

public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<BoardVO> myBoardList(BoardVO bvo) {
		return session.selectList("myBoardList",bvo);
	}
	
	@Override
	public BoardVO detailBoard(int q_num) {
		return session.selectOne("detailBoard",q_num);
	}
	
	@Override
	public void deleteBoard(int q_num) {
		session.update("deleteBoard",q_num);
	}
	
	@Override
	public void updateBoard(BoardVO bvo) {
		session.update("updateBoard",bvo);
	}

	@Override
	public List<BoardVO>boardList(BoardVO bvo){
		return session.selectList("boardList",bvo);
	}
	
	@Override
	public void insertBoard(BoardVO bvo){
		session.update("insertBoard",bvo);
	}
	
	@Override
	public void detailView(BoardVO bvo) {
		session.update("detailView",bvo);
	}
	
	@Override
	public int boardListCnt(BoardVO bvo) {
		return session.selectOne("boardListCnt",bvo);
	}
	
	@Override
	public int ectCnt(BoardVO bvo) {
		return session.selectOne("ectCnt",bvo);
	}

	@Override
	public int myBoardListCnt(BoardVO bvo) {
		return session.selectOne("myBoardListCnt",bvo);
	}

	@Override
	public int myEctCnt(BoardVO bvo) {
		return session.selectOne("myEctCnt",bvo);
	}

	@Override
	public List<ReplyVO> replyList(int q_num) {
		return session.selectList("replyList",q_num);
	}

	@Override
	public void replyDelete(int q_num) {
		session.delete("replyDelete",q_num);
	}
	
}
