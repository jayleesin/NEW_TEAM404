package com.tasteforming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;
import com.tasteforming.mapper.AdminMapper;
import com.tasteforming.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	MyPageMapper mapper;
	
	// 예약 정보 가져오기 (김정우)
	@Override
	public List<ReserveVO> getReservation(MemberVO member) {
		return mapper.getReservation(member);
	}
	

	
}
