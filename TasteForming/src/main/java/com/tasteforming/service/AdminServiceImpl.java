package com.tasteforming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.AdminMemberVO;
import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;

	
	// UserManagement
	@Override public List<AdminMemberVO> getAllMember() {
	log.info(mapper.getAllMember()); return mapper.getAllMember(); }

	@Override
	public List<AdminMemberVO> getMemberWithPaging(Criteria cri) {
		log.info("get MemberList with Criteria==========================");
		return mapper.getMemberWithPaging(cri);
	}
	@Override
	public int getMemberTotalCnt() {
		return mapper.getMemberTotalCnt();
	}

	@Override
	public void updateUser(AdminMemberVO member) {
		log.info(member);
		mapper.updateUser(member);
		
	}

	@Override
	public void deleteUser(AdminMemberVO member) {
		mapper.deleteUser(member);
		
	}

	@Override
	public void deleteUserAuth(AdminMemberVO member) {
		mapper.deleteUserAuth(member);
		
	}

	
	// ResManagement
	@Override
	public List<RestaurantVO> getResWithPaging(Criteria cri) {
		log.info("get ResList with Criteria==========================");
		return mapper.getResWithPaging(cri);
	}

	@Override
	public int getResTotalCnt() {
		return mapper.getResTotalCnt();
	}

	@Override
	public void updateRes(RestaurantVO res) {
		mapper.updateRes(res);
		
	}

	@Override
	public void deleteRes(RestaurantVO res) {
		mapper.deleteRes(res);		
	}

	
	// BoardManagement
	@Override
	public List<BoardVO> getBoardWithPaging(Criteria cri) {
		return mapper.getBoardWithPaging(cri);
	}

	@Override
	public int getBoardTotalCnt() {
		return mapper.getBoardTotalCnt();
	}

	@Override
	public void updateBoard(BoardVO res) {
		mapper.updateBoard(res);
		
	}

	@Override
	public void deleteBoard(BoardVO res) {
		mapper.deleteBoard(res);
		
	}

}
