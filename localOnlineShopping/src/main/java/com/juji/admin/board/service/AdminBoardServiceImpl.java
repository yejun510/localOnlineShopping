package com.juji.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.board.dao.AdminBoardDao;
import com.juji.client.board.vo.BoardVO;

@Service
@Transactional
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private AdminBoardDao adminBoardDao;

	// 글 목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> myList = null;

		myList = adminBoardDao.boardList(bvo);
		return myList;
	}

	// 글 상세 구현
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		BoardVO detail = null;
		detail = adminBoardDao.boardDetail(bvo);
		return detail;
	}

	// 카테고리 구현
	@Override
	public List<BoardVO> boardCategory(BoardVO bvo) {
		return adminBoardDao.boardCategory(bvo);
	}

	// 상세페이지 내부 답변
	@Override
	public int boardUpdate(BoardVO bvo) {
		int result = 0;
		try {
			result = adminBoardDao.boardUpdate(bvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}
	
	//페이징 처리
	@Override
	public int listCnt(BoardVO bvo) {
		return adminBoardDao.listCnt(bvo);
	}

}
