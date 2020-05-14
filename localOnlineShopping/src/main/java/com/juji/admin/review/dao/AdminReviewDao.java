package com.juji.admin.review.dao;

import java.util.List;

import com.juji.client.review.vo.ReviewVO;

public interface AdminReviewDao {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public int reviewDelete(int r_num);

}
