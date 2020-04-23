package com.juji.client.board.dao;


import java.util.List;

import com.juji.client.board.vo.BoardVO;

public interface BoardDao {

	public List<BoardVO> myBoardList(BoardVO bvo);
	public BoardVO detailBoard(int q_num);
	public void deleteBoard(int q_num);
	public void updateBoard(BoardVO bvo);
	public List<BoardVO>boardList(BoardVO bvo);
	public void insertBoard(BoardVO bvo);
	public void detailView(BoardVO bvo);
	public int boardListCnt(BoardVO bvo);
	public int ectCnt(BoardVO bvo);
}
