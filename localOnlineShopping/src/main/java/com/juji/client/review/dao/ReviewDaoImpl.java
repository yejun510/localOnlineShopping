package com.juji.client.review.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.review.vo.ReviewVO;

public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void writeReview(ReviewVO rvo) {
		session.update("writeReview",rvo);

	}

}
