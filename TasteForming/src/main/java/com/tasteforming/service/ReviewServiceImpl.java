package com.tasteforming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.ReviewVO;
import com.tasteforming.domain.TestVO;
import com.tasteforming.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public void insert(ReviewVO reviewVO) {
		reviewMapper.insert(reviewVO);
	}

	@Override
	public void update(ReviewVO reviewVO) {
		reviewMapper.update(reviewVO);
	}

	@Override
	public List<ReviewVO> allReview(long res_No) {
		log.info("get.....");
		return reviewMapper.allReview(res_No);
	}

	@Override
	public void deleteReview(long resview_no) {
		reviewMapper.deleteReview(resview_no);
	}

	@Override
	public long getAllReviewer(long res_No) {
		return reviewMapper.getAllReviewer(res_No);
	}
	
}