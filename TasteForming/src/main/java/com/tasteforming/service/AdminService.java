package com.tasteforming.service;

import java.util.List;


import com.tasteforming.domain.AdminMemberVO;
import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.RestaurantVO;

public interface AdminService {
	// UserManagement
	public List<AdminMemberVO> getAllMember();
	public List<AdminMemberVO> getMemberWithPaging(Criteria cri);
	public int getMemberTotalCnt();
	public void updateUser(AdminMemberVO member);
	public void deleteUser(AdminMemberVO member);
	public void deleteUserAuth(AdminMemberVO member);
	
	// ResManagement
	public List<RestaurantVO> getResWithPaging(Criteria cri);
	public int getResTotalCnt();
	public void updateRes(RestaurantVO res);
	public void deleteRes(RestaurantVO res);
	
	
	// BoardManagemet
	public List<BoardVO> getBoardWithPaging(Criteria cri);
	public int getBoardTotalCnt();
	public void updateBoard(BoardVO res);
	public void deleteBoard(BoardVO res);
}
