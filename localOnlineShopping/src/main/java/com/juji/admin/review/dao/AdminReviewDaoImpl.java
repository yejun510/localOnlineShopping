package com.juji.admin.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.review.vo.ReviewVO;

@Repository
public class AdminReviewDaoImpl implements AdminReviewDao {

	@Autowired
	private SqlSession session;

	// 리뷰목록 구현
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		return session.selectList("reviewList", rvo);
	}

	// 리뷰삭제 구현
	@Override
	public int reviewDelete(int r_num) {
		return session.delete("reviewDelete", r_num);
	}

}
