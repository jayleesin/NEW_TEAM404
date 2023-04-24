package com.tasteforming.service;

import java.util.Date;
import java.util.List;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.RestaurantVO;

public interface RestaurantService {

    // 레스토랑 목록 조회
    public List<RestaurantVO> getAllData();
    public void RestRegister(RestaurantVO restaurantVO);
    public void likeCnt(RestaurantVO restaurantVO);
}