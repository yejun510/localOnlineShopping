package com.juji.admin.review.service;

import java.util.List;

import com.juji.client.review.vo.ReviewVO;

public interface AdminReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public int reviewDelete(int r_num);

}
