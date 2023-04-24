package com.tasteforming.mapper;

import java.util.List;

import com.tasteforming.domain.RestaurantVO;

// 김정우


// Mapper 에서 키워드를 바탕으로 데이터를 가져오기 위해서는 어떻게 해야할까?

public interface MainMapper {
	public List<RestaurantVO> getAllData();
	public List<RestaurantVO> getSearch(String keyword);;
	public RestaurantVO read(long resNo);
}
