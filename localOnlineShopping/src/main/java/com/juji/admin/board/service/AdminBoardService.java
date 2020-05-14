package com.juji.admin.board.service;

import java.util.List;

import com.juji.client.board.vo.BoardVO;

public interface AdminBoardService {

	public List<BoardVO> boardList(BoardVO bvo);

	public BoardVO boardDetail(BoardVO bvo);

	public List<BoardVO> boardCategory(BoardVO bvo);

	public int boardUpdate(BoardVO bvo);
	
	public int listCnt(BoardVO bvo);

}
