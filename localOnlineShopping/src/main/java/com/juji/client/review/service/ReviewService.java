package com.juji.client.review.service;

import com.juji.client.review.vo.ReviewVO;

public interface ReviewService {
	public void writeReview(ReviewVO rvo);
	public ReviewVO searchNum(int o_serialnum);
}
