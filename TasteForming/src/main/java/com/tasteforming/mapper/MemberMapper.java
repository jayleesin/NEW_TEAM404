package com.tasteforming.mapper;

import java.util.List;

import com.tasteforming.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	public void createMember(MemberVO member);
	public void createMemberAuth(MemberVO member);
	/*
	 * public int overlappedID(MemberVO memberVO); public int setInsert(MemberVO
	 * member);
	 */
}
