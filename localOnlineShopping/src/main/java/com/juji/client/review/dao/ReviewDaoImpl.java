package com.juji.client.review.dao;

import java.util.List;

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
	
	@Override
	public ReviewVO searchNum(int o_serialnum) {
	
	return	session.selectOne("searchNum",o_serialnum);
	}

	@Override
	public List<ReviewVO> reviewList(String p_num) {
		return session.selectList("reviewList",p_num);
	}

	@Override
	public void reviewUpdate(ReviewVO rvo) {
			session.update("reviewUpdate",rvo);
		
	}

	@Override
	public ReviewVO reviewUpdateForm(int r_num) {
		return session.selectOne("reviewUpdateForm",r_num);
	}

	@Override
	public void reviewDelete(int r_num) {
		session.delete("reviewDelete",r_num);
	}

}
