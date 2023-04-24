package com.tasteforming.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.tasteforming.domain.BoardVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private AdminService service;

	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);
		log.info(service.getAllMember());
	}

//	@Test
//	public void testRegister() {	//글 새로 등록 
//
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글gittest");
//		board.setContent("새로 작성하는 내용test404");
//		board.setUserId("user00");  //임시 더미데이터 member_id 나중에 변경
//
//	}
}