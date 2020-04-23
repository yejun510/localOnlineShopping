package com.juji.client.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.review.dao.ReviewDao;
import com.juji.client.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Override
	public void writeReview(ReviewVO rvo) {
		dao.writeReview(rvo);
	}
	
	@Override
	public ReviewVO searchNum(int o_serialnum) {
	
		return dao.searchNum(o_serialnum);
	}

}
