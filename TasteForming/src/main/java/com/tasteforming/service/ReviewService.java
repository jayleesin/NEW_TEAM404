package com.tasteforming.service;

import java.util.List;

import com.tasteforming.domain.ReviewVO;
import com.tasteforming.domain.TestVO;

public interface ReviewService {
	
	// 리뷰 등록
	public void insert(ReviewVO reviewVO);
	// 댓글 가져오기
	public List<ReviewVO> allReview(long res_No);
	// 리뷰 수정
	public void update(ReviewVO reviewVO);
	
	// 리뷰 삭제
	public void deleteReview(long resview_no);
	public long getAllReviewer(long res_No);
}