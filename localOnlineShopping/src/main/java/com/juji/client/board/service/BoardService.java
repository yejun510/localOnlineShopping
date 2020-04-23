package com.juji.client.board.service;

import java.util.List;

import com.juji.client.board.vo.BoardVO;

public interface BoardService {

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
