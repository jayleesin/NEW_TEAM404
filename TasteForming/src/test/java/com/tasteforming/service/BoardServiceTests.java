package com.tasteforming.service;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {	//글 새로 등록 

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글gittest");
		board.setContent("새로 작성하는 내용test404");
		board.setUserId("user00");  //임시 더미데이터 member_id 나중에 변경

		service.register(board);

		log.info("생성된 게시물의 번호: " + board.getBoard_no());   // log에 null로 뜸 수정하기
	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}

	@Test
	public void testGetList() {
		//service.getList().forEach());
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}

	@Test
	public void testGet() {

		log.info(service.get(22L));
	}

	@Test
	public void testDelete() {

		log.info("REMOVE RESULT: " + service.remove(44L));

	}

	@Test
	public void testUpdate() {

		BoardVO board = service.get(30L);

		if (board == null) {
			return;
		}

		board.setTitle("제목 수정 service");
		log.info("MODIFY RESULT: " + service.modify(board));
	}

}
