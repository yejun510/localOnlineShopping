package com.juji.client.review.dao;

import com.juji.client.review.vo.ReviewVO;

public interface ReviewDao {
	public void writeReview(ReviewVO rvo);
	public ReviewVO searchNum(int o_serialnum);
}
