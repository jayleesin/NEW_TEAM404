package com.tasteforming.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.ReplyVO;
import com.tasteforming.domain.ReviewVO;
import com.tasteforming.domain.TestVO;


public interface ReviewMapper {

	public List<ReviewVO> allReview(long res_No);
	// 리뷰 등록
	public int insert(ReviewVO reviewVO);
	public TestVO getMember();
	
	public int update(ReviewVO reviewVO);
	
	public int deleteReview(long review_no);

	public long getAllReviewer(long res_No);
}