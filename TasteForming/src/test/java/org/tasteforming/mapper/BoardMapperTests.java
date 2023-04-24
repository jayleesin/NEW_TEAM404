package org.tasteforming.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.tasteforming.domain.BoardVO;
import com.tasteforming.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src//main//webapp//WEB-INF//spring//root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testGetList() {

		mapper.getList().forEach(board -> log.info(board));

	}

	@Test
	public void testInsert() {

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글2404");
		board.setContent("새로 작성하는 내용");
		board.setUserId("user00");

		mapper.insert(board);

		log.info(board);
	}

//	@Test
//	public void testInsertSelectKey() {
//
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setMember_id("user22");
//
//		mapper.insertSelectKey(board);
//
//		log.info(board);
//	}

//	@Test
//	public void testRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		BoardVO board = mapper.read(22L);
//
//		log.info(board);
//
//	}
//
//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT: " + mapper.delete(29L));
//	}

//	@Test
//	public void testUpdate() {
//
//		BoardVO board = new BoardVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setBoard_no(30L);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
////		board.setMember_id("user22");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri =new Criteria();
//		
//		//*.xml에 있는 #{}에 값을 대입
//		cri.setPageNum(4); //10개씩 3페이지
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(board->log.info(board));
//	}
//	
//	@Test
//	  public void testSearch() {
//		
//	    Criteria cri = new Criteria();
//	    cri.setKeyword("테스트");
//	    cri.setType("TC");
//	    
//	    List<BoardVO> list = mapper.getListWithPaging(cri);
//	    
//	    list.forEach(board -> log.info(board));
//	  }

}
