package com.juji.client.review.dao;

import java.util.List;

import com.juji.client.review.vo.ReviewVO;

public interface ReviewDao {
	public void writeReview(ReviewVO rvo);
	public ReviewVO searchNum(int o_serialnum);
	public List<ReviewVO> reviewList(String p_num);
	public void reviewUpdate(ReviewVO rvo);
	public ReviewVO reviewUpdateForm(int r_num);
	public void reviewDelete(int r_num);
}
