package com.tasteforming.service;
// 장혜림
import java.util.List;

import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board); //read

	public BoardVO get(Long board_no); //select bno 글상세

	public boolean modify(BoardVO board); //update 수정

	public boolean remove(Long board_no); //delete

//		public List<BoardVO> getList(); //select * 전체리스트
	
	public List<BoardVO> getList(Criteria cri); //페이징
	
	public int getTotalCount(Criteria cri);	// 전체데이터 개수 처리
}
