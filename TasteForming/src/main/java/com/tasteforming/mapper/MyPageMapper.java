package com.tasteforming.mapper;

import java.util.List;


import com.tasteforming.domain.AdminMemberVO;
import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;
import com.tasteforming.domain.RestaurantVO;

public interface MyPageMapper {
	
	// 예약 정보 가져오기 (김정우)
	public List<ReserveVO> getReservation(MemberVO member);
}
