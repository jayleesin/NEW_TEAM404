package com.tasteforming.mapper;
// 장혜림
import java.util.List;

import org.apache.ibatis.annotations.Select;
import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;

public interface BoardMapper {

	//@Select("select * from tbl_board where board_no > 0")
	public List<BoardVO> getList();		//테이블 전체 레코드확인
	
	public List<BoardVO> getListWithPaging(Criteria cri); //페이지, 페이지당 데이터 갯수 
	
	public void insert(BoardVO board);	//삽입을 boardVO에 데이터 삽입
	
	public Integer insertSelectKey(BoardVO board);	

	public BoardVO read(Long board_no);  //추상메서드도 반드시 재정의를 하여 사용

	public int delete(Long board_no);

	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri); //Mybatis에서 전체 데이터의 개수 처리할 것
}
