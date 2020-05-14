package com.juji.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.review.dao.AdminReviewDao;
import com.juji.client.review.vo.ReviewVO;

@Service
@Transactional
public class AdminReviewServiceImpl implements AdminReviewService {

	@Autowired
	private AdminReviewDao adminReviewDao;

	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> reviewList = null;
		reviewList = adminReviewDao.reviewList(rvo);
		return reviewList;
	}

	@Override
	public int reviewDelete(int r_num) {
		int result = 0;
		try {
			result = adminReviewDao.reviewDelete(r_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
