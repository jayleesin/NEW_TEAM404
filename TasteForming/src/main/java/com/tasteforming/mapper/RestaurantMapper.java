package com.tasteforming.mapper;
import java.util.List;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.RestaurantVO;
//getAllData() 메서드를 호출하여 데이터베이스에서 모든 레스토랑 데이터를 가져옵니다.
//RestaurantMapper는 데이터베이스와의 연결을 통해 데이터를 조회하여 RestaurantVO 객체의 리스트로 반환합니다.
public interface RestaurantMapper {
   
   public List<RestaurantVO> getAllData();
   
   public RestaurantVO read(long resNo);
   public void insertRest(RestaurantVO restaurantVO);
   public void likeCnt(RestaurantVO restaurantVO);
}