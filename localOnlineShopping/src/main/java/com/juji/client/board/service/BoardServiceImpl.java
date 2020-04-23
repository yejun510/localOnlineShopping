package com.juji.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.board.dao.BoardDao;
import com.juji.client.board.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<BoardVO> myBoardList(BoardVO bvo) {
		return dao.myBoardList(bvo);
	}
	
	@Override
	public BoardVO detailBoard(int q_num) {
		return dao.detailBoard(q_num);
	}
	
	@Override
	public void deleteBoard(int q_num) {
		dao.deleteBoard(q_num);
	}
	
	@Override
	public void updateBoard(BoardVO bvo) {
		dao.updateBoard(bvo);
	}
	
	@Override
	public List<BoardVO>boardList(BoardVO bvo){
		return dao.boardList(bvo);
	}
	
	@Override
	public void insertBoard(BoardVO bvo) {
		dao.insertBoard(bvo);
	}
	
	@Override
	public void detailView(BoardVO bvo) {
		dao.detailView(bvo);
	}
	
	@Override
	public int boardListCnt(BoardVO bvo) {
		return dao.boardListCnt(bvo);
	}
	
	@Override
	public int ectCnt(BoardVO bvo) {
		return dao.ectCnt(bvo);
	}

}
