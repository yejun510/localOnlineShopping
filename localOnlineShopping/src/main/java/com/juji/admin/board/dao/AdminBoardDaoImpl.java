package com.juji.admin.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.board.vo.BoardVO;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		return session.selectList("boardList");
	}

	// 글 상세 구현
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		return (BoardVO) session.selectOne("boardDetail", bvo);
	}

	// 상세 페이지 카테고리 구현
	@Override
	public List<BoardVO> boardCategory(BoardVO bvo) {
		return session.selectList("boardCategory", bvo);
	}

	// 상세페이지 내부 답변
	@Override
	public int boardUpdate(BoardVO bvo) {
		return session.update("boardUpdate", bvo);
	}
	
	//페이징 처리
	@Override
	public int listCnt(BoardVO bvo) {
		return session.selectOne("listCnt");
	}


}
