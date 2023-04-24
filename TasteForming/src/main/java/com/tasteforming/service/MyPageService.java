package com.tasteforming.service;

import java.util.List;


import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;

public interface MyPageService {
	
	// 예약 정보 가져오기 (김정우)
	public List<ReserveVO> getReservation(MemberVO member);
}
