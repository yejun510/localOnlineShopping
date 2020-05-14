package com.juji.client.review.service;

import java.util.List;

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

	@Override
	public List<ReviewVO> reviewList(String p_num) {
		return dao.reviewList(p_num);
	}

	@Override
	public void reviewUpdate(ReviewVO rvo) {
			dao.reviewUpdate(rvo);
		
	}

	@Override
	public ReviewVO reviewUpdateForm(int r_num) {
		return dao.reviewUpdateForm(r_num);
	}

	@Override
	public void reviewDelete(int r_num) {
		dao.reviewDelete(r_num);
	}

}
